import 'package:flutter/material.dart';
import 'package:flutter_application_6/view/homepage.dart';
import 'package:flutter_application_6/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashNavigation(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1526231349354303489/3Bg-2ZsT_400x400.jpg"))),
        ),
      ),
    );
  }
}

splashNavigation(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  final bool? log = await pref.getBool("log");

  Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(
          builder: (context) =>
              log != null && log == true ? HOmepage() : Login())));
}
