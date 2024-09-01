class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodsSuccess extends HomeState {}

final class GetHistoricalPeriodsFailur extends HomeState {
  final String errMessage;

  GetHistoricalPeriodsFailur({required this.errMessage});
}

final class GetHistoricalPeriodsLoading extends HomeState {}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

final class GetHistoricalCharactersSuccess extends HomeState {}

final class GetHistoricalCharactersFailur extends HomeState {
  final String errMessage;

  GetHistoricalCharactersFailur({required this.errMessage});
}

final class GetHistoricalCharactersLoading extends HomeState {}



//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

final class GetHistoricalSouvenirsSuccess extends HomeState {}


final class GetHistoricalSouvenirsFailur extends HomeState {
  final String errMessage;

  GetHistoricalSouvenirsFailur({required this.errMessage});
}

final class GetHistoricalSouvenirsLoading extends HomeState {}
final class HomeCharactersFiltered extends HomeState {}