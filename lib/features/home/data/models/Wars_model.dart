import '../../../../core/models/data_model.dart';
import '../../../../core/utils/app-string.dart';

class WarsModel extends DataModel{
  WarsModel({required super.name, required super.image, required super.discription});

  factory WarsModel.fromjson(jsonData){
    return WarsModel(
        name: jsonData[FireBaseStrings.name] ,
        image: jsonData[FireBaseStrings.image] ,
        discription: jsonData[FireBaseStrings.description] ,

    );



  }
}