import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_scratch/dots.dart';
import 'route_paths.dart' as routes;
import 'login.dart';
import 'undefined.dart';
import 'main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case routes.MenuRoute:
      return MaterialPageRoute(builder: (context) => MyHomePage());
    case routes.DotsRoute:
      return MaterialPageRoute(builder: (context) => DotsView());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
