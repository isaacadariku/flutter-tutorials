import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/ui/views/mail/components/mail_list_view.dart';
import 'package:stacked/stacked.dart';

import 'mail_viewmodel.dart';

class MailViewMobile extends ViewModelWidget<MailViewModel> {
  const MailViewMobile({super.key});

  @override
  Widget build(BuildContext context, MailViewModel viewModel) {
    return const Scaffold(
      body: SafeArea(
        child: MailListView(),
      ),
    );
  }
}
