import 'package:flutter/material.dart';
import '../widgets/comic_widget.dart';
class  HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:ComicWidget(),
      ),
    );
  }
}
