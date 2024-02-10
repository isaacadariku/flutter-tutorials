import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'answer_view.desktop.dart';
import 'answer_view.tablet.dart';
import 'answer_view.mobile.dart';
import 'answer_viewmodel.dart';

class AnswerView extends StackedView<AnswerViewModel> {
  const AnswerView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AnswerViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AnswerViewMobile(),
      tablet: (_) => const AnswerViewTablet(),
      desktop: (_) => const AnswerViewDesktop(),
    );
  }

  @override
  AnswerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AnswerViewModel();
}
