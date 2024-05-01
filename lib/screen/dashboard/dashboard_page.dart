import 'package:devicial_mobile/blocs/post/post_cubit.dart';
import 'package:devicial_mobile/materials/widget/dashboard_card.dart';
import 'package:devicial_mobile/materials/widget/new_post_button.dart';
import 'package:devicial_mobile/materials/widget/sidebar.dart';
import 'package:devicial_mobile/materials/widget/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController search = TextEditingController();
  late PostCubit postCubit;
  @override
  void initState() {
    super.initState();
    postCubit = BlocProvider.of<PostCubit>(context);
    postCubit.getAllPost();
  }

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
      endDrawer: SideBar(),
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
                        SizedBox(
                          // Limit the height of ListView.builder
                          height: MediaQuery.of(context).size.height - 200,
                          child: BlocBuilder<PostCubit, PostState>(
                            builder: (context, state) {
                              if (state is PostGetLoading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (state is PostGetError) {
                                return Center(
                                    child: Text('Error loading posts'));
                              } else if (state is PostGetSuccess) {
                                return ListView.builder(
                                  itemCount: state.posts.length,
                                  itemBuilder: (context, index) {
                                    final post = state.posts[index];
                                    final username =
                                        post.user?.username ?? 'Unknown';
                                    final date = post.date.toString();
                                    final title = post.title;
                                    final content = post.contents.isNotEmpty
                                        ? post.contents[0].content
                                        : '';
                                    final visit = post.views.length.toString();
                                    final like = post.likes.length.toString();
                                    return GestureDetector(
                                      onTap: () {
                                        postCubit.viewPost(post.id.toString());
                                        Navigator.pushNamed(
                                            context, '/viewPost');
                                      },
                                      child: DashBoardCard(
                                        username: username,
                                        date: date,
                                        title: title,
                                        content: content,
                                        visit: visit,
                                        like: like,
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                    child: Text('No posts available'));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
      floatingActionButton: NewPostButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newPost')
              .then((value) => postCubit.getAllPost());
          ;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Adjust this based on your preference
    );
  }
}
