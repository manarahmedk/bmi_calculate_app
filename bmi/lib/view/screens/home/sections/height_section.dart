import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_cubit.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_states.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/gender/gender_widget.dart';

class HeightSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit,BMIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BackgroungWidget(
          child: Column(
            children: [
              const TextCustom(
                text: 'Height',
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: '${BMICubit.get(context).height.round()}',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextCustom(
                        text: 'cm',
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Slider(
                value: BMICubit.get(context).height,
                min: 0,
                max: 300,
                activeColor: AppColors.pink,
                inactiveColor: AppColors.grey,
                onChanged: (value) {
                  BMICubit.get(context).changeHeightSlider(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
