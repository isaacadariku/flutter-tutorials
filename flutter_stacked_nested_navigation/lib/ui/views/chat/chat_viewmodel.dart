import 'package:flutter_stacked_nested_navigation/app/app.locator.dart';
import 'package:flutter_stacked_nested_navigation/app/app.router.dart';
import 'package:flutter_stacked_nested_navigation/models/chat_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends BaseViewModel {
  final routerService = locator<RouterService>();

  void navigateToChatDetails(Chat chat) {
    routerService.navigateTo(ChatDetailsViewRoute(chatId: chat.id));
  }
}
