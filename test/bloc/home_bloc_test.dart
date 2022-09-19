import 'package:flutter_test/flutter_test.dart';
import 'package:new_app/bloc/home_bloc.dart';
import 'package:new_app/data/ticker.dart';
import 'package:bloc_test/bloc_test.dart';
void main(){
  group('HomeBloc', () {
    late HomeBloc home_bloc;
    setUp(() {
      home_bloc = HomeBloc(ticker: const Ticker());
    });
    tearDown((){
      home_bloc.close();
    });

    test('the initial state for HomeBloc is => InitialState(_duration,"",true)', () {
      expect(home_bloc.state, InitialState(1,"",true));
    });

    blocTest<HomeBloc, HomeState>('when click on the play button first time , ProgressState should be emitted',
      build: () => home_bloc ,
      act: (bloc) => bloc.add(const StartEvent(duration:50,imageUrl:'',apiCall: true)),
      expect: () => [const ProgressState(50, '', true)],
    );
    blocTest<HomeBloc, HomeState>('when click on the rewind button , InitialState should be emitted',
      build: () => home_bloc ,
      act: (bloc) => bloc.add(const RewindEvent()),
      expect: () => [InitialState(5, '', false)],
    );
  });
}