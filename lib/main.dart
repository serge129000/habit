import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracking/app/index.dart';
import 'package:habit_tracking/app/provider/habit_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> HabitProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.poppins(
              fontSize: 18
            )
          )
        ),
        title: "Habit Tracking",
        home: Index(),
      ),
    );
  }
}
