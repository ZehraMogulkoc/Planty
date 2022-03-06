class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Planty'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage( image: AssetImage("images/bg2.jpeg"),fit: BoxFit.fill)),
          child: Column(
            children: [
              SizedBox(height: 50,),
              FlatButton(
                onPressed: (){Navigator.push(context,
    MaterialPageRoute(builder: (context) => MainPage()));
    },
                color: Colors.amber.withOpacity(0.7),
                minWidth: 400,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: Row(
                  children: [
                    SizedBox(height: 20,),
                    Image(image: AssetImage("images/plant.png",),width: 100, height: 80,),
                    SizedBox(width: 20,),
                    Text("Tarim Rehberi",style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              FlatButton(
                onPressed: () {  },
                color: Colors.amber.withOpacity(0.7),
                minWidth: 400,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: Row(
                  children: [
                    SizedBox(height: 20,),
                    Image(image: AssetImage("images/shop.png",),width: 100, height: 80,),
                    SizedBox(width: 20,),
                    Text("Market", style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              FlatButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.amber.withOpacity(0.7),
                minWidth: 400,
                onPressed: () { Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForumDetailPage())); },
                child: Row(
                  children: [
                    Image(image: AssetImage("images/forum.png",),width: 100, height: 80,),
                    SizedBox(width: 20,),
                    Text("Forum",style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  }
}
