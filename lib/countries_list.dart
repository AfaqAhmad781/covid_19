import 'package:covid19_tracker/services/Utilities/states_services.dart';
import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
                   hintText: 'search with country name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}