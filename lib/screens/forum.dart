import 'package:flutter/material.dart';
import 'colors.dart';

class ForumDetailPage extends StatefulWidget {
  @override
  _ForumDetailPageState createState() => new _ForumDetailPageState();
}

var ForumPostArr = [
  new ForumPostEntry("Kullanıcı1", "2 gün önce", 0 , 0 , "Merhaba,\n\nCeviz ağaçlarınızın verimini artırmak için toprağınızı çok iyi hale getirmelisiniz. Rekor Gelişim ile en yüksek verim ve kaliteye ulaşcağınız toprak yapısına sahip olabilirsiniz.."),
  new ForumPostEntry("Kullanıcı2", "23 saat önce", 1 , 0 , "Derin dikilen tohumlardan yetişen çöğürlerin, normal derinlikte dikilenlere göre daha yavaş ve zayıf gelişen çöğürler yetiştirdiği bildirilmektedir. En ideal dikim derinliğinin 5-10 cm arasında olabileceği söylenebilir. Kumlu topraklarda derin, killi ve ağır topraklarda ise yüzeysel dikim tercih edilmelidir. Cevizin meyve şekli nedeniyle tohumun çimlenmesinde ve çimlenen tohumda ise kökçük ve sürgün ucunun çıkış şeklinde, tohum dikim şekli önemlidir. Yanakların birleştiği çizgili yer aşağıya,yanakların ise yana gelecek şekilde bir dikim şekli en ideal dikim şekli olacaktır.\n\nTohumlar toprağa kendi büyüklüğünün iki katı kadar derinliğe ekilirler. Tohum ekiminden sonra çöğürlerin iyi bir gelişme gösterebilmesi için çöğür parsellerinde başta yabancı ot temizliği olmak üzere, sulamaya özen göstermek gerekir. Çöğürlerin sökümünden bir süre önce, dinlenme döneminde kazık köklerin kesilmesi, saçak kök oluşumunu geliştirerek şaşırtmada tutma başarısını artırır." ),
  new ForumPostEntry("Kullanıcı3", "2 gün önce", 5 , 0 , "Merhabalar\n\nBu sıteyi inceleyerek daha detaylı bilgi edinebilirisniz: https://adana.tarimorman.gov.tr/Belgeler/SUBELER/bitkisel_uretim_ve_bitki_sagligi_sube_mudurlugu/meyve_yetistiriciligi_ve_mucadelesi/Ceviz.pdf"),
  new ForumPostEntry("Kullanıcı4", "2 gün önce", 0 , 0 , "Merhaba,\n\nCeviz ağaçlarınızın verimini artırmak için toprağınızı çok iyi hale getirmelisiniz. Rekor Gelişim ile en yüksek verim ve kaliteye ulaşcağınız toprak yapısına sahip olabilirsiniz."),
];

class _ForumDetailPageState extends State<ForumDetailPage> {
  @override
  Widget build(BuildContext context) {
    var questionSection = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Text(
            "Ceviz yetiştiriciliğine başlamak istiyorum. Ürün kalitesi ve verimliliği nasıl arttırabilirim?",
            textScaleFactor: 1.5,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconWithText(Icons.category_outlined, "Ceviz Yetistirme", iconColor: Colors.orange,),
                new IconWithText(
                  Icons.check_circle,
                  "Cevaplandı",
                  iconColor: Colors.green,
                ),
                new IconWithText(Icons.remove_red_eye, "54", iconColor: Colors.orange,)
              ],
            ),
          ),
          new Divider()
        ],
      ),
    );

    var responses = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        )
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Forum 1"),
      ),
      body: new Column(
        children: <Widget>[
          questionSection,
          new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: responses,
              ))
        ],
      ),
    );
  }
}

class ForumPostEntry{
  final String username;
  final String hours;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry(this.username, this.hours, this.likes, this.dislikes, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        color: Colors.amber,
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.amber,
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  size: 50.0,
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          entry.username
                      ),
                      new Text(
                          entry.hours
                      ),
                    ],
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_up),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Text(entry.likes.toString()),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_down),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: new Text(entry.dislikes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(bottomLeft :const Radius.circular(20.0),bottomRight :const Radius.circular(20.0))
            ),
            child: new Text(entry.text),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;

  IconWithText(this.iconData, this.text, {required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            this.iconData,
            color: this.iconColor,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(this.text),
          ),
        ],
      ),
    );
  }
}
