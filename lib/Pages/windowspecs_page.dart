import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WindowSpecsPage extends StatelessWidget{
  const WindowSpecsPage({super.key});


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('WexEnergy'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text('Window Width: '),
                SizedBox(
                  width: 250,
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
              children: <Widget>[
                Text('Window Height: '),
                SizedBox(
                  width: 250,
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