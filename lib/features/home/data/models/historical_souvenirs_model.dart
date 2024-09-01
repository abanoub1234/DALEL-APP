import '../../../../core/models/data_model.dart';
import '../../../../core/utils/app-string.dart';

class HistoricalSouvenirsModel extends DataModel {
  HistoricalSouvenirsModel(
      {required super.name, required super.image, required super.discription});

  factory HistoricalSouvenirsModel.fromjson(jsonData) {
    return HistoricalSouvenirsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.description],
    );
  }
}
