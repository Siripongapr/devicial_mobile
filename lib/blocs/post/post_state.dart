part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostError extends PostState {}

final class PostSuccess extends PostState {}

final class PostGetLoading extends PostState {}

final class PostGetError extends PostState {}

final class PostGetSuccess extends PostState {
  final List<PostModel> posts;

  const PostGetSuccess(this.posts);

  @override
  List<Object> get props => [posts];
}

final class PostViewLoading extends PostState {}

final class PostViewError extends PostState {}

final class PostViewSuccess extends PostState {
  final ViewPost viewPost;

  const PostViewSuccess(this.viewPost);

  @override
  List<Object> get props => [viewPost];
}
