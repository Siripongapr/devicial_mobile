import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/materials/widget/dashboard_card.dart';
import 'package:devicial_mobile/materials/widget/new_post_button.dart';
import 'package:devicial_mobile/materials/widget/text_button_widget.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Devicial',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              // SizedBox(
              //   width: 128,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: "search",
              //       prefixIcon: Icon(
              //         Icons.search,
              //         size: 15,
              //       ),
              //     ),
              //   ),
              // ),
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
        // leading: new Container(),
        actions: <Widget>[Container()],
      ),
      endDrawer: NavigationDrawer(),
      endDrawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5.0), // Set the border radius here
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButtonWidget(
                                  text: 'Home',
                                  onPressed: () {},
                                  underline: false,
                                  fontSize: 15,
                                ),
                                TextButtonWidget(
                                  text: 'Following',
                                  onPressed: () {},
                                  underline: false,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        DashBoardCard(),
                        DashBoardCard(),
                        DashBoardCard(),
                        DashBoardCard(),
                        DashBoardCard(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
      floatingActionButton: NewPostButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Adjust this based on your preference
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: ThemeColor.backgroundDark,
              ),
              child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the UI based on the selection
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the UI based on the selection
            },
          ),
        ],
      ),
    );
  }
}
