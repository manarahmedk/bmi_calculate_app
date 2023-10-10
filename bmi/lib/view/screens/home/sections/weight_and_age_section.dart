import 'package:bmi/view/components/details_widget/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_cubit.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_states.dart';


class WeightAndAgetSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit,BMIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        BMICubit cubit =BMICubit.get(context);
        return Row(
          children: [
            Expanded(
              child: DetailsWidget(
                text: 'Weight',
                value: cubit.weight,
                onAddPressed: (){
                  cubit.addWeight();
                },
                onMinusPressed: (){
                  cubit.minusWeight();
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: DetailsWidget(
                text: 'Age',
                value: cubit.age,
                onAddPressed: (){
                  cubit.addAge();
                },
                onMinusPressed: (){
                  cubit.minusAge();
                },
              ),
            ),
          ],
        );
      },
    );

  }
}
