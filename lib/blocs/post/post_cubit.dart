import 'package:bloc/bloc.dart';
import 'package:devicial_mobile/models/post.dart';
import 'package:devicial_mobile/repository/post.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  Post postRepo;
  PostCubit(this.postRepo) : super(PostInitial());

  void createPost(String title, String content) async {
    emit(PostLoading());
    try {
      await postRepo.createPost(title, content);
      emit(PostSuccess());
    } catch (e) {
      emit(PostError());
    }
  }

  void getAllPost() async {
    emit(PostGetLoading());
    try {
      final posts = await postRepo
          .getAllPosts(); // Assuming you have a method like this in your repository
      emit(PostGetSuccess(posts));
    } catch (e) {
      emit(PostGetError());
    }
  }

  void viewPost(String postId) async {
    emit(PostViewLoading());
    try {
      final view = await postRepo.viewPost(postId);
      emit(PostViewSuccess(view));
    } catch (e) {
      emit(PostViewError());
    }
  }
}
