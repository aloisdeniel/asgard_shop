import 'package:asgard_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

import 'action_button.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppActionButton(
      icon: theme.icons.characters.arrowBack,
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
