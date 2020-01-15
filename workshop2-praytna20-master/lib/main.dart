import 'package:praytna2/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:praytna2/detail_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Quicksand'),
      home: new ListPage(title: 'Non-Technical Events'),
      // home: DetailPage(),
    );
  }
}


class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.all_inclusive, color: Color.fromRGBO(45,234,220,1.0)),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(height: 2,color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20 ),
        //semanticsLabel: lesson.date,
        //style:TextStyle(color: Colors.white , fontWeight: :FontWeight.bold),
        ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      //: Text()

      subtitle: Row(
        children: <Widget>[
          /*Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),*/
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.level,
                    style: TextStyle(color: Colors.white)))

          )

        ],
      ),
      trailing:
      Icon(Icons.arrow_right, color: Color.fromRGBO(45,234,220,1.0), size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

   /* final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(7, 4, 23, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );*/
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        /*IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )*/
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 4, 23, 1.0),
      appBar: topAppBar,
      body: makeBody,
      //bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Sherlock Holmes",
        level: "",
        //indicatorValue: 0,
        //price: 0,
        content:
        "Tired of technical stuffs? Give a break? Here is a chance for you peeps to be a part of this detective game. Come along to test your logical skills and open your mind to investigate and solve as SHERLOCK HOLMES Do come to have some fun and win exciting prizes."),
    Lesson(
        title: "Connexions",
        level: "",
        //indicatorValue: 1,
       // price: 750,
        content:
        "Are u people crazy about linking something? Here comes the most enthusiastic event!\n Connect your ideas to get the solution Connexion-il connect aagi vaazhvaarey vaazhvaar mattravar connexion indri enguvaar! \n\n\n PRIZES WORTH Rs. 2000  "),
    Lesson(
        title: "The Prestige",
        level: "",
       // indicatorValue: 0.5,
        //price: 750,
        content:
        "There is only one event that matters... The great event.. And it is here.. THE PRESTIGE Do participate to express your aptitude! Have unlimited fun and with everyone's hearts, kidneys, livers etc.\n\n Prizes worth ₹ 20000 \n\n Yashwanth : 7395879765 \n Lokesh : 7092694272"),
    Lesson(
        title: "IPL Auction",
        level: "",
        //indicatorValue: 0.66,
        //price: 750,
        content:
        "Wanna make RCB win the throne? Want do shopping like Preity Zinta? Wanna make fun like CSK Management? Here is a chance to quench your thirst! Prove that you're a proud IPL Fan at IPL Auction and win exciting prizes."),
    Lesson(
        title: "Treasure Hunt",
        level: "",
        //indicatorValue: 1.0,
        //price: 750,
        content:
        "The cave you fear to enter holds the treasure you seek!! It's time to overcome the fear and seek the treasure what is your\nFollow the Rules! Find the Clues!\nTake home the Treasure!!!\nReach the Treasure, Sweet the Pleasure"),
    Lesson(
        title: "Gaming",
        level: "",
        //indicatorValue: 1.0,
       // price: 750,
        content:
        "Escape reality and own the virtual world where you can have a second chance to life. Do you have what it takes to weave around the defenders and score a screamer of goal in FIFA? Deserted, alone, and a winner-takes-it-all battle royale? Can you get the better of 99 other participants in PUBG? Can you help the terrorists triumph in Call of Duty?\nCalling all the gaming maniacs to participate in our Gaming event!"),
    Lesson(
        title: "Math-o-Mania",
        level: "",
        //indicatorValue: 1.0,
       // price: 750,
        content:
        "Are you a math geek? Does Maths run in your veins??\nAre you ready to unleash the math destruction? Then be ready to witness the wrath of math as the great minds battle for the glory to become next Archimedes!!!?\nCAUTION : Don't Drink and Derive"),

  ];
}
