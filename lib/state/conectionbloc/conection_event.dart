part of 'conection_bloc.dart';

abstract class ConectionEvent extends Equatable {
  const ConectionEvent();

  @override
  List<Object> get props => [];
}

class InicialConection extends ConectionEvent {
  final ConeccionModel coneccionModel;

  const InicialConection({required this.coneccionModel});

  @override
  List<Object> get props => [coneccionModel];
}

class SoundOff extends ConectionEvent {
  final String command = "amixer -D pulse sset Master unmute";
  const SoundOff();

  @override
  List<Object> get props => [command];
}

class SoundON extends ConectionEvent {
  final String command = "amixer -D pulse sset Master mute";
  const SoundON();

  @override
  List<Object> get props => [command];
}
