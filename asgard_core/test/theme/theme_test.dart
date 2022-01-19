import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/utils/named.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/font.dart';
import 'base.dart';

void main() {
  testWidgets('theme rendering', (tester) async {
    await loadFonts();

    final key = UniqueKey();

    tester.binding.window.physicalSizeTestValue = const Size(1920, 3200);

    await tester.pumpWidget(
      MaterialApp(
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
      ),
    );
    await expectLater(
      find.byKey(key),
      matchesGoldenFile('theme_preview.png'),
    );
  });
}

ThemeSection icons(BuildContext context) {
  final icons = AppTheme.of(context).icons;
  return ThemeSection(
    title: 'Icons',
    categories: [
      ThemeCategory(
        title: 'Small',
        children: [
          ...icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: (c as Named<String>),
              builder: (context, String v, _) => AppIcon(
                v,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      ThemeCategory(
        title: 'Large',
        children: [
          ...icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: (c as Named<String>),
              builder: (context, String v, _) => AppIcon(
                v,
                color: Colors.black,
                size: 64,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

ThemeSection colors(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Colors',
    categories: [
      ThemeCategory(
        title: 'Light',
        children: [
          ...theme.colors.props.map<Widget>(
            (c) {
              final named = c as Named<Color>;
              return NamedCell(
                value: named,
                builder: (context, Color v, _) => Container(
                  height: 32,
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  color: v,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

ThemeSection typography(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Typography',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.typography.props.map<Widget>(
            (c) {
              final named = c as Named<TextStyle>;
              return NamedCell(
                value: named,
                builder: (context, TextStyle v, _) => Text(
                  'Hello!',
                  style: named.value,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
