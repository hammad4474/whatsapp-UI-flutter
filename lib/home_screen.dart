import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart' as badges;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("WhatsApp"),
            bottom: const TabBar(tabs: [
              Icon(Icons.camera),
              Text("Chat"),
              Text("Status"),
              Text("Calls")
            ]),
            actions: [
              const SizedBox(
                height: 10,
                width: 50,
              ),
              const Center(
                child: badges.Badge(
                  child: Icon(Icons.shop),
                  badgeContent: badges.Badge(
                    badgeContent: Text("4"),
                  ),
                  badgeStyle: badges.BadgeStyle(padding: EdgeInsets.all(0.1)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(Icons.search),
              SizedBox(width: 8),
              PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined),
                itemBuilder: (
                  context,
                ) =>
                    [
                  const PopupMenuItem(value: 1, child: Text("Settings")),
                  PopupMenuItem(value: 2, child: Text("Linked Devices")),
                  PopupMenuItem(value: 3, child: Text("More Info")),
                ],
              ),
            ],
          ),
          body: TabBarView(
            children: [
              // for camera
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("BE"),
                  SizedBox(width: 10),
                  AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText("Consistant",
                          textStyle: TextStyle(fontSize: 10)),
                      RotateAnimatedText("Faithful"),
                      RotateAnimatedText("Optimistic"),
                    ],
                  ),
                ],
              ),
              // for chats
              ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://1fid.com/wp-content/uploads/2022/06/Twitter-profile-picture-520x519.jpg"),
                      ),
                      title: Text("Tom"),
                      subtitle: Text("Where tf is jerry ? "),
                      trailing: Text("6:59 PM"),
                    );
                  }),
              // for status
              ListView.builder(itemBuilder: ((context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 3),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://1fid.com/wp-content/uploads/2022/06/Twitter-profile-picture-520x519.jpg"),
                    ),
                  ),
                  title: Text(index / 2 == 0 ? "My Status" : "Tom Status"),
                  trailing: Icon(
                      index / 2 == 0 ? Icons.update : Icons.send_to_mobile),
                  subtitle: Text(
                      index / 2 == 0 ? "Yesterday, 7:24 PM" : "Today,12:21 PM"),
                );
              })),
              // for calls
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://1fid.com/wp-content/uploads/2022/06/Twitter-profile-picture-520x519.jpg"),
                      ),
                      title: Text("Tom"),
                      subtitle: Text(index / 2 == 0
                          ? "You missed a call"
                          : "You missed a Video Call"),
                      trailing:
                          Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ],
          ),
        ));
  }
}
