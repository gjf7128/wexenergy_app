import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WindowSpecsPage extends StatelessWidget{

  static const double widgetWidthSize = 250;

  double windowHeight = 50;
  double windowWidth = 50;

  WindowSpecsPage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('WexEnergy'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: CustomPaint(
                    size: Size(windowWidth, windowHeight),
                    painter: ShapePainter()
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Window Width: '),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        onChanged: (value) {
                          windowHeight = value as double;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Window Width'
                        )
                      ),
                    ),
                    const Text(' in')
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Window Height: '),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        onChanged: (value) {
                          windowHeight = value as double;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Window Height'
                        ),
                      ),
                    ),
                    const Text(' in')
                  ]
                ),
                const Center(
                  child: ProfileRadio()
                )
              ]
            )
        )
      )
      )
    );
    }

  }


enum ProfileState {high, low}

class ProfileRadio extends StatefulWidget{
  const ProfileRadio({super.key});

  @override
  State<ProfileRadio> createState() => _ProfileRadioState();
}

class _ProfileRadioState extends State<ProfileRadio>{
  ProfileState? profile = ProfileState.high;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: const Text('High Profile'),
          leading: Radio<ProfileState>(
            value: ProfileState.high,
            groupValue: profile,
            onChanged: (ProfileState? value) {
              setState(() {
                profile = value;
              });
            },
          )
        ),
        ListTile(
            title: const Text('Low Profile'),
            leading: Radio<ProfileState>(
              value: ProfileState.low,
              groupValue: profile,
              onChanged: (ProfileState? value) {
                setState(() {
                  profile = value;
                });
              },
            )
        ),
      ]
    );
  }
}


class ShapePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.teal;
    paint.strokeWidth = 10;


    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
