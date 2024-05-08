import 'package:firebasexchatapp/Services/Authentication/auth_service.dart';
import 'package:firebasexchatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final _auth = AuthService();

    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Colors.black,
                    size: 80,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.home,color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("S E T T I N G S",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.settings,color: Colors.white,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mySetting()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("L O G O U T",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.logout,color: Colors.white,),
                  onTap: logout,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
