import 'dart:math' as math;

import 'package:asgard_core/asgard_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_utils/test_utils.dart';

import 'devices.dart';

void testAppView(
  String name,
  Widget child, {
  bool showSafeAreas = true,
  Map<String, Map<String, MediaQueryData>> devices = testDevices,
}) {
  for (var deviceCategory in devices.entries) {
    final maxHeight = deviceCategory.value.entries
        .fold<double>(0, (max, v) => math.max(max, v.value.size.height));
    final totalWidth = deviceCategory.value.entries
        .fold<double>(0, (total, v) => total + v.value.size.width);

    appTestWidgets(
      deviceCategory.key,
      {
        for (var colorMode in AppThemeColorMode.values)
          colorMode.name: Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...deviceCategory.value.entries.map(
                (device) => MediaQuery(
                  data: device.value,
                  child: AppResponsiveTheme(
                    colorMode: colorMode,
                    appLogo: StringPicture(
                      SvgPicture.svgStringDecoderBuilder,
                      '<svg width="100" height="50"></svg>',
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        width: device.value.size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: AppText.title3(
                                    device.key,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: device.value.size.height,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  children: [
                                    MaterialApp(
                                      debugShowCheckedModeBanner: false,
                                      useInheritedMediaQuery: true,
                                      home: child,
                                    ),
                                    if (showSafeAreas) ...[
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        height: device.value.padding.top,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.withAlpha(40),
                                            border: Border.all(
                                              color: Colors.red.withAlpha(100),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        height: device.value.padding.bottom,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.withAlpha(40),
                                            border: Border.all(
                                              color: Colors.red.withAlpha(100),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        bottom: 0,
                                        width: device.value.padding.left,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.withAlpha(40),
                                            border: Border.all(
                                              color: Colors.red.withAlpha(100),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        width: device.value.padding.right,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.withAlpha(40),
                                            border: Border.all(
                                              color: Colors.red.withAlpha(100),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              bottomLeft: Radius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
      },
      size: Size(totalWidth, maxHeight + 40),
    );
  }
}
