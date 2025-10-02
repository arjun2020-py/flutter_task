part of 'patinet_list_cubit.dart';

sealed class PatinetListState {}

final class PatinetListInitial extends PatinetListState {}

final class PatientListData extends PatinetListState {
  final GetApiResponsePatientListModel getApiResponsePatientListModel;
  PatientListData({required this.getApiResponsePatientListModel});
}
