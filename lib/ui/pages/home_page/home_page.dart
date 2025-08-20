import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/edit_mode.dart';
import '../../../generated/l10n.dart';
import '../../../providers/date_time_provider.dart';
import '../../../ui/pages/home_page/apps_tab.dart';
import '../../../ui/pages/home_page/contacts_tab.dart';
import '../../../ui/pages/home_page/edit_dialog.dart';
import '../../../ui/pages/home_page/help_screen_tab.dart';
import '../../../ui/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarTextSizeGroup = AutoSizeGroup();

    void openEditDialog(int tabIndex) {
      EditMode editMode = (tabIndex == 0) ? EditMode.apps : EditMode.contacts;
      EditDialog(context, editMode);
    }

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: DefaultTabController(
        length: 3,
        child: ChangeNotifierProvider(
          create: (_) => DateTimeProvider(),
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    final controller = DefaultTabController.of(context);
                    if (controller != null) openEditDialog(controller.index);
                  },
                ),
              ],
              title: Consumer<DateTimeProvider>(
                builder: (_, dateTimeProvider, __) => AutoSizeText(
                  dateTimeProvider.time,
                  maxLines: 1,
                  style: TextStyles.headerTime,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Column(
                  children: [
                    Consumer<DateTimeProvider>(
                      builder: (_, dateTimeProvider, __) => AutoSizeText(
                        dateTimeProvider.date,
                        group: appBarTextSizeGroup,
                        maxLines: 1,
                        style: TextStyles.headerDate,
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        tabBarTheme: const TabBarTheme(
                          labelStyle: TextStyle(fontSize: 24),
                          unselectedLabelStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.apps),
                                const SizedBox(width: 8),
                                Text(S.of(context).apps, style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.contacts),
                                const SizedBox(width: 8),
                                Text(S.of(context).contacts, style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.help),
                                const SizedBox(width: 8),
                                Text(S.of(context).help, style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                AppsTab(),
                ContactsTab(),
                HelpScreenTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
