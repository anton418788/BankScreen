
import 'package:flutter/material.dart';

import 'hover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 2,
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 2.0,
                  pinned: true,
                  floating: false,
                  expandedHeight: 300.0,
                  actions: [
                    IconButton(
                      padding: const EdgeInsets.only(top: 30.0),
                      icon: const Icon(Icons.add_box),
                      onPressed: () {},
                    )
                  ],
                  leading: IconButton(
                    padding: const EdgeInsets.only(top: 30.0),
                    icon: const Icon(Icons.add_box),
                    onPressed: () {},
                  ),
                  bottom: const TabBar(
                    indicatorColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          'Профиль',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text('Настройки',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 36.0,
                            ),
                            Image.asset(
                              'assets/ic_user.webp',
                              width: 140.0,
                              height: 140.0,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const Text(
                              'Екатерина',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ]),
                    ),
                  ),
                ),
                ];
              },
              body: TabBarView(
                children: [
                  //const ProfileTab(),
                  Container(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    alignment: Alignment.center,
                    child: const Text('Настройки'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
