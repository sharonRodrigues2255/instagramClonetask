import 'package:flutter/material.dart';
import 'package:flutter_application_6/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formkey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formkey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "filed is required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password cant be empty";
                    } else if (value.length < 5) {
                      return "password must be 5 characters";
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "password", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();

                      await pref.setBool("Log", true);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HOmepage()));
                      usernameController.clear();
                      passwordController.clear();
                    }
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Sign up",
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
      ),
    );
  }
}
