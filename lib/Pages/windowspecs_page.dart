import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WindowSpecsPage extends StatelessWidget{

  static const double widgetWidthSize = 250;


  const WindowSpecsPage({super.key});


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('WexEnergy'),
        centerTitle: true,
      ),
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Window Width: '),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Window Width'
                      )
                    ),
                  ),
                  Text(' in')
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Window Height: '),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Window Height'
                      ),
                    ),
                  ),
                  Text(' in')
                ]
              )
            ]
          )
        )
    );
    }

  }