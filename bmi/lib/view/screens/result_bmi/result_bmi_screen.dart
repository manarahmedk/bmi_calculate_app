import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/material.dart';

class ResultBMIScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(text: 'your bmi :',fontSize: 20,),
            TextCustom(text:'${BMICubit.get(context).bmiValue}',fontSize: 20,),
          ],
        ),
      ),
    );
  }
}
