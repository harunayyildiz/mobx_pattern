import 'package:mobx_pattern/app/post/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PostView extends StatelessWidget {
  PostView({super.key});
  final _viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await _viewModel.getAllPost();
        },
      ),
      body: Center(
        child: Observer(builder: (_) {
          switch (_viewModel.pageState) {
            case PageState.loading:
              return const CircularProgressIndicator();
            case PageState.error:
              return const Icon(Icons.error);
            case PageState.success:
              return ListView.builder(
                itemCount: _viewModel.posts.length,
                itemBuilder: ((context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      title: Text(_viewModel.posts[index].title ?? ''),
                      subtitle: Text(_viewModel.posts[index].body ?? ''),
                      trailing: Text(_viewModel.posts[index].userId.toString()),
                    ),
                  );
                }),
              );
            default:
              return const Text('Hoşgeldiniz');
          }
        }),
      ),
    );
  }
}
