import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'roomList.dart';
import 'window_type.dart';
import 'models.dart';
import 'global_state.dart';



List<Unit> units = [];

class MyFloorListPage extends StatefulWidget {

  @override
  _MyFloorListPageState createState() => _MyFloorListPageState();
}

class _MyFloorListPageState extends State<MyFloorListPage> {
  TextEditingController _unitController = TextEditingController();

  void _showAddUnitDialog() async {
    // Use TextEditingController to retrieve the text content
    TextEditingController _dialogTextController = TextEditingController();

    // show dialog
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Unit'),
          content: TextField(
            controller: _dialogTextController,
            decoration: const InputDecoration(
              hintText: 'Enter Unit #',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // whenever user hits confirm，call _addNewUnit to close the dialog
                _addNewUnit(_dialogTextController.text);
                Navigator.pop(context, 'OK');
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  //add new unit function
  void _addNewUnit(String unitName) {
    //String unitName = _unitController.text;
    if (unitName.isNotEmpty) {
      setState(() {
        units.add(
          Unit(
              unitName: unitName,
              roomCount: 0,
              rooms: []), // you can modify room count and name
        );
        _unitController.clear(); // empty the input field
      });
    }
  }

  void _navigateToRoomList(Unit unit) {
    context.go('/RoomListPage', extra: unit);
  }

  //create unit grids function
  Widget _buildUnitsGrid() {
    if (units.isEmpty) {
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
        final unit = units[unitIndex];
        return Column(
          children: [
            Text(
              'Unit #${unit.unitName}', // display Unit #
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
                  final unit = units[unitIndex];
                  return GestureDetector(
                    onTap: () {
                      context.go('/RoomListPage');
                    }
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
      itemCount: units.length,
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
                      context.go('/BusinessInfoPage');
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
                          EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 5),
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
                                  text: ' Current Floor Page ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
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
                      context.go('/RoomListPage');
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
                        '"Brooklyn Heights" Floor#: ',
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
              ElevatedButton(
                onPressed: _showAddUnitDialog,
                child: Text('Add New Unit'),
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
  int numberOfUnits = units.length;

  double paddingValue = 10.0 + numberOfUnits;
  return EdgeInsets.all(paddingValue);
}
