part of 'library.dart';

ThemeSection shadow(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Shadows',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.shadow.props.map<Widget>(
            (c) {
              final named = c as Named<BoxShadow>;
              return NamedCell(
                value: named,
                builder: (context, BoxShadow v, _) => Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.all(64),
                  decoration: BoxDecoration(
                    color: theme.colors.foreground,
                    boxShadow: [v],
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
