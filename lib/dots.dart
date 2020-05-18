// https://gist.github.com/collinjackson/4fddbfa2830ea3ac033e34622f278824

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'route_paths.dart';

//import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       home: new MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class DotsView extends StatefulWidget {
  @override
  State createState() => new DotsViewState();

}

class DotsViewState extends State<DotsView> {
  final _controller = new PageController(viewportFraction: 1);

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  static onTap(index) {
    print("$index selected.");
  }


  final List<Widget> _pages = <Widget>[
    new Card(
      color: Colors.transparent,
      elevation: 10,
      child: Center(
        child: Text(
          'Here is my Review.',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontFamily: 'Schyler'),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    new Card(
      elevation: 10,
      child: FittedBox(
          child: Image(
            image: AssetImage('assets/images/GettyImages-878279268.jpg'),
          ),
          fit: BoxFit.fitWidth),
    ),
    new Card(
      elevation: 10,
      child: FittedBox(
          child: Image(
            image: AssetImage('assets/images/asian-chopsticks-cooking-697058.jpg'),
          ),
          fit: BoxFit.fitWidth),
    ),
    new FlutterLogo(style: FlutterLogoStyle.stacked, colors: Colors.red),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    new FlutterLogo(colors: Colors.pink),
  ];
  

  Widget _buildPageItem(BuildContext context, int index) {
    return new Page(page: _pages[index], idx: index);
  }

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        //child:List <Widget> [
          //new RaisedButton(
            //onPressed: () {
            // Navigate back to first route when tapped. 
            // Navigator.pop(context);
              //Navigator.pushNamed(context, LoginRoute);
            //},
            //child: Text('Next Step!'),
          //),

        child: Center(
    
          child: new Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.grey[700],
              // ),
              color: Colors.blueGrey[100],
              //color: null,
            ),

            child: new Stack(
              children: <Widget>[
                Positioned(
                  bottom: 50,
                  child: Container(
                    //color: Colors.yellow[100],
                    height: 240,
                    width: 400,
                    child: new PageView.builder(
                      physics: new AlwaysScrollableScrollPhysics(),
                      controller: _controller,
                      itemCount: _pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPageItem(context, index % _pages.length);
                      },
                    ),
                  ),
                ),
                new Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: new Container(
                    //color: Colors.grey[800].withOpacity(0.5),
                    padding: const EdgeInsets.all(12.0),
                    child: new Center(
                      child: Column(
                        children: <Widget>[
                          new DotsIndicator(
                            controller: _controller,
                            itemCount: _pages.length,
                            onPageSelected: (int page) {
                              _controller.animateToPage(
                                page,
                                duration: _kDuration,
                                curve: _kCurve,
                              );
                            },
                          ),
                          FlatButton(
                            onPressed: () {
                                Navigator.pushNamed(context,LoginRoute);
                                },
                            textColor: Colors.green,
                            child: Text('Next'),
                          ),
                        ],
                      ),
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.grey,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 24.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      //color: Colors.purple,
      width: _kDotSpacing,
      height: _kDotSize * _kMaxZoom,
      child: new Center(
        child: new Material(
          color: Color.fromRGBO(
              color.red, color.green, color.blue, max(selectedness, 0.5)),
          // color: color,
          type: MaterialType.circle,
          child: new Container(
            // color: Colors.teal,
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}



class Page extends StatelessWidget {
  final page;
  final idx;

  Page({
    @required this.page,
    @required this.idx,
  });

  onTap() {
    print("${this.idx} selected.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 200.0,
            width: 200.0,
            color: null, // Colors.pinkAccent[400],
            child: new Card(
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    child: this.page,
                    // color: Colors.brown[200],
                  ),
                  new Material(
                    type: MaterialType.transparency,
                    child: new InkWell(onTap: this.onTap),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
