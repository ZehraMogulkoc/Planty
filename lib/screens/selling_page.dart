import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planty/widgets/app_drawer.dart';
import 'package:provider/provider.dart';



class MyProducts extends StatelessWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    var currentUser=FirebaseFirestore.instance.collection('Data').doc(user?.email);
    return ChangeNotifierProvider<Plants>(
      create: (context) => Plants(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainView(),
      ),
    );
  }
}

/// Main Screen
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {


  @override
  Widget build(BuildContext context) {

    final user=FirebaseAuth.instance.currentUser;
    var currentUser=FirebaseFirestore.instance.collection('Data').doc(user?.email);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Satıştaki Ürünlerin',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (val) {
              if (val == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsView()))
                    .then((value) => setState(() {}));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text('Bitki türüne göre ayarla'),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount:
        Provider.of<Plants>(context, listen: false).currentList().length,
        itemBuilder: (context, index) {
          List currentListGame =
          Provider.of<Plants>(context, listen: false).currentList();
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlantView(index: index)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(currentListGame[index].thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.75),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          currentListGame[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Game Detail Screen
class PlantView extends StatefulWidget {
  int index;

  PlantView({required this.index});

  @override
  _PlantViewState createState() => _PlantViewState();
}

class _PlantViewState extends State<PlantView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          Provider.of<Plants>(context, listen: false)._items[widget.index].title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              Provider.of<Plants>(context, listen: false)
                  .currentList()[widget.index]
                  .thumbnailUrl,
              width: size.width,
              height: (size.height / 2),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                Provider.of<Plants>(context, listen: false)
                    .currentList()[widget.index]
                    .genre,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                Provider.of<Plants>(context, listen: false)
                    .currentList()[widget.index]
                    .shortDescription,
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 100),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    Provider.of<Plants>(context, listen: false)
                        .currentList()[widget.index]
                        .cost,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Settings Screen
class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String selectionOfTypeOfGames = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Ayarlar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'Ağaç Fidanı',
            title: Text('Ağaç Fidanı'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'Çiçek',
            title: Text('Çiçek'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'Sebze',
            title: Text('Sebze'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'Meyve',
            title: Text('Meyve'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<Plants>(context, listen: false)
                  .changeTypeOfGameInMain(selectionOfTypeOfGames);
              print(selectionOfTypeOfGames);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
            ),
            child: Text(
              'OK',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class AddingNewPlant extends StatefulWidget {
  const AddingNewPlant({Key? key}) : super(key: key);

  @override
  _AddingNewPlantState createState() => _AddingNewPlantState();
}

class _AddingNewPlantState extends State<AddingNewPlant> {
  String pictureUrlLink = '';

  TextEditingController idCtr = TextEditingController();
  TextEditingController titleCtr = TextEditingController();
  TextEditingController genreCtr = TextEditingController();
  TextEditingController shortDescriptionCtr = TextEditingController();
  TextEditingController imageUrlCtr = TextEditingController();
  TextEditingController cost = TextEditingController();
  FocusNode imageFocusNode = FocusNode();

  GlobalKey<FormState> textFieldsKey = GlobalKey<FormState>();

  @override
  void initState() {
    imageFocusNode.addListener(() {
      // print('has Focus: ${imageFocusNode.hasFocus}');
    });
    super.initState();
  }

  @override
  void dispose() {
    imageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Yeni Ürün',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (textFieldsKey.currentState!.validate()) {
                print('Tamam');
                Plant newPlant = Plant(
                  id: idCtr.text,
                  title: titleCtr.text,
                  genre: genreCtr.text,
                  shortDescription: shortDescriptionCtr.text,
                  thumbnailUrl: imageUrlCtr.text,
                  cost:cost.text,
                );
                Provider.of<Plants>(context, listen: false)
                    .addingNewPlant(newPlant);
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: textFieldsKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen bir değer girin';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ID',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen bir değer girin';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Ürün adı',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: genreCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen bir değer girin';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Ürün Tipi (meyve, sebze, vb.)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 2,
                  controller: shortDescriptionCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen ürün hakkında detayları giriniz';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Kısa Açıklama',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 2,
                  controller: cost,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Lütfen ürünün fiyatını girin';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Fiyat',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: pictureUrlLink == ''
                          ? Text('Enter a Url')
                          : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              pictureUrlLink,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: size.width - 124,
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            setState(() {
                              pictureUrlLink = imageUrlCtr.text;
                            });
                          }
                        },
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Lütfen ürünün bulunduğu bir fotoğraf URL'si giriiniz";
                            }
                          },
                          focusNode: imageFocusNode,
                          controller: imageUrlCtr,
                          decoration: InputDecoration(
                            labelText: 'Fotoğraf için URL',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Plants with ChangeNotifier {
  String typeOfPlant = 'All';
  final List<Plant> _items = [
    Plant(
      cost: '80 TL',
      id: '1',
      title: 'Nephrolepis',
      thumbnailUrl: 'https://cdnheryerbitki.ikost.com/3065/urunler/1881.jpg',
      shortDescription:
      'Kökeni Amerikadır. Yerini beğenip beğenmediğini yapraklarındaki sararmalardan anlayabilirsiniz. Solan yapraklarını budayarak daha sağlıklı bir görünüm elde edebilirsiniz. 6 ayda bir sulama suyuna magnezyum eklerseniz daha yeşil bir bitki elde edebilirsiniz.',
      genre: 'flower',
    ),
    Plant(
      cost: '200 TL',
      id: '2',
      title: 'Confetti',
      thumbnailUrl: 'https://cdnheryerbitki.ikost.com/3065/urunler/4771.jpeg',
      shortDescription:
      'Confetti buketimizde yer alan turuncu güller enerjisi ile ön plana çıkarken pembe güller ise nezaketi temsil eder.  Daha uzun süre çiçekli kalması için serin bir odada bulundurmanız ve suyuna buz atmanız önerilir. ',
      genre: 'flower',
    ),
    Plant(
      cost: '150 TL',
      id: '3',
      title: 'Nar Ekşisi',
      thumbnailUrl: 'https://www.ebitki.com/images/articles/nar_eksisi.jpg',
      shortDescription:
      'Nar ekşisi bağışıklığı güçlendirir. Nar özellikle kış aylarında tüketilen meyvelerden bir tanesidir. Kış aylarında tüketilmesi vücut direncinin artmasını sağlar. Kış aylarında soğuktan dolayı düşen bağışıklık direnci nar sayesinde yükseltilebilir. ',
      genre: 'fruit',
    ),
    Plant(
      cost: '15 TL',
      id: '4',
      title: 'Elma',
      thumbnailUrl: 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/27135000/elma-starking-kg-bdb204-1650x1650.jpg',
      shortDescription:
      'Kırmızı elmanın en lezzetli hali olarak öne çıkan ve sulu bir yapıya sahip olan Elma Starking, tazeliği ve doğallığıyla tüketicilerinin beğenisine sunuluyor. ',
      genre: 'fruit',
    ),

  ];

  List<Plant> currentList() {
    if (typeOfPlant == 'All') {
      return _items;
    }
    List<Plant> newList =
    _items.where((game) => game.genre == typeOfPlant).toList();
    return newList;
  }

  void changeTypeOfGameInMain(String currentType) {
    typeOfPlant = currentType;
    notifyListeners();
  }

  void addingNewPlant(Plant newPlant) {
    _items.add(newPlant);
  }
}

class Plant {
  String id;
  String title;
  String thumbnailUrl;
  String shortDescription;
  String genre;
  String cost;
  Plant(
      {required this.id,
        required this.title,
        required this.thumbnailUrl,
        required this.shortDescription,
        required this.genre,
        required this.cost});
}
