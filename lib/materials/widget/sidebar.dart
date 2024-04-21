import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key, this.username = 'username'}) : super(key: key);
  final String username;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Drawer(
          width: 200,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 100,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: ThemeColor.backgroundDark,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(username),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Edit profile'),
                      onTap: () {
                        print("Edit profile");
                      },
                    ),
                    ListTile(
                      title: const Text('My posts'),
                      onTap: () {
                        print("My posts");
                      },
                    ),
                    ListTile(
                      title: const Text('Status'),
                      onTap: () {
                        print("Status");
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.logout,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign out',
                    ),
                  ],
                ),
                onTap: () {
                  print("Sign out");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
