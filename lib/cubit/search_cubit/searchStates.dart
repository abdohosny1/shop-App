abstract class SearchStates{}

class SerachInitiliteState extends SearchStates{}
class SerachLoadingState extends SearchStates{}
class SerachScussesState extends SearchStates{}
class SerachErrorState extends SearchStates{
  final String error;

  SerachErrorState(this.error);
}