import 'package:flutter/material.dart';
import 'package:simple_provider_demo/app_state.dart';
import 'package:simple_state_management/simple_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: () => AppState(),
        child: const HomePage(title: 'Inherited Counter Demo'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: ((context) {
            final appState = context.watch<AppState>();
            return AppBar(
              title: Text(title, style: TextStyle(color: appState.textColor)),
              backgroundColor: appState.backgroundColor,
            );
          }),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Builder(builder: (context) {
              return Text(
                context.watch<AppState>().count.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        final appState = context.watch<AppState>();
        return FloatingActionButton(
          onPressed: appState.incrementCounter,
          tooltip: 'Increment',
          backgroundColor: appState.backgroundColor,
          child: Icon(Icons.add, color: appState.textColor),
        );
      }),
    );
  }
}
