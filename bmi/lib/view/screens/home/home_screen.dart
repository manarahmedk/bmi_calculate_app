import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view/screens/home/sections/gender_section.dart';
import 'package:bmi/view/screens/home/sections/height_section.dart';
import 'package:bmi/view/screens/home/sections/weight_and_age_section.dart';
import 'package:bmi/view/screens/result_bmi/result_bmi_screen.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: TextCustom(
          text: 'BMI Calculator',
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                GenderSection(),
                SizedBox(
                  height: 12,
                ),
                HeightSection(),
                SizedBox(
                  height: 12,
                ),
                WeightAndAgetSection(),
              ],
            ),
          ),
          SafeArea(
            child: BlocConsumer<BMICubit, BMIStates>(
              listener: (context, state) {
                if (state is BMICalculateSuccessState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultBMIScreen(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.pink,
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: state is! BMICalculateLoadingState
                      ? () {
                          BMICubit.get(context).calculateBMI();
                        }
                      : () {},
                  child: Visibility(
                    visible: state is! BMICalculateLoadingState,
                    child: TextCustom(
                      text: 'CALCULATE',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    replacement: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
