import 'package:dartz/dartz.dart';
import 'package:weather_app/src/common/util/failures.dart';
import 'package:weather_app/src/common/util/usecase.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';
import 'package:weather_app/src/features/main/screens/card/data/models/card_reposone.dart';
import 'package:weather_app/src/features/main/screens/card/domain/params/get_cards_params.dart';

class GetCards implements UseCase<CardResponse, GetCardsParams> {
  final CardRepository repository;
  const GetCards({required this.repository});
  @override
  Future<Either<Failure, CardResponse>> call(GetCardsParams params)async{
    return await repository.getCards(params);
  }
}