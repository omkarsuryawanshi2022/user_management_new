import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import '../services/firebase_service.dart';
import '../models/message.dart';
import '../widgets/message_widget.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _messageController;
  late FirebaseService _firebaseService;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _firebaseService = FirebaseService();
  }

  void _sendMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      String senderId = FirebaseAuth.instance.currentUser!.uid;
      _firebaseService.sendMessage(senderId, message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          // Expanded(
          //   child: StreamBuilder(
          //     stream: _firebaseService.getMessages(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //       if (snapshot.hasData) {
          //         var messages = snapshot.data!.snapshot.value as Map;
          //         List<Message> messageList = [];
          //         messages.forEach((key, value) {
          //           messageList.add(Message.fromMap(value));
          //         });
          //         return ListView.builder(
          //           itemCount: messageList.length,
          //           itemBuilder: (context, index) {
          //             return MessageWidget(message: messageList[index]);
          //           },
          //         );
          //       }
          //       return Center(child: Text('No messages yet.'));
          //     },
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
