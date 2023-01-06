import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartssh2/dartssh2.dart';
import 'package:equatable/equatable.dart';
import 'package:streamdeck/models/coneccion_model.dart';
import 'package:streamdeck/state/conectionSingelton/ssh_singelton.dart';

part 'conection_event.dart';
part 'conection_state.dart';

class ConectionBloc extends Bloc<ConectionEvent, ConectionState> {
  //
  ConectionBloc() : super(const ConectionState()) {
    on<InicialConection>(onInicialConectionHandler);
    on<AndroidStudio>(androidStudio);
    on<SoundOff>(onSoundOff);
    on<SoundON>(onSoundON);
    on<Chrome>(onChrome);
    on<VScode>(vscode);
    on<Terminal>(terminal);
    on<Dolphin>(dolphin);
    on<MicON>(micON);
    on<MicOff>(micOff);
  }

  Future<void> micOff(
    MicOff event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> micON(
    MicON event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> dolphin(
    Dolphin event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> terminal(
    Terminal event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> androidStudio(
    AndroidStudio event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> vscode(
    VScode event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> onChrome(
    Chrome event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> onSoundON(
    SoundON event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic

    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> onSoundOff(
    SoundOff event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic

    try {
      await runCommand(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
          status: ConectionStatus.error,
        ),
      );
      dev.log("${state.props}");
    }
  }

  Future<void> onInicialConectionHandler(
    InicialConection event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    final ssh = SSHSingleton();
    await ssh.initSSHClient(event.coneccionModel);

    emit(
      state.copyWith(
        sshClient: ssh.client,
        coneccionModel: event.coneccionModel,
        status: ConectionStatus.success,
      ),
    );
    dev.log("${state.props}");
  }

  runCommand(event, emit) async {
    final ssh = SSHSingleton();
    final uptime = await ssh.client?.run(event.command);

    log(utf8.decode(uptime!).toString());
    emit(
      state.copyWith(
        status: ConectionStatus.success,
      ),
    );
    dev.log("${event.props}");
  }
}
