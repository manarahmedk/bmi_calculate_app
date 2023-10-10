import '../../../../view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_states.dart';
import '../../../components/gender/gender_widget.dart';

class GenderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit,BMIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: GenderWidget(
                icon: Icons.male_rounded,
                text: 'Male',
                isSelected: BMICubit.get(context).isMale,
                onTap: (){
                  BMICubit.get(context).changeGender('male',);
                },
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: GenderWidget(
                icon: Icons.female_rounded,
                text: 'Female',
                isSelected: !BMICubit.get(context).isMale,
                onTap: (){
                  BMICubit.get(context).changeGender('female',);
                },
              ),
            ),
          ],
        );
      },
    );

  }
}
