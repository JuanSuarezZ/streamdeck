part of 'conection_bloc.dart';

enum ConectionStatus { initial, success, error, loading, selected }

extension ConectionStateX on ConectionStatus {
  bool get isInitial => this == ConectionStatus.initial;
  bool get isSuccess => this == ConectionStatus.success;
  bool get isError => this == ConectionStatus.error;
  bool get isLoading => this == ConectionStatus.loading;
  bool get isSelected => this == ConectionStatus.selected;
}

class ConectionState extends Equatable {
  final int port;
  final String ip;
  final String username;
  final String password;
  final ConectionStatus status;
  SSHClient? sshClient;

  ConectionState(
    SSHClient? sshClient, {
    this.username = '',
    this.port = 0,
    this.password = ' ',
    this.ip = '',
    this.status = ConectionStatus.initial,
  });

  @override
  List<Object?> get props => [port, ip, username, password, status];

  ConectionState copyWith(SSHClient? sshClient,
      {String? username,
      int? port,
      String? password,
      String? ip,
      required ConectionStatus status}) {
    return ConectionState(
      sshClient,
      ip: ip!,
      port: port!,
      password: password!,
      username: username!,
      status: status,
    );
  }
}
