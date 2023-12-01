import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/common/service/local_data_storage/local_data_storage.dart';
import 'package:weather_app/src/common/util/failures.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/params/card_params.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';
import 'package:weather_app/src/features/main/screens/card/data/models/card_reposone.dart';
import 'package:weather_app/src/features/main/screens/card/domain/params/get_cards_params.dart';

class CardRepositoryImpl implements CardRepository {
  @override
  Future<Either<Failure, CardResponse>> getCards(GetCardsParams params) async {
    try {
      final data = await LocalDataStorage.getCars();
      return Right(CardResponse(cards: data));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return const Left(CacheFailure(message: 'Local Data Error'));
    }
  }

  @override
  Future<Either<Failure, bool>> setCard(CardAddParams params) async {
    try {
      final oldData = await LocalDataStorage.getCars();
      LocalDataStorage.setCard([...oldData, params.card]);
      return const Right(true);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return const Left(CacheFailure(message: 'Local Data Storage Error'));
    }
  }
}
