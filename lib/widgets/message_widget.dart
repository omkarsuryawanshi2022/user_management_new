import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.text),
      subtitle: Text('Sent at ${DateTime.fromMillisecondsSinceEpoch(message.timestamp).toLocal()}'),
    );
  }
}
