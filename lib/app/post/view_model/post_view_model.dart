import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx_pattern/app/post/model/post_model.dart';
import 'package:mobx/mobx.dart';
part 'post_view_model.g.dart';

class PostViewModel = PostViewModelBase with _$PostViewModel;

abstract class PostViewModelBase with Store {
  @observable
  List<Post> posts = [];

  @observable
  PageState pageState = PageState.normal;

  // @observable
  // bool isServiceRequestLoading = false;

  @action
  Future getAllPost() async {
    pageState = PageState.loading;
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == HttpStatus.ok) {
        final responseData = response.data as List;
        posts = responseData.map((e) => Post.fromJson(e)).toList();
        pageState = PageState.success;
      } else {
        pageState = PageState.error;
      }
    } catch (e) {
      pageState = PageState.error;
    }
  }

  // @action
  // void changeLoading() {
  //   isServiceRequestLoading = !isServiceRequestLoading;
  // }
}

enum PageState { normal, loading, error, success }
