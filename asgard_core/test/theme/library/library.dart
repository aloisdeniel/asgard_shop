import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/src/utils/named.dart';
import 'package:flutter/material.dart';

import 'base.dart';

part 'colors.dart';
part 'icons.dart';
part 'spacing.dart';
part 'shadows.dart';
part 'radius.dart';
part 'typography.dart';

class AppThemeLibrary extends StatelessWidget {
  const AppThemeLibrary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppTheme(
        data: AppThemeData.regular(),
        child: Builder(
          builder: (context) {
            return ThemeContainer(
              title: 'Asgard Theme',
              sections: [
                colors(context),
                typography(context),
                icons(context),
                radius(context),
                spacing(context),
                shadow(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
