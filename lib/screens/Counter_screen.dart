import 'package:demoproject/bloc/bloc_event.dart';
import 'package:demoproject/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demoproject/bloc/bloc_state.dart';

class Counterscreen extends StatelessWidget {
 const Counterscreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    //final bloc = context.read<CounterBloc>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc , CounterState>(
          builder: (context , state){
            return Text(state.counter.toString(),
            style: TextStyle(
              fontSize: 60
            ),);
        
        }),
      ),

      
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'Increament',
      //   onPressed: (){
      //   bloc.add(increamentEvent());
      // }),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            
            onPressed: (){
            context.read<CounterBloc>().add(increamentEvent());
          },
          child: Icon(Icons.add),),

          SizedBox(width: 40,),
          FloatingActionButton(
            
            onPressed: (){
            context.read<CounterBloc>().add(decreamentEvent());
          },
          child: Icon(Icons.remove),
          )
        ],
      ),
      
      
    );
    
  }
}