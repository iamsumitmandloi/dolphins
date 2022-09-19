import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/get_image_client.dart';
import '../data/ticker.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Ticker _ticker;
  static const int _duration = 1;
  StreamSubscription<int>? _tickerSubscription;
  List rewindList = [];
  HomeBloc({required Ticker ticker}) : _ticker = ticker ,
        super(InitialState(_duration,'',true)) {
      on<StartEvent>(_started);
      on<ProgressEvent>(_progress);
      on<PausedEvent>(_pause);
      on<ResumedEvent>(_resumed);
      on<RewindEvent>(_rewind);
  }

  void _rewind(HomeEvent event, Emitter<HomeState> emit) {
    _tickerSubscription?.cancel();
    emit(InitialState(_duration,'rewind',false));
    ///here we are adding the event for rewind -> start rewinding the last 5 pics....
    if(rewindList.isNotEmpty) {
      add(StartEvent(duration: rewindList.length,imageUrl: rewindList[rewindList.length-1]??'',apiCall: false));
    }
  }

  void _started(StartEvent event, Emitter<HomeState> emit) async{
    emit(ProgressState(event.duration,event.imageUrl,event.apiCall));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(event.duration).listen((duration) async {
      String newImgUrl = event.apiCall?await UnSplashClient().getImages():rewindList.length>0?rewindList[rewindList.length-1]:'';
      if(newImgUrl=='403'){
        add(ProgressEvent(0, 'limit', event.apiCall));
      }
      else{
        event.apiCall ? addUrlInList(newImgUrl) : rewindList.removeLast();
        add(ProgressEvent(duration, newImgUrl, event.apiCall));
      }
    },);
  }

  void _progress(ProgressEvent event, Emitter<HomeState> emit) {
    emit(event.duration > 0
        ? ProgressState(event.duration,event.imageUrl,event.apiCall)
        : state.apiCall? LimitCompleteState(0,event.imageUrl,event.apiCall):InitialState(0, '', true));
  }

  void _pause(HomeEvent event, Emitter<HomeState> emit) {
    if (state is ProgressState) {
      _tickerSubscription?.pause();
      emit(PauseState(state.duration,state.imageUrl,state.apiCall));
    }
  }

  void _resumed(HomeEvent event, Emitter<HomeState> emit) {
    if (state is PauseState) {
      _tickerSubscription?.resume();
      emit(ProgressState(state.duration,state.imageUrl,state.apiCall));
    }
  }

  @override
  Future<void> close() async {
    _tickerSubscription?.cancel();
    super.close();
  }
  addUrlInList(newImgUrl){
    if(rewindList.length<5) {
      rewindList.add(newImgUrl);
    } else{
      rewindList.removeAt(0);
      rewindList.add(newImgUrl);
    }
  }
}