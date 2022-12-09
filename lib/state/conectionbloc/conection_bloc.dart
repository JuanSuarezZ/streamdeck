import 'dart:async';
import 'dart:developer' as dev;
import 'package:bloc/bloc.dart';
import 'package:dartssh2/dartssh2.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:streamdeck/state/conectionSingelton/ssh_singelton.dart';

part 'conection_event.dart';
part 'conection_state.dart';

class ConectionBloc extends Bloc<ConectionEvent, ConectionState> {
  //
  ConectionBloc() : super(ConectionState(null)) {
    on<InicialConection>(onInicialConectionHandler);
  }

  Future<void> onInicialConectionHandler(
    InicialConection event,
    Emitter<ConectionState> emit,
  ) async {
    //business logic
    final ssh = SSHSingleton();
    await ssh.initSSHClient();

    dev.log("${event.props}");
    emit(
      state.copyWith(
        ssh.client,
        ip: event.ip,
        password: event.password,
        port: event.port,
        username: event.username,
        status: ConectionStatus.success,
      ),
    );
  }
}
