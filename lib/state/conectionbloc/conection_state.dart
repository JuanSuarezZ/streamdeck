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
  SSHClient? sshClient;
  ConeccionModel? coneccionModel;
  ConectionStatus status;

  ConectionState(
    SSHClient? sshClient, {
    this.coneccionModel,
    this.status = ConectionStatus.initial,
  });

  @override
  List<Object?> get props => [sshClient, coneccionModel, status];

  ConectionState copyWith(SSHClient? sshClient,
      {ConeccionModel? coneccionModel, required ConectionStatus status}) {
    return ConectionState(
      sshClient,
      coneccionModel: coneccionModel,
      status: status,
    );
  }
}
