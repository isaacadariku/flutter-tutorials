import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/models/chat_model.dart';
import 'package:flutter_stacked_nested_navigation/ui/views/chat/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChatListView extends ViewModelWidget<ChatViewModel> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: demoChats.length,
        itemBuilder: (context, index) {
          final chat = demoChats[index];
          return ListTile(
            onTap: () => viewModel.navigateToChatDetails(chat),
            leading: CircleAvatar(
              radius: 25,
              child: Text(chat.title[0] + chat.title[1]),
            ),
            title: Text(chat.title),
            subtitle: Text(chat.lastMessage),
            trailing: Text(
              "${chat.lastMessageTime.day}/${chat.lastMessageTime.month}/${chat.lastMessageTime.year}",
            ),
          );
        },
      ),
    );
  }
}
