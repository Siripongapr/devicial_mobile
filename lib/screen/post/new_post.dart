import 'package:devicial_mobile/blocs/login/login_cubit.dart';
import 'package:devicial_mobile/blocs/post/post_cubit.dart';
import 'package:devicial_mobile/materials/color.dart';
import 'package:devicial_mobile/materials/widget/new_post_button.dart';
import 'package:devicial_mobile/materials/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  late PostCubit postCubit;
  @override
  void initState() {
    super.initState();
    postCubit = BlocProvider.of<PostCubit>(context);
  }

  showLoading(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(), // Circular loading indicator
                SizedBox(height: 20),
                Text(
                  'Loading...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showError(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(Icons.error, color: Colors.red, size: 48), // Error icon
                SizedBox(height: 20),
                Text('An error occurred. Please try again later.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                'New post',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        // leading: new Container(),
        actions: <Widget>[Container()],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 49, right: 49, top: 35),
          child: Column(
            children: [
              SizedBox(
                height: 43, // Set the desired height here
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  obscureText: false,
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Post title',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              SizedBox(
                height: 503, // Set the desired height here
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  maxLines: 100,
                  obscureText: false,
                  controller: content,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Post content',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(left: 49, right: 49, bottom: 20, top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NewPostButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'cancel',
              heroTag: 'floatingActionButton1',
              cancel: true,
            ),
            SizedBox(
              width: 35,
            ),
            BlocListener<PostCubit, PostState>(
              listener: (context, state) {
                if (state is PostLoading) {
                  // Show loading dialog
                  return showLoading(context);
                } else if (state is PostError) {
                  // Show error dialog
                  return showError(context);
                } else if (state is PostSuccess) {
                  Navigator.pop(context);
                  return Navigator.pop(context);
                } else {
                  return print('else');
                }
              },
              child: NewPostButton(
                onPressed: () {
                  postCubit.createPost(title.text, content.text);
                },
                text: 'confirm',
                heroTag: 'floatingActionButton2',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Adjust this based on your preference
    );
  }
}
