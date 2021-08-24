import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sheets_api_example/src/comman/models/create_sheet_dto.dart';
import 'package:google_sheets_api_example/src/comman/services/sheet_service.dart';

part 'insert_one_cubit_state.dart';

class InsertOneCubitCubit extends Cubit<InsertOneCubitState> {
  InsertOneCubitCubit() : super(InsertOneInitial());

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final modelNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? _purchaseDate;
  DateTime? get purchaseDate => _purchaseDate;
  set purchaseDate(DateTime? date) {
    _purchaseDate = date;
    emit(InsertOneInitial());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    modelNumberController.dispose();
    return super.close();
  }

  Future<void> createOne() async {
    if (formKey.currentState!.validate()) {
      if (purchaseDate == null) {
        emit(const InsertOneFailure('must_enter_purchse_date'));
      } else {
        return _createOne();
      }
    } else {
      emit(const InsertOneFailure('not_valid_form'));
    }
  }

  Future<void> _createOne() async {
    try {
      emit(InsertOneLoading());
      await SheetService.createOne(
        CreateSheetDto(
          email: emailController.text.trim(),
          mobile: mobileController.text.trim(),
          modelNumber: modelNumberController.text.trim(),
          name: nameController.text.trim(),
          putchaseDate: purchaseDate!,
        ),
      );
      emit(InsertOneSuccess());
    } catch (e) {
      emit(InsertOneFailure(e.toString()));
    }
  }
}
