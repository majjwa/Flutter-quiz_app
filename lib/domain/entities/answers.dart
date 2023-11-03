import 'package:equatable/equatable.dart';

class Answers extends Equatable {
  final String? answerA;
  final String? answerB;
  final String? answerC;
  final String? answerD;
  const Answers({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
  });

  @override
  List<Object?> get props => [answerA, answerB, answerC, answerD];
}
