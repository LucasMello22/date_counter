

import 'package:aula_26_04/data/http/exceptios.dart';
import 'package:aula_26_04/data/models/medicos_model.dart';
import 'package:aula_26_04/data/repositories/medico_repository.dart';
import 'package:flutter/cupertino.dart';

class MedicoStore{

  final IMedicoRepository repository;

  // load
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  //state
  final ValueNotifier<List<MedicoModel>> state = ValueNotifier<List<MedicoModel>>([]);
  //error
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  MedicoStore({required this.repository});

  Future getMedicos() async {
    isLoading.value = true;

    try {
     final result = await repository.getMedicos();
     state.value = result;
    } on NotFoundException catch (e) { erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}