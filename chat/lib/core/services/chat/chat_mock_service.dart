import 'dart:async';
import 'dart:math';

import '../../models/chat_messages.dart';
import '../../models/chat_user.dart';
import 'chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia !!!!',
      createAt: DateTime.now(),
      userId: '123',
      userName: 'CSIRamoneTeste',
      userImageURL: 'chat/assets/image/user.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia.... vamos ter a dayli hj?',
      createAt: DateTime.now(),
      userId: '1234',
      userName: 'JoaoTeste',
      userImageURL: 'chat/assets/image/user.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Sim... Pode Ser agora!',
      createAt: DateTime.now(),
      userId: '12345',
      userName: 'LaisaTeste',
      userImageURL: 'chat/assets/image/user.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      createAt: DateTime.now(),
      id: Random().nextDouble().toString(),
      text: text,
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }
}
