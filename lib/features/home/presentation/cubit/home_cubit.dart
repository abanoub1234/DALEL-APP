import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app-string.dart';
import '../../data/models/Wars_model.dart';
import '../../data/models/historical_charcters_model.dart';
import '../../data/models/historical_periods_model.dart';
import '../../data/models/historical_souvenirs_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final List<HistoricalPeriodsModel> historicalperiods = [];
  final List<HistoricalCharctersModel> historicalcharacters = [];
  final List<HistoricalSouvenirsModel> historicalSouvenirs = [];

  final List<WarsModel> warslist = [];
  List<HistoricalCharctersModel> filteredCharacters = [];

  void filterCharacters(String query) {
    if (query.isEmpty) {
      filteredCharacters = historicalcharacters;
    } else {
      filteredCharacters = historicalcharacters
          .where((character) =>
          character.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(HomeCharactersFiltered());
  }


  getHistorivalcharacters() async {
    try {
      emit(GetHistoricalCharactersLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalcharcters)
          .get().then((value) =>
          value.docs.forEach((element) {
            historicalcharacters.add(
                HistoricalCharctersModel.fromjson(element.data()));
          },),);
      emit(GetHistoricalCharactersSuccess());
    }on Exception catch(e){
      emit(GetHistoricalCharactersFailur(errMessage:e.toString()));

    }
  }
  getHistoricalSouvenirs() async {
    try {
      emit(GetHistoricalSouvenirsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalsouvenirs)
          .get().then((value) =>
          value.docs.forEach((element) {
            historicalSouvenirs.add(
                HistoricalSouvenirsModel.fromjson(element.data()));
          },),);
      emit(GetHistoricalSouvenirsSuccess());
    }on Exception catch(e){
      emit(GetHistoricalSouvenirsFailur(errMessage:e.toString()));

    }
  }




  getHistorivalperiods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get().then((value) =>
          value.docs.forEach((element)async {

            await getWarsList(element);
            emit(GetHistoricalPeriodsSuccess());
            historicalperiods.add(
                HistoricalPeriodsModel.fromjson(element.data(),warslist));
          },),);

    }on Exception catch(e){
      emit(GetHistoricalPeriodsFailur(errMessage:e.toString()));

    }
  }


   Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              warslist.add(
            WarsModel.fromjson(
              element.data(),
            ),
          );
        },
      ),
    );
  }


}
