import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reorderable_practice/bloc/item_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc(),
      child: Scaffold(body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          return ReorderableListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    key: ValueKey(index), title: Text(state.items[index]));
              },
              itemCount: state.items.length,
              onReorder: ((oldIndex, newIndex) {
                context
                    .read<ItemBloc>()
                    .add(ItemEvent.reorder(oldIndex, newIndex));
              }));
        },
      )),
    );
  }
}
