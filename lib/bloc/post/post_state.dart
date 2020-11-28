import 'package:apiwithbloc/data/modal/apimodal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PostState extends Equatable{}

class PostInitialState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PostLoadingState extends PostState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PostLoadedState extends PostState{

  List<Post> posts;
  PostLoadedState({@required this.posts});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PostErrorState extends PostState{

  String message;
  PostErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;
}