import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/font.dart';
import 'library/library.dart';

void main() {
  testWidgets('theme rendering', (tester) async {
    await loadFonts();

    final key = UniqueKey();

    tester.binding.window.physicalSizeTestValue = const Size(1920, 4200);

    await tester.pumpWidget(AppThemeLibrary(
      key: key,
    ));

    await expectLater(
      find.byKey(key),
      matchesGoldenFile('theme_preview.png'),
    );
  });
}
