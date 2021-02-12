import 'package:flutter/material.dart';
import "package:fintech_hackathon/core/utils/media_query_utils.dart";

class LoginScreen extends StatefulWidget {
  static const routePath = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(children: [
          Container(
              height: context.mediaQuery.height / 3, width: double.infinity),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Email"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Password"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
            ),
            onPressed: () {},
            child: Text("Submit"),
          )
        ]),
      ),
    ));
  }
}
