import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ScrollFor2Seconds extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement executeStep
    final jobListFinder = find.byValueKey(input1);

    await world.driver?.scroll(
      jobListFinder,
      0.0,
      -1000.0,
      const Duration(milliseconds: 300),
      timeout: const Duration(seconds: 2),
    );
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I scroll {string} for 2 seconds");
}