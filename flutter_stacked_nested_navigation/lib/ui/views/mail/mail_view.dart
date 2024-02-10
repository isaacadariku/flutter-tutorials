import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'mail_view.desktop.dart';
import 'mail_view.tablet.dart';
import 'mail_view.mobile.dart';
import 'mail_viewmodel.dart';

class MailView extends StackedView<MailViewModel> {
  const MailView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MailViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const MailViewMobile(),
      tablet: (_) => const MailViewTablet(),
      desktop: (_) => const MailViewDesktop(),
    );
  }

  @override
  MailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MailViewModel();
}
