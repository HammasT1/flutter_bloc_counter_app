import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_counter_app/bloc/counter/counter_events.dart';
import 'package:flutter_bloc_counter_app/bloc/counter/counter_states.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter Example'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc , CounterStates>(
              builder: (context, state){
                return  Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 60),));
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: Text('Increment')),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: Text('Decrement'))

            ],
          )
        ],
      ),
    );
  }
}
