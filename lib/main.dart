import 'package:flutter/material.dart';

import 'route_paths.dart';

import 'menu.dart';
import 'dots.dart';
import 'login.dart';

// void main() {
//   print(Menu.getFoodById("10").name);
// }

void main() {
  //setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DotsRoute,
      routes: {
        DotsRoute: (content) => DotsView(),
        LoginRoute: (context) => LoginView(),
        MenuRoute: (context) => MyHomePage(title: "Current Food Item"),
        SecondRoute: (context) => SecondView(),
        ThirdRoute: (context) => ThirdView(),
        FourthRoute: (context) => FourthView(),
        FifthRoute: (context) => FifthView(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: "Current Food Item"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var padding;

  void _incrementCounter() {
    setState(() {
      _counter =  (_counter) % 10 + 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter == 0) {
        _counter= 10 + (_counter % 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Please choose your favourite dish(recipe) from the menu:',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height:10),
            Text(
              Menu.getFoodById('$_counter').name,
              // '$_counter',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height:2),
            GestureDetector(
              onTap: () {
                print("onTap called.");
                Navigator.pushNamed(
                  context, SecondRoute);
                // Navigator.push(
                //  context, 
                //  MaterialPageRoute(builder: (context) => SecondRoute()),
                //);
              },
                child:Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Container(
                    child: Image(
                      image: new AssetImage(Menu.getFoodById('$_counter').image),height: 300.0,width: 300.0,
                    ),
                  ),
                ),
            ),
            Text(
              Menu.getFoodById('$_counter').price,
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(children:<Widget>[
        Positioned(
          bottom: 80.0,
          right: 10.0,
          child: FloatingActionButton(
            heroTag:'increase',
            onPressed: (){
              _incrementCounter();
            },
            child:Icon(Icons.arrow_drop_up),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: FloatingActionButton(
            heroTag:'decrease',
            onPressed: (){
              _decrementCounter();
            },
            child:Icon(Icons.arrow_drop_down),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ])
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Recipe"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped. 
            // Navigator.pop(context);
            Navigator.pushNamed(context, ThirdRoute);
          },
          child: Text('Next Step!'),
        ),
      ),
    );
  }
}


class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped. 
            // Navigator.pop(context);
            Navigator.pushNamed(context, FourthRoute);
          },
          child: Text('Next Step!'),
        ),
      ),
    );
  }
}

class FourthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text("Fourth Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped. 
            // Navigator.pop(context);
            Navigator.pushNamed(context, FifthRoute);
          },
          child: Text('Next Step!'),
        ),
      ),
    );
  }
}

class FifthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        title: Text("Fifth Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped. 
            // Navigator.pop(context);
            Navigator.pushNamed(context, MenuRoute);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}