import 'package:bmi/view/components/details_widget/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_cubit.dart';
import '../../../../view_model/bloc/bmi_cubit/bmi_states.dart';


class WeightAndAgetSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit,BMIStates>(
      listener: (context, state) {
        if (state is BMIAgeOverState){
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      },
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
