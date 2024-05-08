import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasexchatapp/model/message.dart';

class ChatService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth =FirebaseAuth.instance;

  Stream<List<Map<String,dynamic>>>getUsersStream(){

    return _firestore.collection("Users").snapshots().map((snapshot){

      return snapshot.docs.map((doc){
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  //Send and receive messgae

  Future<void> sendMessage(String receiverID,message)async{

    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //message

    Message newMessage = Message(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp
    );

    //chat room

    List<String>ids = [currentUserId,receiverID];
    ids.sort();

    String chatRoomID = ids.join('_');

    await _firestore
        .collection("chats_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot>getMessages(String userID,otherUserID){

    List<String> ids = [userID,otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chats_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp",descending:false)
        .snapshots();
  }

}