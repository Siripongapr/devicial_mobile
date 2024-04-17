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
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
              Icon(
                Icons.person,
                size: 28,
              ),
            ],
          ),
        ),
      ),
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
