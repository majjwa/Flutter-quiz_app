part of 'user_result_cubit.dart';

class UserResultState extends Equatable {

  final ResultState state;
  final Map<int, int?> selectedanswers;

  const UserResultState({
    this.state = ResultState.Loading,
    this.selectedanswers = const {},
  });

  UserResultState copyWith({
    required ResultState? state,
    required Map<int, int?>? selectedanswers,
  }) {
    return UserResultState(
      state: state ?? this.state,
      selectedanswers: selectedanswers ?? this.selectedanswers,
    );
  }

  @override
  List<Object> get props => [state, selectedanswers];
}
