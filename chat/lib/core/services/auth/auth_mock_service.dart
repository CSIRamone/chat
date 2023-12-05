import 'dart:io';

import 'package:chat/core/services/auth/auth_service.dart';

import '../../models/chat_user.dart';

class AuthMockService implements AuthService {
  @override
  ChatUser? get currentUser {
    return null;
  }

  @override
  Stream<ChatUser?> get userChanges {}

  Future<void> signup(
      String nome, String email, String password, File image) async {}

  Future<void> login(String email, String password) async {}

  Future<void> logout() async {}
}
