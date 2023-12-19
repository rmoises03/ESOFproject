import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

// Works for 'I am on {string}'
// Should be used only in Given as this waits 8 seconds to load jobs
class GivenIAmOnScreen extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement executeStep

    // Wait for 8 seconds (jobs might take a while to load)
    await Future.delayed(const Duration(seconds: 8));

    final offersScreenFinder = find.byValueKey(input1);

    // Check if offersScreen is present
    bool input1Exists = await FlutterDriverUtils.isPresent(world.driver, offersScreenFinder);

    expect(input1Exists, true);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I am on {string}");
}

// Works for 'I should have {string}'
class CheckSomething extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement executeStep

    final buttonInput1 = find.byValueKey(input1);

    bool input1Exists = await FlutterDriverUtils.isPresent(world.driver, buttonInput1);

    expect(input1Exists, true);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I should have {string}");
}

// Works for 'I tap {string}'
class TapSomething extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement executeStep
    final finder = find.byValueKey(input1);

    await FlutterDriverUtils.tap(world.driver, finder);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I tap {string}");
}