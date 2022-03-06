import 'package:flutter/material.dart';

class TreeMainPage extends StatefulWidget {
  const TreeMainPage({Key? key}) : super(key: key);

  @override
  _TreeMainPageState createState() => _TreeMainPageState();
}

class _TreeMainPageState extends State<TreeMainPage> {
  final List<Tree> _items = [
    Tree(
      id: '1',
      title: 'Elma',
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Elma.jpg/220px-Elma.jpg',
      shortDescription:
          '-36 °C soğuğa dayanabilir. Kurak ve sıcaktan hoşlanmaz. Toprağı tınlı, tınlı-kumlu, en az 1 m derinlikte olmalıdır. pH değeri 6-7 olan toprağı sever. Taban suyu 1 m den yakın olmamalıdır. Taşlı ve kireçli toprağı sevmez.',
      genre: 'tree',
    ),
    Tree(
      id: '2',
      title: 'Ceviz',
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Juglans_regia.jpg/220px-Juglans_regia.jpg',
      shortDescription:
          'Ceviz ağacı pH değeri 5 ile 8 arasınada olan ve süzek topraklarda yetişir.',
      genre: 'tree',
    ),
    Tree(
      id: '3',
      title: 'Erik',
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Prunus_maritima.jpg/245px-Prunus_maritima.jpg',
      shortDescription:
          'Türkiye Doğu Anadolu Bölgesinde yüksek yayla mıntıkası ile, Güneydoğu Anadolu Bölgesi  kurak ve çok sıcak bir kısım yerleri hariç her tarafta yetişir.',
      genre: 'tree',
    ),
  ];
  List<Tree> _found = [];
  @override
  initState() {
    _found = _items;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Tree> results = [];
    if (enteredKeyword.isEmpty) {
      results = _items;
    } else {
      results = _items
          .where((user) =>
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
                          leading: CircleAvatar(
                            radius: 32,
                            backgroundImage:
                                NetworkImage(_found[index].thumbnailUrl),
                            child: GestureDetector(onTap: () {}),
                          ),
                          title: Text(_found[index].title),
                          subtitle: Text(
                            _found[index].shortDescription,
                            style: const TextStyle(fontSize: 14),
                          ),
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

class Tree {
  String id;
  String title;
  String thumbnailUrl;
  String shortDescription;
  String genre;
  Tree(
      {required this.id,
      required this.title,
      required this.thumbnailUrl,
      required this.shortDescription,
      required this.genre});
}
