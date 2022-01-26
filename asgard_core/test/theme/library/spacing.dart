part of 'library.dart';

ThemeSection spacing(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Spacing',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.spacing.props.map<Widget>(
            (c) {
              final named = c as Named<double>;
              return NamedCell(
                value: named,
                builder: (context, double v, _) => Container(
                  height: 24,
                  width: v,
                  color: theme.colors.accent,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
