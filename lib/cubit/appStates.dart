
abstract class AppState{}

class AppInitiliState extends AppState{}
class AppBottomNaveState extends AppState{}

class AppBussinessLoadingState extends AppState{}
class AppGetBusinessSucess extends AppState{}
class AppGetBusinessError extends AppState{
  String error;
  AppGetBusinessError(this.error);

}

class AppSportsLoadingState extends AppState{}
class AppGetSportsSucess extends AppState{}
class AppGetSportsError extends AppState{
  String error;
  AppGetSportsError(this.error);

}

class AppScienceLoadingState extends AppState{}
class AppGetScienceSucess extends AppState{}
class AppGetScienceError extends AppState{
  String error;
  AppGetScienceError(this.error);

}

class AppChangeModeState extends AppState{}


class AppSearchLoadingState extends AppState{}
class AppGetSearchSucess extends AppState{}
class AppGetSearchError extends AppState{
  String error;
  AppGetSearchError(this.error);

}