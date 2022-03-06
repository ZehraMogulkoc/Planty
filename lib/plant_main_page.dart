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
      title: 'Arpa',
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Hordeum-barley.jpg/220px-Hordeum-barley.jpg',
      shortDescription:
          'Dünyada, tahıllar arasında üretimde mısır, buğday ve pirinçten sonra 4. sırada yer alan arpa, Türkiye’de ise buğdaydan sonra ikinci sıradadır. 2008’de dünya genelinde toplam üretimi 157.644.721 ton olup, 2009 yılı itibarı ile Türkiye 7.4 milyon ton üretim ile 6. sıradadır. ',
      genre: 'plant',
    ),
    Plant(
      id: '2',
      title: 'Buğday',
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Triticum_polonicum_L_2.JPG/220px-Triticum_polonicum_L_2.JPG',
      shortDescription:
          'Karasal iklimi tercih eder. Buğday; un, yem üretilmesinde kullanılan temel bir besin maddesidir. Kabuğu ayrılabileceği gibi kabuğu ile de öğütülebilir. Buğday aynı zamanda çiftlik hayvanları için bir yem maddesi olarak da yetiştirilmekdedir. Hasattan sonra atık ürün olarak saman balyası çıkar. ',
      genre: 'plant',
    ),
    Plant(
      /// cost 80tl
      id: '3',
      title: 'Nephrolepis',
      thumbnailUrl: 'https://cdnheryerbitki.ikost.com/3065/urunler/1881.jpg',
      shortDescription:
          'Kökeni Amerikadır. Yerini beğenip beğenmediğini yapraklarındaki sararmalardan anlayabilirsiniz. Solan yapraklarını budayarak daha sağlıklı bir görünüm elde edebilirsiniz. 6 ayda bir sulama suyuna magnezyum eklerseniz daha yeşil bir bitki elde edebilirsiniz.',
      genre: 'flower',
    ),
    Plant(
      id: '4',
      title: 'Burçak',
      thumbnailUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Vicia_ervilia_Sturm7.jpg/220px-Vicia_ervilia_Sturm7.jpg',
      shortDescription:
          'Yılık ve çok yıllık çeşitleri olan bitki dünyada Kuzey Yarım Kürenin değişik bölgeleri ile Güney Tropik bölgelerde yetişir. Türkiyede Ege Bölgesi ve Orta Anadolu da yeşil yaprakları koyunların beslenmesinde, taneleri ise damızlık boğalar için yem olmak üzere yetiştirilir.',
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
