import 'package:apiwithbloc/data/modal/apimodal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class PostRepository{
  Future<List<Post>> getPost();
}

class PostRepositoryImplementation extends PostRepository{
  @override
  Future<List<Post>> getPost() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if(response.statusCode ==200){
      final data = json.decode(response.body);
      List<Post> posts = [];
      for(var i in data){
        Post post = new Post.fromJson(i);
        posts.add(post);
      }
      return posts;
    }else{
      throw Exception();
    }    
  }

}