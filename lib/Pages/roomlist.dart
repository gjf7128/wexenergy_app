import 'package:flutter/material.dart';
import 'window_type.dart';

class Room {
  bool isSelected;
  RoomType? type;

  Room({this.isSelected = false, this.type});
}
enum RoomType {
  bedroom,
  livingRoom,
  kitchen,
  office,
  bathroom,
}

class Unit {
  String unitName;
  int roomCount;
  List<Room> rooms;

  Unit({required this.unitName, required this.roomCount, required this.rooms});
}
List<Unit> units = [];

class MyRoomListPage extends StatefulWidget {
  @override
  _MyRoomListPageState createState() => _MyRoomListPageState();
}

class _MyRoomListPageState extends State<MyRoomListPage> {
  TextEditingController _unitController = TextEditingController();

  //add new unit function
  void _addNewUnit() {
    String unitName = _unitController.text;
    if (unitName.isNotEmpty) {
      setState(() {
        units.add(
          Unit(unitName: unitName, roomCount: 0, rooms: []), // 这里您可以根据需要调整roomCount和rooms
        );
        _unitController.clear();  // 清除输入框的内容
      });
    }
  }

  //create unit grids function
  Widget _buildUnitsGrid() {
    if (units.isEmpty) {
      // 如果为空，返回一个空的Container
      return Container();
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 这里你可以根据实际情况进行调整，例如，如果你希望显示3个units，那么这里应为3
        childAspectRatio: 0.6,
        //mainAxisSpacing: 30,    // 增加垂直间距
        crossAxisSpacing: 20,   // 增加水平间距
      ),
      itemBuilder: (context, unitIndex) {
        final unit = units[unitIndex];
        return Column(
          children: [
            Text(
              'Unit #${unit.unitName}', // 显示Unit #
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  if (gridIndex < unit.roomCount) {
                    final room = unit.rooms[gridIndex];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          room.isSelected = !room.isSelected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: room.isSelected ? Colors.red : Colors.yellow,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: EdgeInsets.all(2),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async {
                        RoomType? selectedType = await showDialog<RoomType>(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text('Choose Room Type'),
                              children: <Widget>[
                                ...RoomType.values.map((type) {
                                  return SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.pop(context, type);
                                    },
                                    child: Text(type.toString().split('.').last),
                                  );
                                }).toList()
                              ],
                            );
                          },
                        );
                        if (selectedType != null) {
                          setState(() {
                            unit.roomCount += 1;
                            unit.rooms.add(Room(isSelected: false, type: selectedType));
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: EdgeInsets.all(2),
                      ),
                    );
                  }
                },
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${unit.roomCount} Rooms', // 显示房间数
              style: TextStyle(color: Colors.black),
            ),
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
        preferredSize: Size.fromHeight(120.0), // 调整这里来设置AppBar的高度
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
                  // 后退按钮
                  InkWell(
                    onTap: () {
                      // TODO: 这里添加您的后退逻辑
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
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 3),
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
                                  text: 'Part 1/7 : Floor & Unit # ',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text: 'Status: ',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text: 'In-Progress',
                                  style: TextStyle(color: Colors.orange, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 前进按钮
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MeasurementPage()),
                      );
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
        padding: calculatePaddingBasedOnUnits(),
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
                        '"Brooklyn Heights" Floor: 10/10, Unit: 105',
                        style: TextStyle(color: Colors.cyan[100], fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200, // 你可以根据需要调整
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
                  labelText: 'Enter Unit #',
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addNewUnit,
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

  // 根据unit的数量来设定适当的padding值
  // 此处只是一个示例，您可以根据需要进行调整
  double paddingValue = 10.0 + numberOfUnits;
  return EdgeInsets.all(paddingValue);
}