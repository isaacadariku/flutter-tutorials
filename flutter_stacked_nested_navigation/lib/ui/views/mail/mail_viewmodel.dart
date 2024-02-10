import 'package:flutter_stacked_nested_navigation/app/app.locator.dart';
import 'package:flutter_stacked_nested_navigation/app/app.router.dart';
import 'package:flutter_stacked_nested_navigation/models/mail_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MailViewModel extends BaseViewModel {
  final routerService = locator<RouterService>();

  void navigateToMailDetails(Mail mail) {
    routerService.navigateTo(MailDetailsViewRoute(mailId: mail.id));
  }
}
