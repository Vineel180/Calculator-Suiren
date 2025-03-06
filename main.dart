// RULE : THIS IS THE FINAL VERSION //

// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

///import 'package:calculator/pages/page0.dart';
///terminal///flutter pub add material_design_icons_flutter
///import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      ///remove const from MaterialApp if changing things like theme, locale or navigation
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Homepage0(),
    );
  }
}

class Homepage0 extends StatefulWidget {
  const Homepage0({super.key});
  @override
  State<Homepage0> createState() => _Homepage0State();
}

class _Homepage0State extends State<Homepage0> {
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  String _output0 = "0";
  late final TextEditingController textEditingController;
  final ShuntingYardParser shuntingYardParser = ShuntingYardParser();
  final ContextModel contextModel = ContextModel();
  //
  void _calculate0() {
    setState(() {
      if (textEditingController.text == "" ||
          textEditingController.text == "0") {
        _output0 = "0";
      } else {
        try {
          Expression expression = shuntingYardParser.parse(
            textEditingController.text,
          );
          double _output0_asDouble = expression.evaluate(
            EvaluationType.REAL,
            contextModel,
          );
          _output0 = _output0_asDouble.toStringAsFixed(3);
        } catch (e) {
          _output0 = "Error";
        }
      }
    });
  }

  void _calculate0_withStringArgument(String s) {
    _calculate0();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 240, 255, 0.97),
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color.fromRGBO(191, 63, 255, 1),
        elevation: 0,

        ///leading: Icon(), ///functional icon on the left
        ///actions: [Icon(), Icon()], ///functional iconS on the right
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            //WIDGET 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                _output0,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Color.fromRGBO(191, 63, 255, 1),
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            //
            //WIDGET 2
            Container(
              ///margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextField(
                controller: textEditingController,
                onSubmitted: _calculate0_withStringArgument,
                //
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9().+\-*/]'), //doesn't work
                  ),
                ],
                //
                style: const TextStyle(
                  color: Color.fromRGBO(191, 63, 255, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  hintText: "Expression",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(191, 63, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.sunny,
                    color: Color.fromRGBO(191, 63, 255, 1),
                    size: 24,
                  ),
                  /*
                  prefix: Icon(
                    MdiIcons.weatherFog,
                    color: Color.fromRGBO(191, 63, 255, 1),
                    size: 24,
                  ),
                  */
                  filled: true,
                  fillColor: Color.fromRGBO(63, 255, 191, 0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(63, 255, 191, 0.8),
                      style: BorderStyle.solid,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
              ),
            ),

            ///const SizedBox(height: 8,), ///to add extra padding, if needed - since this uses less resources
            ///note: u^1 can be used to replace Padding() in "WIDGET 1"
            //
            //WIDGET 3
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextButton(
                onPressed: _calculate0,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromRGBO(255, 63, 191, 0.2),
                  ),
                  /*
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  //The output is the same with or without this, but only for 'value=100'.
                  */
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 48),
                  ),
                ),
                child: const Text(
                  "Operate",
                  style: TextStyle(
                    color: Color.fromRGBO(191, 63, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
