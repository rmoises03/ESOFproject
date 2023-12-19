import 'package:flutter/material.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:myapp/models/languages_remote_selection_model.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/pages/map-screen.dart';
import 'package:myapp/views/widgets/filterPriceWidget.dart';
import 'package:myapp/views/widgets/filterRemoteWidget.dart';
import 'package:myapp/views/widgets/filterTechnologiesWidget.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:myapp/views/widgets/rectangularButtonWidget.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    LanguageSelectionModel lsm = Provider.of<LanguageSelectionModel>(context);

    return Scaffold(
      key: const Key("filterScreen"),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          key: const Key("goBackToMapScreenButton"),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapScreen()),
            );
          },
        ),
        title: Text(
          'Filtros',
          textAlign: TextAlign.center,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: screenWidth * 0.06,
            // Use percentage of screen width for font size
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: const Color(0xffffffff),
          ),
        ),
        backgroundColor: const Color.fromRGBO(65, 54, 92, 1),
      ),
      body: Stack(children: [
        GradientBackground(screenHeight: screenHeight),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              RectangularButton(
                key: const Key('useProfileAsFilterButton'),
                  text: '      Usar o meu perfil como filtro      ',
                  onPressed: () {
                    lsm.useAsFilter(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterScreen()),
                    ); // reloads the page so checked boxes appear accordingly to user profile
                  },
                  horizontalMargin: 0,
                  backGroundColor: const Color.fromRGBO(102, 152, 173, 1)),
              FilterPriceWidget(),
              const FilterRemoteWidget(),
              const FilterTechnologiesWidget(),
            ],
          ),
        ),
      ]),
      backgroundColor: Colors.black,
    );
  }
}
