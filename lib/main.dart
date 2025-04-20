import 'package:flutter/material.dart';
import 'package:getx/controllers/controllers.dart';
import 'package:getx/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderStudentManagment());
}

class ProviderStudentManagment extends StatelessWidget {
  const ProviderStudentManagment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => StudentProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Provider Student App",
          home: HomeScreen(),
        ));
  }
}
