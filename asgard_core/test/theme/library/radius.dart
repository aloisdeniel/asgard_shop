part of 'library.dart';

ThemeSection radius(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Border radius',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.radius.props.map<Widget>(
            (c) {
              final named = c as Named<Radius>;
              return NamedCell(
                value: named,
                builder: (context, Radius v, _) => Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: v),
                    color: theme.colors.accent,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
