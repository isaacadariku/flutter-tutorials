import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_details_viewmodel.dart';

class ChatDetailsViewTablet extends ViewModelWidget<ChatDetailsViewModel> {
  const ChatDetailsViewTablet({super.key});

  @override
  Widget build(BuildContext context, ChatDetailsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.chat.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.chat.messages.length,
              itemBuilder: (context, index) {
                final message = viewModel.chat.messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    child: Text(message.sender[0] + message.sender[1]),
                  ),
                  title: Text(message.sender),
                  subtitle: Text(message.message),
                  trailing: Text(
                    "${message.time.day}/${message.time.month}/${message.time.year}",
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
