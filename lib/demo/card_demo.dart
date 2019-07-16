import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: post.map((post){
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(  //图像，放在AspectRatio里
                    aspectRatio: 16/9,
//                    child: Image.network( //设置图片
//                      post.imageUrl,
//                      fit: BoxFit.cover,
//                    ),
                    child: ClipRRect( //设置带圆角的图片
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(4.0),
                         topRight: Radius.circular(4.0),
                       ),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(post.description, maxLines: 2, overflow: TextOverflow.ellipsis,), //ellipsis显示省略号
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Like'.toUpperCase()),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text('Read'.toUpperCase()),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
