import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickgui/src/globals.dart';
import 'package:quickgui/src/mixins/app_version.dart';
import 'package:quickgui/src/mixins/preferences_mixin.dart';
import 'package:quickgui/src/model/app_theme.dart';
import 'package:quickgui/src/i18n/i18n_ext.dart';

class LeftMenu extends StatelessWidget with PreferencesMixin {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _version = AppVersion.packageInfo!.version;
    return Consumer<AppTheme>(
      builder: (context, appTheme, _) => Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("quickgui $_version", style: Theme.of(context).textTheme.headline6),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(context.t('Use dark mode')),
                  Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      appTheme.useDarkMode = value;
                      savePreference(prefThemeMode, value);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}