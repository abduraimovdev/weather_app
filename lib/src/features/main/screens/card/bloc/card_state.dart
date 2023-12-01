part of 'card_bloc.dart';

enum CardStatus {
  initial,
  success,
  error,
  loading,
}

class CardState extends Equatable {
  final CardStatus status;
  final CardResponse? data;

  const CardState({
    required this.status,
    this.data,
  });

  @override
  List<Object?> get props => [status, data];

  CardState copyWith({
    CardStatus? status,
    CardResponse? data,
  }) {
    return CardState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
