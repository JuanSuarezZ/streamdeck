part of 'conection_bloc.dart';

@immutable
abstract class ConectionEvent extends Equatable {
  const ConectionEvent();

  @override
  List<Object> get props => [];
}

class InicialConection extends ConectionEvent {
  final String username;
  final int port;
  final String password;
  final String ip;

  const InicialConection({
    required this.port,
    required this.username,
    required this.password,
    required this.ip,
  });

  @override
  List<Object> get props => [
        port,
        username,
        password,
        ip,
      ];
}
