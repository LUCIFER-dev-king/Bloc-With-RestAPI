import 'package:apiwithbloc/bloc/post/post_event.dart';
import 'package:apiwithbloc/bloc/post/post_state.dart';
import 'package:apiwithbloc/data/modal/apimodal.dart';
import 'package:apiwithbloc/data/repository/post_respository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostRepository postRepository;

  PostBloc({@required this.postRepository}) : super(PostInitialState());

  @override
  PostState get initialState => PostInitialState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // TODO: implement mapEventToState
    if(event is FetchPostEvent){
        yield PostLoadingState();
        try{
          List<Post> posts = await postRepository.getPost();
          yield PostLoadedState(posts: posts);
        }catch(e){
          yield PostErrorState(message: e.toString());
        }
    }
  }
  
}