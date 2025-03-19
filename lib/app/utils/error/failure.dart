
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  ///store error message optionally
  final String? error;

  const Failure({required this.error});
}

class GeneralFailures extends Failure {
  const GeneralFailures({super.error});

  @override
  List<Object?> get props => [error];
}
