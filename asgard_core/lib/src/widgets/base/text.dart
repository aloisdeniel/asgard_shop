import 'package:asgard_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

enum AppTextLevel {
  paragraph1,
  paragraph2,
  title1,
  title2,
  title3,
}

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.level = AppTextLevel.paragraph1,
  }) : super(key: key);

  const AppText.paragraph1(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.paragraph1,
        super(key: key);

  const AppText.paragraph2(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.paragraph2,
        super(key: key);

  const AppText.title1(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title1,
        super(key: key);

  const AppText.title2(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title2,
        super(key: key);

  const AppText.title3(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title3,
        super(key: key);

  final String data;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    final style = () {
      switch (level) {
        case AppTextLevel.paragraph1:
          return theme.typography.paragraph1;
        case AppTextLevel.paragraph2:
          return theme.typography.paragraph2;
        case AppTextLevel.title1:
          return theme.typography.title1;
        case AppTextLevel.title2:
          return theme.typography.title2;
        case AppTextLevel.title3:
          return theme.typography.title3;
      }
    }();
    return Text(
      data,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
    );
  }
}
