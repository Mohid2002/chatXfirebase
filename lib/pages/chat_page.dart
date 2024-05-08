import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebasexchatapp/Services/Authentication/auth_service.dart';
import 'package:firebasexchatapp/Services/chats/chat_service.dart';
import 'package:firebasexchatapp/componenets/all_text_field.dart';
import 'package:firebasexchatapp/componenets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({Key? key, required this.receiverEmail, required this.receiverID})
      : super(key: key);

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessages(BuildContext context) async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);

      // Clear text
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //foregroundColor: Colors.red,
        elevation: 0,
        title: Center(child: Text(receiverEmail)),
      ),
      body: Container(
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
        child: Column(
          children: [
            Expanded(child: _buildMessageList()),
            _buildUserInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading....");
        }
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data["message"],
            isCurrentUser: isCurrentUser,
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () => sendMessages(context),
              icon: Icon(Icons.arrow_upward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
