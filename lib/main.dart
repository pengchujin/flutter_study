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

class NewRoute extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    final wordPair = new WordPair.random();
    return Scaffold(  
      appBar: AppBar(
        title: Text('Using Theme'),
      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.white10),
        child: new Center(
          child: new Container(
            color: Theme.of(context).accentColor,
            child: new Text(
            '$wordPair',
            style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.pinkAccent),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
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
      body: new Center(
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
      floatingActionButton: new FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: new Icon(Icons.add),
      ),
    );

  }
}