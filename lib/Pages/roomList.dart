import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'floorList.dart';
import 'models.dart';


List<Room> rooms = [];

class MyRoomListPage extends StatefulWidget {

  @override
  _MyRoomListPageState createState() => _MyRoomListPageState();
}

class _MyRoomListPageState extends State<MyRoomListPage> {
  TextEditingController _unitController = TextEditingController();

  //add new unit function
  void _addNewRoom() { //change to addnewRoom
    String roomName = _unitController.text;
    if (roomName.isNotEmpty) {
      setState(() {
        rooms.add(
          Room(
              roomTypeName: roomName,
          ), // you can modify room count and name
        );
        _unitController.clear(); // empty the input field
      });
    }
  }

  //create unit grids function
  Widget _buildUnitsGrid() {
    if (rooms.isEmpty) {
      // base case
      return Container();
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of units per row in the grid
        childAspectRatio: 0.6,
        //mainAxisSpacing: 30,    // vertical spacing
        crossAxisSpacing: 20, // horizontal spacing
      ),
      itemBuilder: (context, unitIndex) {
        final unit = rooms[unitIndex];
        return Column(
          children: [
            Text(
              'Room Type: ${unit.roomTypeName}', // display Room Type
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, gridIndex) {
                  final unit = rooms[unitIndex];
                  return GestureDetector(
                    onTap: () {
                      context.go('/WindowListPage');
                    },
                  );
                },
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: 10),
          ],
        );
      },
      itemCount: rooms.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // appBar height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.black),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/WEX_energy_logo.png',
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ),
          actions: [
            Icon(Icons.help_outline, color: Colors.black),
            SizedBox(width: 30),
          ],
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // backarrow
                  InkWell(
                    onTap: () {
                      context.go('/FloorListPage');
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 1.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back, color: Colors.blue),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 70, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '     Floor#: ,  Unit#     ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text: 'Status: ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text: 'In-Progress',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // forward arrow button
                  InkWell(
                    onTap: () {
                      context.go('/WindowListPage');
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 1.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(50.0),
          ),
        ),
      ),
      body: Padding(
        padding:
        calculatePaddingBasedOnUnits(), //calculate padding based on units
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: calculatePaddingBasedOnUnits(),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '"Brooklyn Heights" Unit#: ',
                        style: TextStyle(color: Colors.cyan[100], fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      child: _buildUnitsGrid(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _unitController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Enter Room Type(LivingRoom1, LivingRoom2 etc.)',
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addNewRoom,
                child: Text('Add New Room'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

EdgeInsetsGeometry calculatePaddingBasedOnUnits() {
  int numberOfUnits = rooms.length;

  double paddingValue = 10.0 + numberOfUnits;
  return EdgeInsets.all(paddingValue);
}

