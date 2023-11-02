import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class WindowList extends StatelessWidget {
  WindowList({super.key});

  final primaryBlue = HexColor("#418fde");
  final primaryOrange = HexColor("#ff8200");

  final secondaryLightGrey = HexColor("#D0D3D4");
  final secondaryDarkGrey = HexColor("#647692");
  final secondaryBlack = HexColor("#2D2926");

  final white = HexColor("#f8fafd");
  final borderBlue = HexColor("#90b5da");
  final borderBlueDark = HexColor("#528ac4");
  final lightOrange = HexColor("#8e4cb");

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
              color: primaryBlue, 
            ),
          title: Text(
            'WexEnergy',
            style: TextStyle(
              color: primaryBlue,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                // Handle the question mark button press.
              },
              color: primaryOrange,
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30.0),
                  onTap: () {
                    // Handle the back arrow press.
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                      border: Border.all(color: borderBlue),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Icon(
                      Icons.arrow_back,
                      color: primaryBlue,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: white,
                        border: Border.all(color: borderBlue),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Text('Part 5/7: Window List\n Status: In-Progress'),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    // Handle the forward arrow press.
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                      border: Border.all(
                        color: borderBlue,
                        width: 3,
                      ),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Icon(
                      Icons.arrow_forward,
                      color: primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
              Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.015,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: borderBlue),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.54,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryOrange),
                      backgroundColor: white,
                    ),
                  ),
                ),
                const Text(" 54%"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: primaryBlue),
                      color: primaryBlue,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                          '"Brooklyn Hei..." Bedroom: 2/ Windows: 2',
                          style: TextStyle(
                            color: borderBlue,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Window 1',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.15,
                                  padding: const EdgeInsets.all(2),
                                  color: white,
                                ),
                              ],
                            ),
                            SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  'Window 2',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.15,
                                  padding: const EdgeInsets.all(2),
                                  color: white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
