part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final int duration;
  final String imageUrl;
  final bool apiCall;
  const HomeState(this.duration,this.imageUrl, this.apiCall);
  @override
  List<Object> get props => [duration,imageUrl,apiCall];
}

class InitialState extends HomeState {
  InitialState(super.duration,super.imageUrl,super.apiCall);
  @override
  List<Object> get props => [];
}

class PauseState extends HomeState{
  const PauseState(super.duration,super.imageUrl,super.apiCall);
  @override
  String toString() => 'Pause tick ->  $duration';
}

class ProgressState extends HomeState {
  const ProgressState(super.duration,super.imageUrl,super.apiCall);
  @override
  String toString() => '${apiCall?'api Call':'rewind'} in progress tick -> $duration';
}

class LimitCompleteState extends HomeState {
  const LimitCompleteState(super.duration,super.imageUrl,super.apiCall);

  @override
  String toString() => 'limit completed  tick -> 0';
}




