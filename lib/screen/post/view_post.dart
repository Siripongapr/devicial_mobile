import 'package:devicial_mobile/blocs/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPostPage extends StatefulWidget {
  const ViewPostPage({Key? key}) : super(key: key);

  @override
  State<ViewPostPage> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPostPage> {
  String title = '';
  List<String> contents = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostViewLoading) {
          title = 'loading';
        } else if (state is PostViewSuccess) {
          title = state.viewPost.title;
          contents = state.viewPost.contents.map((content) {
            if (content.type == 'text') {
              return content.content.toString();
            } else {
              return ''; // Handle the case where the content is not available
            }
          }).toList();
        } else if (state is PostViewError) {
          title = 'error';
        }
      },
      builder: (context, state) {
        if (state is PostViewLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostViewError) {
          return Center(child: Text('Error loading posts'));
        } else if (state is PostViewSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for (var content in contents)
                    //   Text(
                    //     content,
                    //     style: TextStyle(fontSize: 16),
                    //   ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text('Error')),
          );
        }
      },
    );
  }
}
