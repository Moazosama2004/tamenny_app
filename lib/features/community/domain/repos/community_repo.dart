import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';

abstract class CommunityRepo {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, void>> addPost({required PostEntity post});
  addComment();
}
