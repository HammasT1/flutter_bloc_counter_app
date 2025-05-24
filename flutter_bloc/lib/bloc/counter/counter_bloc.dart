import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_counter_app/bloc/counter/counter_events.dart';
import 'package:flutter_bloc_counter_app/bloc/counter/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents , CounterStates> {
  CounterBloc() : super(const CounterStates()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event , Emitter<CounterStates> emit){
    emit(state.copyWith(counter: state.counter +1));
  }

  void _decrement(DecrementCounter event , Emitter<CounterStates> emit){
    emit(state.copyWith(counter: state.counter -1));
  }

}