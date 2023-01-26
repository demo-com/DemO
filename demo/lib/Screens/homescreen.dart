
import 'package:demo/Screens/profilescreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_buildBody,
    );
  }
  get _buildBody{
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
            icon:const CircleAvatar(
              foregroundColor: Colors.white70,
              radius:50.0,
              backgroundImage: AssetImage("assets/profile_user.jpg"),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) =>const ProfilePage()))
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
              title: Center(
                child: Text('$index',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 50,
                        color: Colors.greenAccent[400]) //TextStyle
                ), //Text
              ), //Center
            ), 
            childCount: 50,
          ),
        ), 
      ],
    );
  }
  
}