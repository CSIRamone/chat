import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:chat/core/services/auth/auth_service.dart';

import '../../models/chat_user.dart';

class AuthMockService implements AuthService {
  static const _defaultUser = ChatUser(
    id: '12345',
    name: 'laisaTeste',
    email: 'laisateste@csiramone.com.br',
    imageUrl: 'assets/image/user.png',
  );

  static final Map<String, ChatUser> _users = {
    _defaultUser.email: _defaultUser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
      String nome, String email, String password, File? image) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: nome,
      email: email,
      imageUrl: image?.path ?? 'assets/image/user.png',
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
