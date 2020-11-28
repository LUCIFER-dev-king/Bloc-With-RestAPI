import 'package:apiwithbloc/bloc/post/post_bloc.dart';
import 'package:apiwithbloc/data/repository/post_respository.dart';
import 'package:apiwithbloc/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rest Api with Bloc",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),      
      home: BlocProvider(
        create: (context) => PostBloc(postRepository: PostRepositoryImplementation()),
        child: HomePage(),
      )
    );
  }
}

