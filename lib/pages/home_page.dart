import 'package:firebasexchatapp/Services/Authentication/auth_service.dart';
import 'package:firebasexchatapp/Services/chats/chat_service.dart';
import 'package:firebasexchatapp/componenets/my_drawer.dart';
import 'package:firebasexchatapp/componenets/user_title.dart';
import 'package:firebasexchatapp/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Center(
          child: Text(
            'Home Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple,
            Colors.cyan,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading.....");
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>((userData) =>
                _buildUserListItem(userData, context))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTitle(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
