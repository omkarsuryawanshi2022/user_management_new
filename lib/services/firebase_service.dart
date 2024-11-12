import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref('messages');

  // Send message
  Future<void> sendMessage(String senderId, String message) async {
    final messageData = {
      'sender_id': senderId,
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await _messagesRef.push().set(messageData);
  }

  // Stream messages in real-time
  // Stream<Event> getMessages() {
  //   return _messagesRef.orderByChild('timestamp').onChildAdded;
  // }
}
