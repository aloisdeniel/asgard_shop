import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// This loads fonts for the test runner.
Future<void> loadFonts() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await _loadFamily(
    'asgard_core',
    'asgard_icons',
    [
      'assets/fonts/asgard_icons.ttf',
    ],
  );
  await _loadFamily(
    'asgard_core',
    'Poppins',
    [
      'assets/fonts/Poppins-Regular.ttf',
      'assets/fonts/Poppins-Bold.ttf',
    ],
  );
}

Future<void> _loadFamily(
  String package,
  String name,
  List<String> assets,
) async {
  final prefix = 'packages/$package/';
  final fontLoader = FontLoader('$prefix$name');

  for (final asset in assets) {
    final bytes = rootBundle.load('$prefix$asset');
    fontLoader.addFont(bytes);
  }
  await fontLoader.load();
}
