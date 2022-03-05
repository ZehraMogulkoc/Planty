import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planty/screens/product_owerviev_screen.dart';

import '../planty_main_page.dart';
import '../screens/login_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/selling_page.dart';


class AppDrawer extends StatefulWidget {

  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    final user=FirebaseAuth.instance.currentUser;
    var currentUser=FirebaseFirestore.instance.collection('Data').doc(user?.email);
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor:  Colors.green,
            title: Center(child:
            StreamBuilder(stream: currentUser.snapshots(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData){
                return Text("Merhaba  ${snapshot.data.data()['Name']}!",style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal)); }
              else{
                return CircularProgressIndicator();
              }}
            ),),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Alışverişe başla'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsOverviewScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Siparişler'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrdersScreen()));
            },
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddingNewPlant()))
                  .then((value) => setState(() {
                Navigator.of(context).pop();
              }));
            },
            leading: Icon(
              Icons.add_box_rounded,
              color: Colors.grey,
            ),
            title: Text(
              'Yeni Ürün Sat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart,),
            title: const Text('Satıştaki Ürünlerin'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>MyProducts()))
                  .then((value) => setState(() {Navigator.of(context).pop();}));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Anasayfa'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>MainPage()))
                  .then((value) => setState(() {Navigator.of(context).pop();}));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.arrow_back_outlined),
            title: const Text('Çıkış Yap'),
            onTap: () {
              _auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
