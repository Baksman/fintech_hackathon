import 'package:fintech_hackathon/presentation/journey/login_screen.dart';
import 'package:fintech_hackathon/presentation/journey/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/auth/auth_bloc_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBlocBloc())],
        child: MaterialApp(
          title: 'Fintech',
          initialRoute: SingupScreen.routePath,

          routes: <String, WidgetBuilder>{
            LoginScreen.routePath: (context) {
              return LoginScreen();
            },
            SingupScreen.routePath: (context) {
              return SingupScreen();
            }
          },
          theme: ThemeData(primaryColor: Colors.teal

              // visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
          // home: LoginScreen()
        ));
  }
}
