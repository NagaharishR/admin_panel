import 'package:flutter/material.dart';

import '../screens/Dashboard.dart';
import '../screens/history_screen.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

  bool showHistory = false;
  bool showDashboard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.asset(
            'images/Scissors_backgroundremove.png',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          Text(
            "Scissor's",
            style: TextStyle(fontSize: 25),
          ),
        ]),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 20,
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text("LOGOUT"),
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 10,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 25)),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 25),
            ),
            Divider(
              thickness: 3,
              indent: 15,
              endIndent: 15,
            ),

            Padding(
              padding: tilePadding,
              child: ListTile(
                title: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showDashboard = true;
                      showHistory = false; // Set showHistory to false when Dashboard is selected
                    });
                  },
                  icon: Icon(Icons.home),
                  label: Text("DASHBOARD"),
                ),
              ),
            ),
            Padding(
              padding: tilePadding,
              child: ListTile(
                title: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showDashboard = false; // Set showDashboard to false when History is selected
                      showHistory = !showHistory;
                    });
                  },
                  icon: Icon(Icons.history),
                  label: Text("HISTORY"),
                ),
              ),
            ),
            Padding(
              padding: tilePadding,
              child: ListTile(
                title: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                  label: Text("SETTINGS"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: 'Search Bar',
                hintText: 'Type here',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  if (showDashboard)
                    Expanded(
                      child: Dashboard(),
                    ),
                  if (showHistory)
                    Expanded(
                      child: HistoryScreen(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
