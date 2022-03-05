import 'package:flutter/material.dart';


class PlantMainPage extends StatefulWidget {
  const PlantMainPage({Key? key}) : super(key: key);

  @override
  _PlantMainPageState createState() => _PlantMainPageState();
}

class _PlantMainPageState extends State<PlantMainPage> {
  final List<Plant> _items = [
    Plant(
      id: '1',
      title: 'Dauntless',
      thumbnailUrl: 'https://www.freetogame.com/g/1/thumbnail.jpg',
      shortDescription:
      'A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.',
      genre: 'MMORPG',
    ),
    Plant(
      id: '2',
      title: 'World of Tanks',
      thumbnailUrl: 'https://www.freetogame.com/g/2/thumbnail.jpg',
      shortDescription:
      'If you like blowing up tanks, with a quick and intense game style you will love this game!',
      genre: 'Shooter',
    ),
    Plant(
      id: '3',
      title: 'Warframe',
      thumbnailUrl: 'https://www.freetogame.com/g/3/thumbnail.jpg',
      shortDescription:
      'A cooperative free-to-play third person online action shooter set in an stunning sci-fi world.',
      genre: 'Shooter',
    ),
    Plant(
      id: '4',
      title: 'CRSED: F.O.A.D.',
      thumbnailUrl: 'https://www.freetogame.com/g/4/thumbnail.jpg',
      shortDescription:
      'Take the battle royale genre and add  mystical powers and you have CRSED: F.O.A.D. (Aka Cuisine Royale: Second Edition)',
      genre: 'Shooter',
    ),
  ];
  List<Plant> _found = [];
  @override
  initState() {
    _found = _items;
    super.initState();
  }
  void _runFilter(String enteredKeyword) {
    List<Plant> results = [];
    if (enteredKeyword.isEmpty) {
      results = _items;
    } else {
     results = _items.where(
             (user) =>
          user.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _found = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              decoration: const BoxDecoration(

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                // color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _found.isNotEmpty
                  ? ListView.builder(
                itemCount: _found.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_found[index].id),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _found[index].id.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_found[index].title),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Plant {
  String id;
  String title;
  String thumbnailUrl;
  String shortDescription;
  String genre;
  Plant(
      {required this.id,
        required this.title,
        required this.thumbnailUrl,
        required this.shortDescription,
        required this.genre});
}


