

import 'package:mydalil3/features/home/data/models/Wars_model.dart';

import '../../../../core/models/data_model.dart';
import '../../../../core/utils/app-string.dart';

class HistoricalCharctersModel extends DataModel{


 // final List<WarsModel> wars;

  HistoricalCharctersModel({required super.name, required super.image, required super.discription, });
  //warslist
  factory HistoricalCharctersModel.fromjson(jsonData,) {
    return HistoricalCharctersModel(
        name: jsonData[FireBaseStrings.name] ,
        image: jsonData[FireBaseStrings.image] ,
        discription: jsonData[FireBaseStrings.description],
       // wars:warslist
    );
  }

  }
