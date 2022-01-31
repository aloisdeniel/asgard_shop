part of 'library.dart';

ThemeSection icons(BuildContext context) {
  final icons = AppTheme.of(context).icons;
  return ThemeSection(
    title: 'Icons',
    categories: [
      ThemeCategory(
        title: 'Small',
        children: [
          ...icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: (c as Named<String>),
              builder: (context, String v, _) => AppIcon(
                v,
                color: Colors.black,
                size: AppIconSize.small,
              ),
            ),
          ),
        ],
      ),
      ThemeCategory(
        title: 'Large',
        children: [
          ...icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: (c as Named<String>),
              builder: (context, String v, _) => AppIcon(
                v,
                color: Colors.black,
                size: AppIconSize.regular,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
