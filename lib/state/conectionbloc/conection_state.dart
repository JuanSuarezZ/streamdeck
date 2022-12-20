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
  final SSHClient? sshClient;
  final ConeccionModel? coneccionModel;
  final ConectionStatus status;

  const ConectionState({
    this.sshClient,
    this.coneccionModel,
    this.status = ConectionStatus.initial,
  });

  @override
  List<Object?> get props => [sshClient, coneccionModel, status];

  ConectionState copyWith({
    SSHClient? sshClient,
    ConeccionModel? coneccionModel,
    required ConectionStatus status,
  }) {
    return ConectionState(
      sshClient: sshClient ?? this.sshClient,
      coneccionModel: coneccionModel ?? this.coneccionModel,
      status: status,
    );
  }
}
