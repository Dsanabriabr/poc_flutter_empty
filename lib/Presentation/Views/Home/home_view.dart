import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_viewmodel.dart';

abstract class HomeViewDelegate {
  void homeViewFormCompleted(String heroName, String villainName, String historyContext);
}

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;
  final HomeViewDelegate delegate;
  const HomeView({Key? key, required this.viewModel, required this.delegate})
      : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _heroName = '';
  String _villainName = '';
  int _currentIndex = 0;
  final List<String> _historyContexts = [
    'funny future',
    'fantasy dragons',
    'happy horror',
    'school time'
  ];

  final _formKey = GlobalKey<FormState>();

  onCarouselPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter hero name',
                  labelText: 'Hero Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter hero name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _heroName = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter villain name',
                  labelText: 'Villain Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter villain name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _villainName = value;
                },
              ),
              const SizedBox(height: 16),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: _currentIndex,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: onCarouselPageChanged(_currentIndex),
                  scrollDirection: Axis.horizontal,
                ),
                items: _historyContexts.map((context) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            context.toString().toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    homeViewFormCompleted();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }


//HomeViewDelegate
  void homeViewFormCompleted() {
    widget.delegate.homeViewFormCompleted(_heroName, _villainName, _historyContexts[_currentIndex]);
  }
}
