import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceCubit extends Cubit<int> {
  ExperienceCubit() : super(0); // Default selected index = 0

  void selectExperience(int index) {
    emit(index);
  }
}
