import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/pages/map-screen.dart';
import 'package:myapp/views/pages/discrict-screen.dart';
import 'package:myapp/views/pages/sign-in-screen.dart';
import 'package:myapp/views/pages/test-screen.dart';
import 'package:myapp/models/job.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:myapp/models/salary_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:myapp/models/languages_remote_selection_model.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.signOut();
  // Fetch jobs and create JobsProvider instance
  final jobsProvider = JobsProvider();
  jobsProvider.fetchJobs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<JobsProvider>.value(
          value: jobsProvider,
        ),
        ChangeNotifierProvider<Filter>(
          create: (context) => Filter(),
        ),
        ChangeNotifierProvider(create: (_) => LanguageSelectionModel()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}
