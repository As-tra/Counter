import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sami_version/components/custom_button.dart';
import 'package:sami_version/cubit/counter_cubit.dart';
import 'package:sami_version/cubit/counter_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int teamApoints = 0;
  int teamBpoints = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Points Counter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<CounterCubit, CounterIncrementState>(
        listener: (context, state) {
          if (state is CounterAIncrementState) {
            teamApoints = BlocProvider.of<CounterCubit>(context).teamAPoints;
          } else {
            teamBpoints = BlocProvider.of<CounterCubit>(context).teamBPoints;
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          '$teamApoints',
                          style: const TextStyle(fontSize: 150),
                        ),
                        const CustomButton(points: 1, team: 'A'),
                        const CustomButton(points: 2, team: 'A'),
                        const CustomButton(points: 3, team: 'A'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team B',
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          '$teamBpoints',
                          style: const TextStyle(fontSize: 150),
                        ),
                        const CustomButton(points: 1, team: 'B'),
                        const CustomButton(points: 2, team: 'B'),
                        const CustomButton(points: 3, team: 'B'),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(150, 50),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
