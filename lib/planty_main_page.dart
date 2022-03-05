import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:planty/plant_main_page.dart';
import 'package:planty/tree_main_page.dart';
import 'package:planty/widgets/app_drawer.dart';




class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Colors.green,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(TablerIcons.seeding)),
                Tab(icon: Icon(TablerIcons.tree)),
              ],
            ),
            title: const Text('Planty'),
          ),
          drawer: AppDrawer(),
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
