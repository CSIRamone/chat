import 'package:chat/core/services/auth/auth_mock_service.dart';
import 'package:chat/pages/auth_pages.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/load_pages.dart';
import 'package:flutter/material.dart';

import '../core/models/chat_user.dart';
import '../core/services/auth/auth_service.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadPages();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        },
      ),
    );
  }
}
