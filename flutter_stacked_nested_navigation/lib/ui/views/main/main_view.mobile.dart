import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainViewMobile extends ViewModelWidget<MainViewModel> {
  const MainViewMobile({super.key});

  @override
  Widget build(BuildContext context, MainViewModel viewModel) {
    return StackedTabsScaffold(
      routes: const [
        MailNavigationRoute(),
        ChatNavigationRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => WillPopScope(
        onWillPop: () async {
          if (tabsRouter.activeIndex != 0) {
            tabsRouter.setActiveIndex(0);
            return false;
          }
          return true;
        },
        child: NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (index) {
            if (tabsRouter.activeIndex == index) {
              tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(index);
            }
          },
          destinations: [
            NavigationDestination(
              icon: Icon(
                tabsRouter.activeIndex == 0 //
                    ? Icons.mail //
                    : Icons.mail_outlined,
              ),
              label: 'Mail',
            ),
            NavigationDestination(
              icon: Icon(
                tabsRouter.activeIndex == 1
                    ? Icons.chat_bubble_rounded
                    : Icons.chat_bubble_outline_rounded,
              ),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
}
