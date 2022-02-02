import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/src/utils/named.dart';
import 'package:flutter/material.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({
    Key? key,
    required this.title,
    required this.sections,
  }) : super(key: key);
  final String title;
  final List<ThemeSection> sections;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Padding(
        padding: theme.spacing.asInsets().big,
        child: SpacedColumn(
          spaceBetween: theme.spacing.semiBig,
          children: [
            AppText.title1(title),
            ...sections,
          ],
        ),
      ),
    );
  }
}

class ThemeSection extends StatelessWidget {
  const ThemeSection({
    Key? key,
    required this.title,
    required this.categories,
  }) : super(key: key);

  final String title;
  final List<ThemeCategory> categories;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SpacedColumn(
      spaceBetween: 20.0,
      children: [
        AppText.title2(
          title,
          color: theme.colors.accent,
        ),
        ...categories,
      ],
    );
  }
}

class ThemeCategory extends StatelessWidget {
  const ThemeCategory({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText.title3(title),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: children,
        ),
      ],
    );
  }
}

class SpacedColumn extends StatelessWidget {
  const SpacedColumn({
    Key? key,
    required this.spaceBetween,
    required this.children,
  }) : super(key: key);

  final double spaceBetween;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (children.isNotEmpty) children.first,
        ...children
            .skip(1)
            .map((e) => <Widget>[
                  SizedBox(height: spaceBetween),
                  e,
                ])
            .expand((e) => e),
      ],
    );
  }
}

class NamedCell<T> extends StatelessWidget {
  const NamedCell({
    Key? key,
    required this.value,
    required this.builder,
  }) : super(key: key);

  final Named<T> value;
  final ValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: theme.spacing.asInsets().semiSmall,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colors.foreground.withAlpha(125),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: builder(context, value.value, null),
        ),
        AppText.paragraph2(
          value.name,
          color: theme.colors.foreground.withAlpha(125),
          fontSize: 8,
        ),
      ],
    );
  }
}
