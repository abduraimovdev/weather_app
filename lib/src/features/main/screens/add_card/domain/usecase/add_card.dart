import 'package:dartz/dartz.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';

import '../../../../../../common/util/failures.dart';
import '../../../../../../common/util/usecase.dart';
import '../params/card_params.dart';

class AddCard implements UseCase<bool?, CardAddParams> {
  final CardRepository repository;

  AddCard({required this.repository});

  @override
  Future<Either<Failure, bool?>> call(CardAddParams params) async {
    return await repository.setCard(params);
  }
}