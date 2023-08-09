import 'package:equatable/equatable.dart';

abstract class Failure  extends Equatable{
  final String messageFail;
  const Failure({required this.messageFail});
  @override
  List<Object> get props => [messageFail,];


}
class ServerFailure extends Failure {
  const ServerFailure({required super.messageFail});
}