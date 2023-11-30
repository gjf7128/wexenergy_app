import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WexEnergy Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class BuildingInfo {
  String buildingName;
  int floors;
  int rooms;
  int windows;

  BuildingInfo({required this.buildingName, required this.floors, required this.rooms, required this.windows});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final primaryBlue = HexColor("#418fde");
  final primaryOrange = HexColor("#ff8200");

  final secondaryLightGrey = HexColor("#D0D3D4");
  final secondaryDarkGrey = HexColor("#647692");
  final secondaryBlack = HexColor("#2D2926");

  final white = HexColor("#f8fafd");
  final borderBlue = HexColor("#90b5da");
  final borderBlueDark = HexColor("#528ac4");
  final lightOrange = HexColor("#8e4cb");

  String companyName = 'Loading company name...';
  String address = 'Loading address...';
  String buildingName = '<Building Name>';
  int floors = 0;
  int rooms = 0;
  int windows = 0;

  @override
  void initState() {
    super.initState();
    // Call API here and update the state
    fetchCompanyInfo();
  }

  void fetchCompanyInfo() async {
    // Simulate a delay to fetch data from an API
    await Future.delayed(Duration(seconds: 1));

    // Update the state with API data
    setState(() {
      companyName = '<Company Name>';
      address = '123 Main St, Brooklyn Heights';
    });
  }

  List<BuildingInfo> buildings = [];

  void onAddBuilding() {
    // Function to handle the logic when the "Add Building" button is pressed
    addBuilding(); // Add a new building to the list
    print('Building added, total count: ${buildings.length}'); // Debug print
  }

  void addBuilding() async {
    // Update the state with API data
    setState(() {
      buildings.add(BuildingInfo(buildingName: '<Building Name>', floors: 0, rooms: 0, windows: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: primaryBlue,
        ),
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(companyName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                      SizedBox(height: 8),
                      Text('Address: $address', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              for (var building in buildings) buildingCard(building),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight, // Aligns the button to the right side
                child: TextButton(
                  onPressed: onAddBuilding,
                  child: Text('+ Add Building', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildingCard(BuildingInfo building) {
    // Widget to create a card for building information
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$buildingName', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: Text('Floors: $floors', style: TextStyle(fontSize: 18))),
                          Expanded(child: Text('Rooms: $rooms', style: TextStyle(fontSize: 18))),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('Windows: $windows', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/BusinessInfoPage');
                          }, // Transition here
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue, // Button color
                            onPrimary: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: Text('Start Entering Information', style: TextStyle(fontSize: 18)),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
