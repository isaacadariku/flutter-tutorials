import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_details_view.desktop.dart';
import 'chat_details_view.mobile.dart';
import 'chat_details_view.tablet.dart';
import 'chat_details_viewmodel.dart';

class ChatDetailsView extends StackedView<ChatDetailsViewModel> {
  const ChatDetailsView(@pathParam this.chatId, {super.key});
  final String chatId;

  @override
  Widget builder(
    BuildContext context,
    ChatDetailsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ChatDetailsViewMobile(),
      tablet: (_) => const ChatDetailsViewTablet(),
      desktop: (_) => const ChatDetailsViewDesktop(),
    );
  }

  @override
  ChatDetailsViewModel viewModelBuilder(BuildContext context) =>
      ChatDetailsViewModel(chatId: chatId);
}
