import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/utils/named.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/font.dart';
import 'library.dart';

void main() {
  testWidgets('theme rendering', (tester) async {
    await loadFonts();

    final key = UniqueKey();

    tester.binding.window.physicalSizeTestValue = const Size(1920, 3200);

    await tester.pumpWidget(const AppThemeLibrary());

    await expectLater(
      find.byKey(key),
      matchesGoldenFile('theme_preview.png'),
    );
  });
}
