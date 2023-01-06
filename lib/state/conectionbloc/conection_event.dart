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
  final String command = "amixer -D pulse sset Master mute";
  // final String command = "amixer set Master mute;amixer set Speaker mute";
  const SoundOff();

  @override
  List<Object> get props => [command];
}

class SoundON extends ConectionEvent {
  final String command = "amixer -D pulse sset Master unmute";
  // final String command = "amixer set Speaker unmute;amixer set Master unmute";
  const SoundON();

  @override
  List<Object> get props => [command];
}

class Chrome extends ConectionEvent {
  // final String command = "DISPLAY=:0 nohup google-chrome --no-sandbox";
  final String command = "DISPLAY=:0 nohup google-chrome";
  const Chrome();

  @override
  List<Object> get props => [command];
}

class VScode extends ConectionEvent {
  final String command = "DISPLAY=:0 nohup code";
  // "DISPLAY=:0 nohup code --no-sandbox --user-data-dir='~/.vscode-root'";
  // final String command = "code";
  const VScode();

  @override
  List<Object> get props => [command];
}

class AndroidStudio extends ConectionEvent {
  final String command =
      "DISPLAY=:0 sh /home/juan/android-studio/bin/studio.sh";
  const AndroidStudio();

  @override
  List<Object> get props => [command];
}

class Terminal extends ConectionEvent {
  final String command = "DISPLAY=:0 nohup konsole -e /bin/zsh";
  const Terminal();

  @override
  List<Object> get props => [command];
}

class Dolphin extends ConectionEvent {
  final String command = "DISPLAY=:0 nohup dolphin --new-window";
  const Dolphin();

  @override
  List<Object> get props => [command];
}

class MicON extends ConectionEvent {
  final String command = "amixer -D pulse sset Capture cap";
  const MicON();

  @override
  List<Object> get props => [command];
}

class MicOff extends ConectionEvent {
  final String command = "amixer -D pulse sset Capture nocap";
  const MicOff();

  @override
  List<Object> get props => [command];
}
