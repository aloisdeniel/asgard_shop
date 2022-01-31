import 'package:asgard_core/asgard_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/font.dart';
import 'image_mock.dart';

void testAppWidgets(
  String name,
  Map<String, Widget> widgets, {
  Size baseSize = const Size(1024.0, 800.0),
}) =>
    testWidgets(
      'Rendering $name',
      (tester) async {
        mockNetworkImagesFor(() async {
          await loadFonts();

          await ensureImagesPreloaded(tester);

          for (var child in widgets.entries) {
            final key = UniqueKey();

            final configurations = [
              Expanded(
                child: Center(
                  child: child.value,
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: child.value,
                ),
              ),
            ];

            tester.binding.window.physicalSizeTestValue = Size(
              baseSize.width,
              baseSize.height * configurations.length,
            );

            await tester.pumpWidget(
              MaterialApp(
                home: AppTheme(
                  key: key,
                  data: AppThemeData.regular(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: configurations,
                  ),
                ),
              ),
            );

            await tester.pumpAndSettle(
              const Duration(milliseconds: 100),
              EnginePhase.paint,
            );

            await expectLater(
              find.byKey(key),
              matchesGoldenFile('renders/$name/${child.key}.png'),
            );
          }
        });
      },
    );
