import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:untitled1/plant_main_page.dart';
import 'package:untitled1/tree_main_page.dart';

void main() {
  runApp(const MainPage());
}


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(TablerIcons.seeding)),
                Tab(icon: Icon(TablerIcons.tree)),
              ],
            ),
            title: const Text('Planty'),
          ),
          body: const TabBarView(
           children: [
              PlantMainPage(),
              TreeMainPage()
            ],
          ),
        ),
      ),
    );
  }
}
