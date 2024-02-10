import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/ui/views/chat/components/chat_list_view.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatViewMobile extends ViewModelWidget<ChatViewModel> {
  const ChatViewMobile({super.key});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    return const Scaffold(
      body: SafeArea(
        child: ChatListView(),
      ),
    );
  }
}
