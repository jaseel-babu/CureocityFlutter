import 'package:cureocity_flutter_test/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Countries",
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            tileColor: AppColors.greylight,
            title: Text(
              "India",
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            leading: const Icon(Icons.flag),
            subtitle: Text(
              "+91",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
        ),
      ),
    );
  }
}
