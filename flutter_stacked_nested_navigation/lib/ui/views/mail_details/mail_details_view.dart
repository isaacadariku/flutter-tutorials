import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'mail_details_view.desktop.dart';
import 'mail_details_view.mobile.dart';
import 'mail_details_view.tablet.dart';
import 'mail_details_viewmodel.dart';

class MailDetailsView extends StackedView<MailDetailsViewModel> {
  const MailDetailsView(@pathParam this.mailId, {super.key});
  final String mailId;

  @override
  Widget builder(
    BuildContext context,
    MailDetailsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const MailDetailsViewMobile(),
      tablet: (_) => const MailDetailsViewTablet(),
      desktop: (_) => const MailDetailsViewDesktop(),
    );
  }

  @override
  MailDetailsViewModel viewModelBuilder(BuildContext context) =>
      MailDetailsViewModel(mailId: mailId);
}
