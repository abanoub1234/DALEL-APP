import '../../../../core/models/data_model.dart';
import '../../../../core/utils/app-string.dart';
import 'Wars_model.dart';

class HistoricalPeriodsModel extends DataModel {
  final List<WarsModel> wars;

  HistoricalPeriodsModel(
      {required super.name,
      required super.image,
      required super.discription,
      required this.wars});

  factory HistoricalPeriodsModel.fromjson(jsonData, warslist) {
    return HistoricalPeriodsModel(
        name: jsonData[FireBaseStrings.name],
        image: jsonData[FireBaseStrings.image],
        discription: jsonData[FireBaseStrings.description],
        wars: warslist);
  }
}
