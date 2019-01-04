import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fluter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
    
  }
}

class Mycard extends StatelessWidget {
  final Widget icon;
  final Widget titile;
  
  Mycard({this.icon, this.titile});
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Card(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[this.titile, this.icon],
          ),
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    final double myTextSize = 30.0;
    final double myIconSize = 40.0;
    final TextStyle myTextStyle = new TextStyle(color: Colors.grey, fontSize: myTextSize);
    var column  = new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Mycard(
          titile: new Text(
            "Favorite",
            style: myTextStyle,
          ),
          icon: 
            new Icon(Icons.favorite, size: myIconSize, color: Colors.red),
        ),
        new Mycard(
          titile: new Text(
            "Airport Shuttle",
            style: myTextStyle,
          ),
          icon: 
            new Icon(Icons.airport_shuttle, size: myIconSize, color: Colors.blueGrey),
        ),
        new Mycard(
          titile: new Text(
            "Alarm",
            style: myTextStyle,
          ),
          icon: 
            new Icon(Icons.alarm, size: myIconSize, color: Colors.blueGrey),
        ),
        new Mycard(
          titile: new Text(
            "Done",
            style: myTextStyle,
          ),
          icon: 
            new Icon(Icons.done, size: myIconSize, color: Colors.green),
        ),
        
      ],
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateless Widget"),
      ),
      body: new Container(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: new Center(
          child: new SingleChildScrollView(child: column),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
          _counter++;
        });
  }
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:'
            ),
            new Text('$_counter',
            style: Theme.of(context).textTheme.display1),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new NewRoute();
                }));
              },
              )
          ],
        ),
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/img/bg1.jpg'),
            fit:  BoxFit.cover)),
      ),
      
      floatingActionButton: new FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: new Icon(Icons.add),
      ),
      
    );

  }
}