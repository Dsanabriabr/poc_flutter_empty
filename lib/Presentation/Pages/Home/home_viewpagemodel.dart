import '../../Views/Home/home_viewmodel.dart';

class HomeViewPageModel {
  final HomeViewModel homeViewModel;
  String heroName = '';
  String villainName = '';
  String contextStory = '';
  String moralStory = '';

  HomeViewPageModel(this.homeViewModel);

  void getNewStory() {}
}
