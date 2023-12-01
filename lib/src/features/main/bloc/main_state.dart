part of 'main_bloc.dart';

class MainState extends Equatable {
  final MainStatus status;
  final int page;

  const MainState({
    required this.status,
    required this.page,
  });

  MainState copyWith({
    MainStatus? status,
    int? page,
  }) =>
      MainState(
        status: status ?? this.status,
        page: page ?? this.page,
      );

  @override
  String toString() => 'MainState{status: $status, page: $page}';

  @override
  List<Object?> get props => [status, page];
}

enum MainStatus {
  initial,
  changeScreen,
}
