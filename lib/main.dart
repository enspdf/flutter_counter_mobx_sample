import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutter_counter_sample/store/counter.dart';

final counter = Counter();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterExample(),
    );
  }
}

class CounterExample extends StatelessWidget {
  const CounterExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(
              Icons.arrow_drop_up,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: counter.decrement,
            tooltip: 'Decrement',
            child: Icon(
              Icons.arrow_drop_down,
            ),
          ),
        ],
      ),
    );
  }
}
