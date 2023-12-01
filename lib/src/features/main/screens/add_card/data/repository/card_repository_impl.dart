import 'package:weather_app/src/common/service/local_data_storage/local_data_storage.dart';
import 'package:weather_app/src/features/main/screens/add_card/data/models/card_model.dart';
import 'package:weather_app/src/features/main/screens/add_card/domain/repository/card_repository.dart';

class CardRepositoryImpl implements CardRepository {
  @override
  Future<List<CardModel>> getCards() async {
    return LocalDataStorage.getCars();
  }

  @override
  Future<void> setCard(CardModel card) async {
    final oldData = await LocalDataStorage.getCars();
    LocalDataStorage.setCard([...oldData, card]);
  }
}
