part of 'library.dart';

ThemeSection typography(BuildContext context) {
  final theme = AppTheme.of(context);
  return ThemeSection(
    title: 'Typography',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.typography.props.map<Widget>(
            (c) {
              final named = c as Named<TextStyle>;
              return NamedCell(
                value: named,
                builder: (context, TextStyle v, _) => Text(
                  'Hello!',
                  style: named.value,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
