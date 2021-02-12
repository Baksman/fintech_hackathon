import 'package:flutter/material.dart';
import "package:fintech_hackathon/core/utils/media_query_utils.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc_bloc.dart';

class SingupScreen extends StatefulWidget {
  static const routePath = "/signup";
  @override
  _SingupScreenState createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(children: [
            Container(
                height: context.mediaQuery.height / 3,
                width: double.infinity),
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
            Align(
              alignment: Alignment.topLeft,
              child: Text("Comfirm Password"),
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
              onPressed: () {
                // BlocProvider.of(context).ad
              },
              child: Text("Submit"),
            )
          ]),
        ),
      ),
    ));
  }
}
