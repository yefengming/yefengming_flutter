import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
//              DrawerHeader(  //抽屉的header
//                child: Text('header'.toUpperCase()), //大写
//                decoration: BoxDecoration(
//                  color: Colors.blue,
//                ),
//              ),
          UserAccountsDrawerHeader(  //用户相关的Header
            accountName: Text('yy', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('yy@yy.net'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('http://pic13.nipic.com/20110409/7119492_114440620000_2.jpg'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage('http://pic26.nipic.com/20121221/9252150_142515375000_2.jpg'), //Header背景图片
                    fit: BoxFit.cover, //填充方式
                    colorFilter: ColorFilter.mode(  //Header背景颜色
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.hardLight
                    )
                )
            ),
          ),
          ListTile(
            title: Text('Messages', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22,),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}