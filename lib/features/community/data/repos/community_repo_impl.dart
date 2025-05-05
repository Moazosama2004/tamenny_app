import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/utils/backend_end_point.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';

class CommunityRepoImpl implements CommunityRepo {
  final DatabaseService databaseService;

  CommunityRepoImpl(this.databaseService);

  @override
  addComment() {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      var result = await databaseService.getData(
              path: BackendEndPoint.getPosts,
              query: {'orderBy': 'createdAt', 'descending': true})
          as List<Map<String, dynamic>>;

      List<PostEntity> posts = result.map((data) {
        return PostModel.fromJson(data).toEntity();
      }).toList();
      return right(posts);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
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
}
