part of 'opponent_cubit.dart';

class OpponentState extends Equatable {
  int? opponentID;
  String? name;
  String? surname;
  OpponentState({
    required this.name,
    required this.opponentID,
    required this.surname,
  });
  @override
  List<Object> get props => [];
}
