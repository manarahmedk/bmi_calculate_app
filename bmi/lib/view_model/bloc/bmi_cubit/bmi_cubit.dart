import 'package:bloc/bloc.dart';
import 'bmi_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIStates>{
  BMICubit() : super(BMIInitialState());
  static BMICubit get(context) => BlocProvider.of<BMICubit>(context);

  bool isMale=true;

  void changeGender(String gender){
    if(gender=='male'){
      isMale=true;
    }else{
      isMale=false;
    }
    emit(BMIChangeGenderState());
  }

  double height =150;

  void changeHeightSlider(double value){
    height=value;
    emit(BMIChangeHeightSliderState());
  }

  int weight=50;

  void addWeight(){
    weight++;
    emit(BMIAddWeightState());
  }

  void minusWeight(){
    weight--;
    emit(BMIMinusWeightState());
  }

  int age=25;

  void addAge(){
    if(age==100){
      emit(BMIAgeOverState());
      return;
    }
    age++;
    emit(BMIAddAgeState());
  }

  void minusAge(){
    age--;
    emit(BMIMinusAgeState());
  }

  double bmiValue=0;

  void calculateBMI(){
    emit(BMICalculateLoadingState());
    Future.delayed(Duration(seconds: 2),(){
      bmiValue= weight/((height/100)*(height/100));
      emit(BMICalculateSuccessState());
    });
  }

}