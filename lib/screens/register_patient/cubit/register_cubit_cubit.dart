import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/treatment_item_model.dart';
import '../model/treatment_model.dart';


part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit(this.context) : super(RegisterCubitInitial());
  BuildContext context;

  // Location dropdown
  String locationSelection = "Select Location";
  List<String> locationList = [
    "Select Location",
    "Location 1",
    "Location 2",
    "Location 3",
  ];

  // Branch dropdown
  String branchSelection = "Select Branch";
  List<String> branchList = [
    "Select Branch",
    "Branch 1",
    "Branch 2",
    "Branch 3",
  ];

  // Treatment dropdown
  String chooseTreatment = "Select Treatment";
  List<String> treatmentList = [
    "Select Treatment",
    "Couple Combo package includes:",
    "Treatment 2",
    "Treatment 3",
  ];

  // Treatment list to store added treatments
  List<TreatmentModel> addedTreatments = [];

  // Patient counts
  int maleCount = 0;
  int femaleCount = 0;

  void locationDropDwonValue(String value) {
    locationSelection = value;
    emit(RegisterCubitLocationChanged());
  }

  void branchDropDwonValue(String value) {
    branchSelection = value;
    emit(RegisterCubitBranchChanged());
  }

  void treatmentDropDwonValue(String value) {
    chooseTreatment = value;
    emit(RegisterCubitTreatmentChanged());
  }

  void updateMaleCount(int count) {
    maleCount = count;
    emit(RegisterCubitPatientCountChanged());
  }

  void updateFemaleCount(int count) {
    femaleCount = count;
    emit(RegisterCubitPatientCountChanged());
  }

  void addTreatmentToList() {
    if (chooseTreatment != "Select Treatment") {
      addedTreatments.add(
        TreatmentModel(
          treatmentName: chooseTreatment,
          maleCount: maleCount,
          femaleCount: femaleCount,
        ),
      );
      
      // Reset values
      chooseTreatment = "Select Treatment";
      maleCount = 0;
      femaleCount = 0;
      
      emit(RegisterCubitTreatmentAdded());
    }
  }

  void removeTreatment(int index) {
    if (index >= 0 && index < addedTreatments.length) {
      addedTreatments.removeAt(index);
      emit(RegisterCubitTreatmentRemoved());
    }
  }

  void editTreatment(int index) {
    if (index >= 0 && index < addedTreatments.length) {
      // Load the treatment data for editing
      final treatment = addedTreatments[index];
      chooseTreatment = treatment.treatmentName;
      maleCount = treatment.maleCount;
      femaleCount = treatment.femaleCount;
      
      // Remove the old entry
      addedTreatments.removeAt(index);
      
      emit(RegisterCubitTreatmentEditing());
    }
  }

   final treatments = [
    TreatmentItem(
      name: 'Panchakarma',
      price: 230,
      maleCount: 4,
      femaleCount: 4,
      total: 2540,
    ),
    TreatmentItem(
      name: 'Njavara Kizhi Treatment',
      price: 230,
      maleCount: 4,
      femaleCount: 4,
      total: 2540,
    ),
    TreatmentItem(
      name: 'Panchakarma',
      price: 230,
      maleCount: 4,
      femaleCount: 6,
      total: 2540,
    ),
  ];
}
