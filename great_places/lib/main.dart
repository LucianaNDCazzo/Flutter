import 'package:flutter/material.dart';
import 'package:great_places/pages/place_form_page.dart';
import 'package:great_places/pages/places_list_page.dart';
import 'package:great_places/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        highlightColor: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PlacesListPage(),
      routes: {
        AppRoutes.placeForm: (context) => const PlaceFormPage(),
      },
    );
  }
}
