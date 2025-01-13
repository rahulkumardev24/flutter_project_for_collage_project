import 'package:flutter/material.dart';

class MyFlutterTabs extends StatefulWidget {
  const MyFlutterTabs({super.key});

  @override
  State<MyFlutterTabs> createState() => _MyFlutterTabsState();
}

class _MyFlutterTabsState extends State<MyFlutterTabs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Tabs bar in flutter"),
              bottom: const TabBar(
                  labelColor: Colors.orange,
                  dividerColor: Colors.greenAccent,
                  dividerHeight: 2,
                  indicatorColor: Colors.blueAccent,
                  unselectedLabelColor: Colors.black87, 
                  indicatorWeight: 7,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home_filled),
                      text: "Home",
                    ),
                    Tab(
                      icon: Icon(Icons.ondemand_video_outlined),
                      text: "Course",
                    ),
                    Tab(
                      icon: Icon(Icons.notifications_none_rounded),
                      text: "Notification",
                    ),
                    Tab(
                      icon: Icon(Icons.account_circle_rounded),
                      text: "Profile",
                    ),
                  ]),
            ),
            body: const TabBarView(children: [
              Icon(
                Icons.home_filled,
                size: 80,
                color: Colors.orange,
              ),
              Icon(
                Icons.video_collection_rounded,
                size: 80,
                color: Colors.orange,
              ),
              Icon(
                Icons.notifications_none_rounded,
                size: 80,
                color: Colors.orange,
              ),
              Icon(
                Icons.account_circle_rounded,
                size: 80,
                color: Colors.orange,
              ),
            ]),
          )),
    );
  }
}
