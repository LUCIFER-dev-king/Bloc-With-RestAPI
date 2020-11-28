import 'package:apiwithbloc/bloc/post/post_bloc.dart';
import 'package:apiwithbloc/bloc/post/post_event.dart';
import 'package:apiwithbloc/bloc/post/post_state.dart';
import 'package:apiwithbloc/data/modal/apimodal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatefulWidget {
  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  PostBloc postBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostEvent());
  }

   @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Rest API with Bloc"),
              ),
              body: Container(
                child: BlocListener<PostBloc, PostState>(
                  listener: (context, state) {
                    if (state is PostErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      if (state is PostInitialState) {
                        return buildLoading();
                      } else if (state is PostLoadingState) {
                        return buildLoading();
                      } else if (state is PostLoadedState) {
                        return buildPostList(state.posts);
                      } else if (state is PostErrorState) {
                        return buildErrorUi(state.message);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

   Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildPostList(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              title: Text(posts[pos].title),
              subtitle: Text(posts[pos].body),
            ),
            onTap: () {
            },
          ),
        );
      },
    );
  }
} 