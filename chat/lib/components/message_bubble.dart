import 'dart:io';

import 'package:chat/core/models/chat_messages.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = 'assets/image/user.png';
  final ChatMessage message;
  final bool belongToCurrentUser;
  const MessageBubble({
    super.key,
    required this.message,
    required this.belongToCurrentUser,
  });

  Widget _showUserImage(String imageURL) {
    ImageProvider? provider;

    final uri = Uri.parse(imageURL);
    if (uri.path.contains(_defaultImage)) {
      provider = const AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: belongToCurrentUser
                      ? Colors.cyan
                      : Theme.of(context).hintColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: belongToCurrentUser
                        ? const Radius.circular(12)
                        : const Radius.circular(0),
                    bottomRight: belongToCurrentUser
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                  )),
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Column(
                  crossAxisAlignment: belongToCurrentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.userName,
                      style: TextStyle(
                        color: belongToCurrentUser
                            ? Colors.red.shade900
                            : Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      message.text,
                      textAlign: belongToCurrentUser
                          ? TextAlign.right
                          : TextAlign.left,
                      style: TextStyle(
                        color: belongToCurrentUser
                            ? Colors.red.shade900
                            : Colors.white70,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongToCurrentUser ? null : 165,
          right: belongToCurrentUser ? 165 : null,
          child: _showUserImage(message.userImageURL),
        )
      ],
    );
  }
}
