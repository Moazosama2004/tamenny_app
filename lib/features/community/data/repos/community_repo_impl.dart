import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/utils/backend_end_point.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/domain/entites/comment_entity.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';

class CommunityRepoImpl implements CommunityRepo {
  final DatabaseService databaseService;

  CommunityRepoImpl(this.databaseService);

  @override
  Stream<Either<Failure, List<PostEntity>>> getPosts() async* {
    try {
      await for (var (result as List<Map<String, dynamic>>) in databaseService
          .streamData(
              path: BackendEndPoint.getPosts,
              query: {'orderBy': 'createdAt', 'descending': true})) {
        List<PostEntity> posts = (result as List<dynamic>).map((data) {
          return PostModel.fromJson(data).toEntity();
        }).toList();
        yield right(posts);
      }
    } catch (e) {
      yield left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addPost({required PostEntity post}) async {
    try {
      await databaseService.addData(
          path: BackendEndPoint.addPost,
          data: PostModel.fromEntity(post).toJson());
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addComment({required CommentEntity comment}) {
    // TODO: implement addComment
    throw UnimplementedError();
  }
}
