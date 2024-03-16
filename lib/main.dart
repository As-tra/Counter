import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sami_version/cubit/counter_cubit.dart';
import 'package:sami_version/cubit/counter_state.dart';
import 'package:sami_version/pages/home_page.dart';

void main() => runApp(BasketBallCounter());

class BasketBallCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(CounterAIncrementState()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
