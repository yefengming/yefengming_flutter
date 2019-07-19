import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  get postJsonConverted => null;

  @override
  void initState() {
    super.initState();
//    fetchPosts();

    //转换数据
//    final post = {
//      'title': 'hello',
//      'description': 'nice to meet you.',
//    };
//
//    print(post['title']);
//    print(post['description']);
//
//    final postJson = json.encode(post);
//    print(postJson);  //{"title":"hello","description":"nice to meet you."}
//
//    final postJsonConverted = json.decode(postJson);
//    print(postJsonConverted['title']);
//    print(postJsonConverted['description']);
//    print(postJsonConverted is Map);  //转Map
//
//    final postModel = Post.fromJson(postJsonConverted); //Map转model
//    print('title: ${postModel.title}, description: ${postModel.description}'); //title: hello, description: nice to meet you.
//
//    print('${json.encode(postModel)}'); //encode自动调用Map的toJson:{"title":"hello","descritpion":"nice to meet you."}


    //获取数据
//    fetchPosts()
//        .then((value) => print(value)); //有数据value时输出
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/post.json');

//    print('statusCode: ${response.statusCode}');
//    print('body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
        .map<Post>((item) => Post.fromJson(item))
        .toList();

      return posts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        
        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
      this.id,
      this.title,
      this.description,
      this.author,
      this.imageUrl,
      );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
    'title': title,
    'descritpion': description,
  };
}
