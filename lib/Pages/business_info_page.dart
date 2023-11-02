import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BusinessInfoPage extends StatelessWidget {
  const BusinessInfoPage({super.key});

@override
Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 400,
                width: 450,
                decoration: BoxDecoration(),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('assets/Building.jpg', opacity: const AlwaysStoppedAnimation(.3),),
                ),
              ),
            ),
          ],

            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 3, 99, 143)), borderRadius: BorderRadius.circular(10)),
                child: 
                  Row(
                  children: [
                    const Align(alignment: Alignment.topLeft,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Floors: 6', textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Windows: 120', textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Rooms: 30', textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    const Spacer(),
                    Align(alignment: Alignment.topRight,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Step 1: Floor & Unit #', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 198, 113)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18), 
                                  side: const BorderSide(color: Colors.orange)
                                )
                              )
                            ),
                            onPressed: () {
                              context.go('/RoomListPage');
                            },
                            child: const Text('Start Measuring') 
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Image.asset('assets/WexWindow.png'),
                ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Project & Building Information', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                      Row(
                        children: [
                          Image.asset('assets/House.png'),
                          const Text("  <Building Name>", textAlign: TextAlign.left,)
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/Location.png', alignment: Alignment.centerLeft,),
                          const Text("  <Building Address>")
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/TravelDistance.png'),
                          const Text("  <Location Travel Time>")
                        ],
                      ),
                    ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                      child: const Text('<Paragraph of company/building information goes here>', textAlign: TextAlign.left)
                    )
                  ]
                )
              ]
            ),
          ],
      ),
    );
  }
}