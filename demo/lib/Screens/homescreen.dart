import 'package:flutter/material.dart';

import '../Components/mydrawerfooter.dart';
import '../Components/mydrawerheader.dart';
import '../Components/mydrawerlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      appBar:_buildAppBar,
      body:_buildBody,
      drawer: _buildDrawer,
    );
  }
  get _buildAppBar{
    return AppBar(
      leading:IconButton(
        icon:const CircleAvatar(
          foregroundColor: Colors.white70,
          radius:50.0,
          backgroundImage: AssetImage("assets/profile_user.jpg"),
        ),
        onPressed: (){
          _scaffoldKey.currentState?.openDrawer();
        }) ,
    );
  }
  get _buildBody{
    return Container(
      alignment: Alignment.center,
      child:const Text('Home Screen'),
    );
  }

  get _buildDrawer{
    return Drawer(
      child: SingleChildScrollView(
        child:Column(
          children:const [
            MyDrawerHeader(),
            MyDrawerList(),
            MyDrawerFooter(),
          ],
        ),
      ),
    );
  }
}