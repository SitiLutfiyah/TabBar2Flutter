import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Data'),
        backgroundColor: const Color.fromARGB(255, 0, 126, 4), // Warna latar belakang AppBar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.green, // Warna latar belakang TabBar
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,  // Warna indikator tab yang dipilih
              labelColor: Colors.white,  // Warna teks tab yang dipilih
              unselectedLabelColor: Colors.white70,  // Warna teks tab yang tidak dipilih
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Welcome'),
                Tab(icon: Icon(Icons.question_mark), text: 'Page 1'),
                Tab(icon: Icon(Icons.question_mark), text: 'Page 2'),
                Tab(icon: Icon(Icons.info), text: 'About'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Welcome Page')),
          Center(child: Text('Page 1')),
          Center(child: Text('Page 2')),
          Center(child: Text('About Page')),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
