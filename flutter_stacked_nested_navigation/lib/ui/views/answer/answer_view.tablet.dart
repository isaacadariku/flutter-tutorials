import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'answer_viewmodel.dart';

class AnswerViewTablet extends ViewModelWidget<AnswerViewModel> {
  const AnswerViewTablet({super.key});

  @override
  Widget build(BuildContext context, AnswerViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
