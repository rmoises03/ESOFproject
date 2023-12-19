import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/testFillField.dart';
import 'steps/testGeneral.dart';
import 'steps/testScroll.dart';

Future<void> main() {

  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      GivenIAmOnScreen(),
      ScrollFor2Seconds(),
      TapSomething(),
      CheckSomething(),
      FillField(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";

    // Run only 1 feature (comment this line to run all)
    // config.features = [r"test_driver/features/checkRegisterScreen.feature"];

    return GherkinRunner().execute(config);
}