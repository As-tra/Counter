import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sami_version/cubit/counter_cubit.dart';

class CustomButton extends StatelessWidget {
  final int points;
  final String team;
  const CustomButton({
    super.key,
    required this.points,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<CounterCubit>(context)
            .teamIncrement(team: team, points: points);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(150, 50),
      ),
      child: Text(
        'Add $points point',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
