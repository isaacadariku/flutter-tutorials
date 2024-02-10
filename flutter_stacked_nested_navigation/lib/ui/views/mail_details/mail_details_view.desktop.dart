import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/ui/common/app_constants.dart';
import 'package:flutter_stacked_nested_navigation/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'mail_details_viewmodel.dart';

class MailDetailsViewDesktop extends ViewModelWidget<MailDetailsViewModel> {
  const MailDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, MailDetailsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.mail.subject),
      ),
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpaceLarge,
              Column(
                children: [
                  Text(
                    'From: ${viewModel.mail.sender}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  verticalSpaceMedium,
                  Text(
                    viewModel.mail.body,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  verticalSpaceMedium,
                  MaterialButton(
                    color: Colors.black,
                    onPressed: viewModel.incrementCounter,
                    child: Text(
                      viewModel.counterLabel,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
