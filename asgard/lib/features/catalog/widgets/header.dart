import 'package:asgard_core/asgard_core.dart';
import 'package:flutter_svg/svg.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedBuilder(
      animation: controller,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(
            theme.spacing.semiBig,
          ),
          child: SizedBox(
            height: theme.typography.title1.fontSize! * 1.5,
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ),
      builder: (context, child) {
        final scrollAmount = (1 -
                (controller.offset.abs() /
                    theme.typography.title1.fontSize! *
                    0.5))
            .clamp(0, 1);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: theme.images.backgroundPattern,
              fit: BoxFit.cover,
              opacity: 0.025 + 0.175 * scrollAmount,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
