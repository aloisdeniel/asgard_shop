import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/utils/named.dart';
import 'package:flutter/material.dart';

import 'base.dart';

part 'colors.dart';
part 'icons.dart';
part 'spacing.dart';
part 'typography.dart';

class AppThemeLibrary extends StatelessWidget {
  const AppThemeLibrary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppTheme(
        data: AppThemeData.regular(),
        child: Builder(
          builder: (context) {
            return ThemeContainer(
              key: key,
              title: 'Theme',
              sections: [
                colors(context),
                typography(context),
                icons(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
