import 'package:flutter_stacked_nested_navigation/models/chat_model.dart';
import 'package:stacked/stacked.dart';

class ChatDetailsViewModel extends BaseViewModel {
  ChatDetailsViewModel({required this.chatId});
  String chatId;

  Chat get chat => demoChats.firstWhere((chat) => chat.id == chatId);
}
