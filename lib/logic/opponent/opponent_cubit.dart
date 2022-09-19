import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import "package:bonkbonk/imports.dart";

part 'opponent_state.dart';

class OpponentCubit extends Cubit<OpponentState> {
  int? opponentID;
  String? name;
  String? surname;
  OpponentCubit({
    required this.name,
    required this.opponentID,
    required this.surname,
  }) : super(OpponentState(
          name: name,
          opponentID: opponentID,
          surname: surname,
        ));

  changeOpponent({
    name,
    opponentID,
    surname,
  }) {
    emit(OpponentState(
      name: name,
      opponentID: opponentID,
      surname: surname,
    ));
  }
}
