part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  List<Object> get props => [];
}

class StartEvent extends HomeEvent{
  const StartEvent({required this.duration, required this.imageUrl, required this.apiCall});
  final int duration;
  final String imageUrl;
  final bool apiCall;
}
class PausedEvent extends HomeEvent{
  const PausedEvent();
}

class ResumedEvent extends HomeEvent{
  const ResumedEvent();
}

class RewindEvent extends HomeEvent{
  const RewindEvent();
}

class ProgressEvent extends HomeEvent{
  const ProgressEvent(this.duration,this.imageUrl,this.apiCall);
  final int duration;
  final String imageUrl;
  final bool apiCall;

  @override
  List<Object> get props => [duration,imageUrl,apiCall];
}