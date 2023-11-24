import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIN extends StatelessWidget {
  const SignIN({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 50,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUsyCGABwanwCwQNJIwpNceTlk3VbhX97ZBIfnYmxd0_v955YjD2q-vJYbVwi53lBAE3A&usqp=CAU")),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "password", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  pref.setString("username", usernameController.text);
                  pref.setString("password", passwordController.text);
                  pref.setBool("Log", true);
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
