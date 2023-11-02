import 'package:flutter/material.dart';
import 'roomlist.dart';


List<String> windowTypes = [
  '2-wide-single-hung',
  '3-wide-single-hung',
  'fixed-with-single-hung-flankers',
  'fixed-frame-over-left-sliding',
  'fixed-frame-over-right-sliding',
  'fixed-frame-over-fixed-with-sliding-flankers',
  '2-wide-fixed-frame',
  '2-high-fixed-frame',
  '3-wide-fixed-frame',

];

// 创建 StatefulWidget
class MeasurementPage extends StatefulWidget {
  @override
  _MeasurementPageState createState() => _MeasurementPageState();
}

// 创建与 StatefulWidget 相关的 State 类
class _MeasurementPageState extends State<MeasurementPage> {

  String? selectedWindowType=null;
  Size? windowDimensions;  // 存储用户输入的窗户尺寸

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
                      Navigator.pop(context);
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
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                                  text: 'Part 4/7 : Enter Window Type ',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text: '      Status: ',
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MeasurementPage()),
                      // );
                      //NextPage
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
                        '"Brooklyn Heights" Bedroom:2/ Windows:2',
                        style: TextStyle(color: Colors.cyan[100], fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200, // 您可以根据需要进行调整
                      child: selectedWindowType == null
                          ? Center(child: Text('Please select window types:'))
                          : Image.asset('assets/$selectedWindowType.png'),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 500, // 或其他合适的高度
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 每行显示的数量
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: windowTypes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedWindowType = windowTypes[index];
                        });
                      },
                      child: Image.asset('assets/${windowTypes[index]}.png'), // 根据你的文件路径和文件名调整
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


void main() => runApp(MaterialApp(home: MeasurementPage()));
