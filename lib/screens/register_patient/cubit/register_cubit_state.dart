part of 'register_cubit_cubit.dart';

sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterCubitLocationChanged extends RegisterCubitState {}

final class RegisterCubitBranchChanged extends RegisterCubitState {}

final class RegisterCubitTreatmentChanged extends RegisterCubitState {}

final class RegisterCubitPatientCountChanged extends RegisterCubitState {}

final class RegisterCubitTreatmentAdded extends RegisterCubitState {}

final class RegisterCubitTreatmentRemoved extends RegisterCubitState {}

final class RegisterCubitTreatmentEditing extends RegisterCubitState {}
