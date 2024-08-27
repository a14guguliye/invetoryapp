import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        // Define the default font family
        fontFamily: 'Roboto',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF5F5F5), // Dark background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none, // No border by default
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(color: Colors.transparent), // Border when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(color: Colors.blueAccent), // Border when focused
          ),
          hintStyle: TextStyle(
            color: Colors.grey, // Color for hint text
            fontSize: 16.0,
          ),
          labelStyle: TextStyle(
            color: Colors.white, // Color for label text
            fontSize: 16.0,
          ),
          prefixIconColor: Colors.grey, // Color for prefix icon
          suffixIconColor: Colors.grey, // Color for suffix icon
        ),

        textTheme: TextTheme(
          headlineMedium: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: TextStyle(
              fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
        ),
        // Define the color of AppBar
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),

          elevation: 0, // Remove the shadow under the AppBar
        ),
        // Define the color of buttons
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue, // Background color
          textTheme: ButtonTextTheme.primary, // Text color
        ),
      ),
      home: SigninScreen(),
    );
  }
}

class SigninScreen extends StatelessWidget {
  const SigninScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Custom Painted Background
          WavyBackgoundImage(),
          // Centered Text
          SigninFom(),
        ],
      ),
    );
  }
}

class SigninFom extends StatelessWidget {
  const SigninFom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 10),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: LayoutBuilder(builder: (context, cons) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: cons.maxWidth,
            height: cons.maxHeight,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Giris Sehifesi",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("Giris")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class WavyBackgoundImage extends StatefulWidget {
  const WavyBackgoundImage({
    super.key,
  });

  @override
  State<WavyBackgoundImage> createState() => _WavyBackgoundImageState();
}

class _WavyBackgoundImageState extends State<WavyBackgoundImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )..forward();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: WavyBackgroundPainter(_controller.value * 0.7),
          );
        });
  }
}

class WavyBackgroundPainter extends CustomPainter {
  double scaleValue;

  WavyBackgroundPainter(this.scaleValue);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFF6F8CFC), // Lighter dark blue
          Color(0xFF5A7DFF), // Slightly lighter blue
          Color(0xFF4D6EFF), // Darker blue
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw a grid pattern
    double gridSize = 50.0; // Size of each grid cell
    double adjustedHeight = size.height * scaleValue;

    Paint gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Draw the wavy top border
    Path wavePath = Path();
    wavePath.moveTo(0, -adjustedHeight * 0.2); // Start above the screen
    wavePath.lineTo(0, adjustedHeight * 0.2);
    wavePath.quadraticBezierTo(size.width * 0.1, adjustedHeight * 0.1,
        size.width * 0.2, adjustedHeight * 0.2);
    wavePath.quadraticBezierTo(size.width * 0.3, adjustedHeight * 0.3,
        size.width * 0.4, adjustedHeight * 0.2);
    wavePath.quadraticBezierTo(size.width * 0.5, adjustedHeight * 0.1,
        size.width * 0.6, adjustedHeight * 0.05);
    wavePath.lineTo(
        size.width * 0.7, -adjustedHeight * 0.2); // End above the screen
    wavePath.close();

    paint.shader = LinearGradient(
      colors: [
        Color(0xFF6F8CFC).withOpacity(0.5),
        Color(0xFF5A7DFF).withOpacity(0.5),
        Color(0xFF4D6EFF).withOpacity(0.5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(wavePath, paint);

    // Draw the wavy bottom border
    Path wavePath2 = Path();
    wavePath2.moveTo(size.width,
        size.height + adjustedHeight * 0.2); // Start below the screen
    wavePath2.lineTo(size.width, size.height - adjustedHeight * 0.2);
    wavePath2.quadraticBezierTo(
        size.width * 0.9,
        size.height - adjustedHeight * 0.1,
        size.width * 0.8,
        size.height - adjustedHeight * 0.2);
    wavePath2.quadraticBezierTo(
        size.width * 0.7,
        size.height - adjustedHeight * 0.3,
        size.width * 0.6,
        size.height - adjustedHeight * 0.2);
    wavePath2.quadraticBezierTo(
        size.width * 0.5,
        size.height - adjustedHeight * 0.1,
        size.width * 0.4,
        size.height - adjustedHeight * 0.05);
    wavePath2.lineTo(size.width * 0.3,
        size.height + adjustedHeight * 0.2); // End below the screen
    wavePath2.close();

    canvas.drawPath(wavePath2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
