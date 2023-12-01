import 'package:dartz/dartz.dart';
import 'package:weather_app/src/common/util/failures.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/params/card_params.dart';
import 'package:weather_app/src/features/main/screens/card/data/models/card_reposone.dart';
import 'package:weather_app/src/features/main/screens/card/domain/params/get_cards_params.dart';

abstract class CardRepository {
  const CardRepository();
  Future<Either<Failure, bool>> setCard(CardAddParams params);
  Future<Either<Failure, CardResponse>> getCards(GetCardsParams params);
}