part of 'conection_bloc.dart';

@immutable
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
