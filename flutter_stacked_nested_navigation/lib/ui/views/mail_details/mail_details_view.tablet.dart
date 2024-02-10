import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'mail_details_viewmodel.dart';

class MailDetailsViewTablet extends ViewModelWidget<MailDetailsViewModel> {
  const MailDetailsViewTablet({super.key});

  @override
  Widget build(BuildContext context, MailDetailsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.mail.subject),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
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
      ),
    );
  }
}
