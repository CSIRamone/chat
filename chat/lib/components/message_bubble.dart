import 'package:chat/core/models/chat_messages.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongToCurrentUser;
  const MessageBubble({
    super.key,
    required this.message,
    required this.belongToCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          belongToCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color:
                belongToCurrentUser ? Colors.cyan : Theme.of(context).hintColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          width: 180,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(children: [
            Text(
              message.userName,
              style: TextStyle(
                color:
                    belongToCurrentUser ? Colors.red.shade900 : Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message.text,
              style: TextStyle(
                color:
                    belongToCurrentUser ? Colors.red.shade900 : Colors.white70,
              ),
            ),
          ]),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
