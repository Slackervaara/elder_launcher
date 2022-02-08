import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/custom_functions.dart';
import '../../../generated/l10n.dart';
import '../../../providers/app_provider.dart';
import '../../../models/item.dart';
import '../../../ui/common/loading_widget.dart';
import '../../../ui/theme.dart';
import '../../common/elder_page_scaffold.dart';

class AppDrawerScreen extends StatelessWidget {
  const AppDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void launchApp(String packageName) {
      context.read<AppProvider>().launchApp(packageName);
      Navigator.pop(context);
    }

    return ElderPageScaffold(
      title: S.of(context).btnAllApps,
      body: Consumer<AppProvider>(builder: (context, appService, _) {
        if (appService.isAppListLoaded && appService.allApps.isNotEmpty) {
          return AppDrawer(appService.allApps, launchApp);
        } else {
          return Flex(
            direction: Axis.vertical,
            children: const [
              LoadingWidget(),
            ],
          );
        }
      }),
    );
  }
}

class AppDrawer extends StatelessWidget {
  // Creates a vertical list of given apps and handles click events.
  const AppDrawer(
    this.allItems,
    this.itemOnClickAction, {
    Key? key,
  }) : super(key: key);

  final List<Item> allItems;
  final VoidStringFunction itemOnClickAction;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: allItems.length,
      padding: const EdgeInsets.symmetric(vertical: 6),
      itemBuilder: (context, position) {
        var app = allItems[position];
        return ListTile(
          leading: app.icon?.isNotEmpty ?? false
              ? Image(
                  image: MemoryImage(app.icon!),
                )
              : const CircleAvatar(),
          title: Text(
            app.name,
            style: TextStyles.listTitle,
          ),
          onTap: () => itemOnClickAction(app.id),
        );
      },
      separatorBuilder: (_, __) {
        return const Divider(
          thickness: Values.dividerThickness,
        );
      },
    );
  }
}
