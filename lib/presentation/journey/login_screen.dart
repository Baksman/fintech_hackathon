import 'package:flutter/material.dart';
import "package:fintech_hackathon/core/utils/media_query_utils.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(height: context.mediaQuery.height, width: double.infinity)
      ]),
    ));
  }
}
