import 'package:flutter/material.dart';
import '../../../App/constants.dart';
import '../../Views/Home/home_view.dart';
import 'home_viewpagemodel.dart';

class HomeViewPage extends StatefulWidget {
  final HomeViewPageModel viewModel;
  const HomeViewPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> with HomeViewDelegate {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: HomeView(viewModel: widget.viewModel.homeViewModel, delegate: this),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.viewModel.getNewStory();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  showAlertDialog(BuildContext context, String alertText) {
    AlertDialog alerta = AlertDialog(
      title: const Text("Alerta"),
      content: Text(alertText),
      actions: [
        CloseButton(onPressed: () {}),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  // HomeViewDelegate
  @override
  void homeViewFormCompleted(String heroName, String villainName, String historyContext) {
    widget.viewModel.heroName = heroName;
    widget.viewModel.heroName = villainName;
    widget.viewModel.heroName = historyContext;
  }
}