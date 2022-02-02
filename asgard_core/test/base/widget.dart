import 'package:asgard_core/asgard_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_utils/test_utils.dart';

typedef TestConfigurationBuilder = Widget Function(
  Widget child,
);

void testAppWidgets(
  String name,
  Map<String, Widget> widgets, {
  Size baseSize = const Size(1024.0, 800.0),
}) {
  final configurations = <TestConfigurationBuilder>[
    (child) => Expanded(
          child: Center(
            child: child,
          ),
        ),
    (child) => Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: child,
          ),
        ),
  ];

  appTestWidgets(
    name,
    widgets.map(
      (key, value) => MapEntry(
        key,
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppTheme(
            data: AppThemeData.regular(
              appLogo: StringPicture(
                SvgPicture.svgStringDecoderBuilder,
                '<svg></svg>',
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [...configurations.map((builder) => builder(value))],
            ),
          ),
        ),
      ),
    ),
    size: Size(
      800,
      1024.0 * configurations.length,
    ),
  );
}
