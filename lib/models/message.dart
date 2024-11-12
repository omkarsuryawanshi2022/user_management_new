class Message {
  final String senderId;
  final String text;
  final int timestamp;

  Message({required this.senderId, required this.text, required this.timestamp});

  factory Message.fromMap(Map<dynamic, dynamic> data) {
    return Message(
      senderId: data['sender_id'],
      text: data['text'],
      timestamp: data['timestamp'],
    );
  }
}
