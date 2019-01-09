
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:hello_world/tabs/first.dart';
import 'package:hello_world/tabs/second.dart';
import 'package:hello_world/tabs/third.dart';
import './utils.dart' as utils;
import 'package:hello_world/gridview.dart';
// import 'package:english_words/english_words.dart';
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
              ),
               FlatButton(
              child: Text('open json example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new JsonApp();
                }));
              },
              // MyGetHttpData
              ),
                FlatButton(
              child: Text('open httpGet example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new MyGetHttpData();
                }));
              },
              // MyGetHttpData
              ),
               FlatButton(
              child: Text('open alter example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new AlterHome();
                }));
              },
              // MyGetHttpData
              ),
              FlatButton(
              child: Text('Step example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new StepHome();
                }));
              },
              // MyGetHttpData
              ),
              FlatButton(
              child: Text('Tab example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new TabHome();
                }));
              },
              // GradientHome
              ),
              FlatButton(
              child: Text('Gradient example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new GradientHome();
                }));
              },
              // MyGetHttpData
              ),
              // GridHome
              FlatButton(
              child: Text('GridHome example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new GridHome();
                }));
              },
              // MyGetHttpData
              ),
              FlatButton(
              child: Text('ContactPage example'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context)
                {
                  return new ContactPage();
                }));
              },
              // MyGetHttpData
              ),
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


class JsonApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

// state Local Json 
class MyAppState extends State<JsonApp> {
  List data;
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load local JSON file"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
          future: DefaultAssetBundle
            .of(context)
            .loadString('assets/data/starwars_data.json'),
          builder: (context, snapshot){
            var new_data  = json.decode(snapshot.data.toString());
            return new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text("Name: " + new_data[index]['name']),
                      new Text("Height: " + new_data[index]['height']),
                      new Text("Mass: " + new_data[index]['mass']),
                      new Text(
                          "Hair Color: " + new_data[index]['hair_color']),
                      new Text(
                          "Skin Color: " + new_data[index]['skin_color']),
                      new Text(
                          "Eye Color: " + new_data[index]['eye_color']),
                      new Text(
                          "Birth Year: " + new_data[index]['birth_year']),
                      new Text("Gender: " + new_data[index]['gender'])
                    ],
                ),
              );
            },
            itemCount: new_data == null ? 0 : new_data.length,
          );
        }),
        ),
      )
    );
  }
}


// using http get 
class MyGetHttpData extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => MyGetHttpDataState();
}

class MyGetHttpDataState extends State<MyGetHttpData> {
  final String url = "https://swapi.co/api/people";
  List data;
  Future<String> getJSONData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
          var dataConverteToJSON = json.decode(response.body);
          data = dataConverteToJSON['results'];
        });
    return "Successfull";
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve JSON Data via HTTP GET"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(child: new Container(
                    child: new Text(
                      data[index]['name'],
                      style: new TextStyle(fontSize: 20.0, color: Colors.lightBlueAccent),
                    ),
                    padding: const EdgeInsets.all(15.0),
                  ),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }
}

class AlterHome extends StatefulWidget {
  @override
  AlertClass createState() => new AlertClass();
} 

class AlertClass extends State<AlterHome> {
  AlertDialog dialog = new AlertDialog(
    content: new Text(
      "Hello World",
      style: new TextStyle(fontSize: 30.0),
    )
  );
  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using Alter Dialog"),
      ),
      body: new Container(
        child: new Center(
          child: new RaisedButton(
            child: new Text('Hi to alert!'),
            onPressed: (){
              showDialog(context: context, child: dialog);
            },
          ),
        ),
      )
    );
  }
}

class StepHome extends StatefulWidget {
  @override
  StepState createState() => new StepState();
}

class StepState extends State<StepHome> {
  int current_step = 0;
  List<Step> my_steps = [
    new Step(
      title: new Text("Step 1"),
      content: new Text("Hello!"),
      isActive: true
    ),
    new Step(
      title: new Text("Step 2"),
      content: new Text("World!"),
      isActive: true),
    new Step(
      title: new Text("Step 3"),
      content: new Text("Hello World!"),
      isActive: true
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Simple Material App"),
      ),
      body: new Container(
        child: new Stepper(
          currentStep: this.current_step,
          steps: my_steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
                          current_step = step;
                        });
            print("oneStepTapped: " + step.toString());
          },
          onStepCancel: () {
            setState(() {
                          if(current_step > 0){
                            current_step = current_step -1;
                          } else {
                            current_step = 0;
                          }
                        });
            print("oneStepCancle: " + current_step.toString());
          },
          onStepContinue: () {
            setState(() {
                          if(current_step < my_steps.length -1 ) {
                            current_step = current_step + 1;
                          } else {
                            current_step = 0;
                          }
                        });
            print("onStepContiue: " + current_step.toString());
          },
        ),
      ),
    );
  }
  
}

class TabHome extends StatefulWidget{
  @override
  TabState createState() => new TabState();
}

class TabState extends State<TabHome> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      tabs: <Tab>[
        new Tab(
          icon: new Icon(Icons.favorite),
        ),
        new Tab(
          icon: new Icon(Icons.adb),
        ),
        new Tab(
          icon: new Icon(Icons.airport_shuttle),
        )
      ],
      controller: controller,
    );
  }
  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      children: tabs,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using tabs"),
        backgroundColor: Colors.blue,
        bottom: getTabBar(),
      ),
      body: getTabBarView(<Widget>[new First(), new Second(), new Third()]),
    );
  }
}


class GradientHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Using Gradient",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Using Gradient"),
        ),
        body: new Container(
          child: new Center(
            child: new Text(
              "Hello World!",
              style: new TextStyle(color: Colors.white)
            ),
          ),
          decoration: new BoxDecoration(
            gradient: utils.getCustomGradient()
          ),
        ),
      ),
    );
  }  
}


class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Using SnackBar"
        ),
      ),
      body: new Center(
          child: new MyButton(),
        ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
     child: new Text("Show SnackBar"),
     onPressed: () {
       Scaffold.of(context).showSnackBar(new SnackBar(
         content: new Text("Hello! I am SnackBar :)"),
         duration: new Duration(seconds: 3),
         action: new SnackBarAction(
           label: "Hit Me(Ation)",
           onPressed: () {
             Scaffold.of(context).showSnackBar(new SnackBar(
               content: new Text("Hello! I am shown becoz pressed Action :)"),
             ));
           },
         ),
         ));
     },
    );
  }
}

class GridHome extends StatelessWidget {
  final MyGridView myGridView = new MyGridView();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("GridView Example"),
        ),
        body: myGridView.build(),
      ),
    );
  }
}