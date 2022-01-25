part of 'library.dart';

ThemeSection colors(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Colors',
    categories: [
      ThemeCategory(
        title: 'Light',
        children: [
          ...theme.colors.props.map<Widget>(
            (c) {
              final named = c as Named<Color>;
              return NamedCell(
                value: named,
                builder: (context, Color v, _) => Container(
                  height: 32,
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  color: v,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
