import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/models/mail_model.dart';
import 'package:flutter_stacked_nested_navigation/ui/views/mail/mail_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MailListView extends ViewModelWidget<MailViewModel> {
  const MailListView({super.key});

  @override
  Widget build(BuildContext context, MailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListView.builder(
        itemCount: demoMailData.length,
        itemBuilder: (context, index) {
          final mail = demoMailData[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            onTap: () => viewModel.navigateToMailDetails(mail),
            leading: CircleAvatar(
              radius: 15,
              child: Text(mail.sender[0].toUpperCase()),
            ),
            title: Text(mail.sender),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mail.subject,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(mail.body),
              ],
            ),
            trailing: Text(
              "${mail.date.day}/${mail.date.month}/${mail.date.year}",
            ),
          );
        },
      ),
    );
  }
}
