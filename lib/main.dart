import 'package:flutter/material.dart';
import 'package:inventoryapp/home_page.dart';
import 'package:inventoryapp/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        '/signin': (context) => const SigninScreen(),
        "/home": (context) => HomePage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        // Define the default font family
        fontFamily: 'Roboto',

        listTileTheme: ListTileThemeData(
          iconColor:
              Colors.grey, // Grey icons to match prefix/suffix icon color
          textColor: Colors.black, // Black text to match the text theme
          tileColor:
              const Color(0xFFF5F5F5), // Light background color like input fill
          selectedTileColor:
              Colors.blueAccent.withOpacity(0.2), // Light blue when selected
          selectedColor:
              Colors.blueAccent, // Blue color for selected text and icons
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12.0), // Rounded corners to match input fields
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 8.0), // Default padding
          horizontalTitleGap: 12.0, // Space between leading icon and title
          dense: false, // Standard ListTile size (not dense)
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF5F5F5), // Dark background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none, // No border by default
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
                color: Colors.transparent), // Border when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
                color: Colors.blueAccent), // Border when focused
          ),
          hintStyle: const TextStyle(
            color: Colors.grey, // Color for hint text
            fontSize: 16.0,
          ),
          labelStyle: const TextStyle(
            color: Colors.white, // Color for label text
            fontSize: 16.0,
          ),
          prefixIconColor: Colors.grey, // Color for prefix icon
          suffixIconColor: Colors.grey, // Color for suffix icon
        ),

        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: TextStyle(
              fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
        ),
        // Define the color of AppBar
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),

          elevation: 0, // Remove the shadow under the AppBar
        ),
        // Define the color of buttons
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue, // Background color
          textTheme: ButtonTextTheme.primary, // Text color
        ),
      ),
    );
  }
}
