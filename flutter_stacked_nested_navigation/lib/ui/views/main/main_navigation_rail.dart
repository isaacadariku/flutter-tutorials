import 'package:flutter/material.dart';
import 'package:flutter_stacked_nested_navigation/app/app.router.dart';
import 'package:stacked/stacked.dart';

class StackedScaffoldWithNavigationRail extends StatelessWidget {
  const StackedScaffoldWithNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return StackedTabsScaffold(
      routes: const [
        MailNavigationRoute(),
        ChatNavigationRoute(),
      ],
      builder: (context, child, animate) {
        final tabsRouter = context.tabsRouter;
        return Row(
          children: [
            NavigationRail(
              selectedIndex: tabsRouter.activeIndex,
              minExtendedWidth: 150,
              onDestinationSelected: (index) {
                if (tabsRouter.activeIndex == index) {
                  tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
                } else {
                  tabsRouter.setActiveIndex(index);
                }
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(
                    tabsRouter.activeIndex == 0 //
                        ? Icons.mail //
                        : Icons.mail_outlined,
                  ),
                  label: const Text('Mail'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    tabsRouter.activeIndex == 1
                        ? Icons.chat_bubble_rounded
                        : Icons.chat_bubble_outline_rounded,
                  ),
                  label: const Text('Chat'),
                ),
              ],
            ),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}
