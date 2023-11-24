import 'package:flutter/material.dart';
import 'package:flutter_application_6/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HOmepage extends StatelessWidget {
  const HOmepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.favorite),
          Icon(Icons.comment),
          InkWell(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setBool("log", false);
                Navigator.of(context).pushReplacement(
                    (MaterialPageRoute(builder: (context) => Login())));
              },
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 10,
          )
        ],
        title: Image(
            height: 50,
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUsyCGABwanwCwQNJIwpNceTlk3VbhX97ZBIfnYmxd0_v955YjD2q-vJYbVwi53lBAE3A&usqp=CAU")),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Text("$index"),
                          backgroundColor: Colors.accents[index],
                        ),
                        Text(
                          index == 0 ? "My story" : "status$index",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text("$index"),
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "User$index",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://pbs.twimg.com/profile_images/1526231349354303489/3Bg-2ZsT_400x400.jpg")),
                          ),
                        ),
                        Text(
                          "!00 likes",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(Icons.favorite),
                              Icon(Icons.comment),
                              Icon(Icons.send),
                              Spacer(),
                              Icon(Icons.bookmark_border),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(Icons.search),
            Icon(Icons.add_box),
            Icon(Icons.notification_important),
            Icon(Icons.person)
          ],
        ),
      ),
    );
  }
}
