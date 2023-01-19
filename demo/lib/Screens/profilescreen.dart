
import 'package:flutter/material.dart';

import '../Components/text_app.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<String> option =['documents','photos','videos'];
  String currentItem = 'documents';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
             SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading:const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
              title: const TextApp(text: 'Profile',size: 20,),
              actions: const [
                Icon(Icons.more_vert_rounded,color: Colors.black,),
                SizedBox(width: 16,)
              ],
              expandedHeight: 250,
              elevation: 0,
              pinned: true, // Appbar pin at the top
              floating: true,// Appbar show immediately
              
              flexibleSpace: _buildBackgroundAppbar(),
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                _buildMenuSection(),
                _buildDescriptionSection(),
              ])
            ),

            if(currentItem==option[0]) _buildDocumentOption(),
            if(currentItem==option[1]) _buildPhotoOption(),
            if(currentItem==option[2]) _buildPhotoOption(int: 10),
            
          ]
        ), 
      ),
    );
  }

  FlexibleSpaceBar _buildBackgroundAppbar() {
    return FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.only(top:30),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                     CircleAvatar(
                      backgroundImage: AssetImage('asset/icons/profile.jpg'),
                      radius: 60,
                    ),
                     SizedBox(height: 10,),
                     TextApp(text: 'Alli Zaly',fontWeight: FontWeight.bold,),
                  ],
                ),
              ),
            );
  }

  Container _buildMenuSection() {
    return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 16,right: 16, top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        menuItem(labelText: 'Documents',numberOfcontent: 100),
                        menuItem(labelText: 'Photos',numberOfcontent: 150),
                        menuItem(labelText: 'Videos',numberOfcontent: 50),
                      ]
                    ),
                  ],
                ),
            );
  }

  Padding _buildDescriptionSection() {
    return Padding(
            padding:const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const[
                Divider(thickness: 1,),
                TextApp(text: 'Personals', fontWeight: FontWeight.bold,size: 16,),
                TextField(
                  style: TextStyle(fontFamily: 'Poppin',color: Colors.black,fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Write about you...',
                    hintStyle: TextStyle(color: Colors.grey,fontFamily: 'Poppin'),
                    border: InputBorder.none
                  ),
                )
              ],
            )
          );
  }

  Widget menuItem ({required String labelText, int numberOfcontent=0})
  {
    Color color = currentItem==labelText.toLowerCase()?Theme.of(context).primaryColor:Colors.black;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentItem = labelText.toLowerCase();
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextApp( 
            text: '$numberOfcontent',
            size: 14,
            color: color,
          ),
          TextApp(
            text: labelText,
            size: 16,
            color: color,)
        ],
      ),
    );
  }
  
  Widget _buildDocumentOption() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.folder_rounded,color: Colors.black.withAlpha(80),),
              ),
              title: TextApp(text: 'Document $index', size: 16, fontWeight: FontWeight.bold,),
              subtitle: TextApp(
                text: 'Engineering,Phnom Penh $index',
                size: 14, 
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 66,right: 16,top: 10,bottom: 10),
              child: Divider(height: 1,),
            ),
          ],
        );
      },
      childCount: 10,)
    );
  }

  Widget _buildPhotoOption({int int = 0}){
    return SliverGrid(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6
      ), 
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
            margin: index%2==0? const EdgeInsets.only(left: 16) : const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/seed/${index+int}/600'),
                fit: BoxFit.cover,
              )
            ),
        ),
        childCount: 20,
      ),
      
    );
  }

  // photos widget
  
}