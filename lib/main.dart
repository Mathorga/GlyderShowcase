import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glyder_showcase/widgets/mouse_button_widget.dart';

void main() {
  runApp(const GlyderShowcase());
}

class GlyderShowcase extends StatelessWidget {
  const GlyderShowcase({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Glyder Showcase",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        appBarTheme: AppBarTheme(
          color: Colors.grey[800]!.withAlpha(192),
          elevation: 0.0,
        ),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color unFocusedTextColor = Colors.grey[400]!;
  final Color focusedTextColor = Colors.white;

  Widget buildAppbarSeparator() {
    return const SizedBox(width: 48.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/logo/glyder_logo.png"),
            ),
            buildAppbarSeparator(),
            const MouseButtonWidget.icon(
              icon: Icons.home_rounded,
            ),
            buildAppbarSeparator(),
            const MouseButtonWidget.text(
              text: "Home",
            ),
            buildAppbarSeparator(),
            const MouseButtonWidget.text(
              text: "Products",
            ),
            buildAppbarSeparator(),
            const MouseButtonWidget.text(
              text: "Contact us",
            ),
            buildAppbarSeparator(),
            const MouseButtonWidget.text(
              text: "Who are we?",
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Text("Welcome true believers and newcomers alike"),
        ),
      ),
    );
  }
}
