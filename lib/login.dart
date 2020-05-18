import 'package:flutter/material.dart';
import 'dimensions.dart';
import 'route_paths.dart';

import 'screen.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              productRow,
              Container(
                  width: 360,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'DGMD E-11 Demo App',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                height: 16.0,
              ),
              Container(
                width: 360.0,
                height:50,
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage('assets/images/GettyImages-924095140.jpg'),
                ),
              ),
              Container(
                height: 16.0,
              ),
              Container(
                  width: 360,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  )),
              Container(
                height: 16.0,
              ),
              Container(
                width: loginContentWidth,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                width: loginContentWidth,
                padding: EdgeInsets.fromLTRB(
                  3 * cellSize, 3 * cellSize, 3 * cellSize, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  //forgot password screen
                },
                textColor: Colors.green,
                child: Text('Forgot Password'),
              ),
              Container(
                  width: loginContentWidth,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.pushNamed(context, MenuRoute);
                    },
                  )),
              Container(
                  width: loginContentWidth,
                  child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      FlatButton(
                        textColor: Colors.green,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
            ],
          ),
        ));
  }
}
