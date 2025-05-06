import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepo communityRepo;

  CommunityCubit(this.communityRepo) : super(CommunityInitial());

  StreamSubscription? _streamSubscription;

  void getPosts() {
    emit(CommunityLoading());
    _streamSubscription = communityRepo.getPosts().listen((result) {
      result.fold(
        (e) => emit(
          CommunityFailure(e.toString()),
        ),
        (posts) => emit(
          CommunitySuccess(posts),
        ),
      );
    });
  }

  // bool isPostLiked(PostModel post) {
  //   final currentUser = getUserEntitiy();
  //   return post.likedBy.contains(currentUser.uId);
  // }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
