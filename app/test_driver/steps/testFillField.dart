import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

// I fill the {string} field with {string}
class FillField extends When2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    // TODO: implement executeStep
    final fieldFinder = find.byValueKey(input1);

    await FlutterDriverUtils.tap(world.driver, fieldFinder);
    await FlutterDriverUtils.enterText(world.driver, fieldFinder, input2);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp("I fill the {string} field with {string}");

}