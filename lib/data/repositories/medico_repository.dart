import 'dart:convert';

import 'package:aula_26_04/data/http/exceptios.dart';
import 'package:aula_26_04/data/http/http_client.dart';
import 'package:aula_26_04/data/models/medicos_model.dart';

abstract class IMedicoRepository {
  Future<List<MedicoModel>>getMedicos();
}

class MedicoRepository implements IMedicoRepository {

  final IHttpClient client;

  MedicoRepository({required this.client});

  @override
  Future<List<MedicoModel>> getMedicos() async {
   final response = await client.get(url:"https://parseapi.back4app.com/parse/classes/Medico");

   if (response.statusCode == 200) {
     final List<MedicoModel> medicos = [];

     final body = jsonDecode(response.body);
     body['results'].map((item) {
       final MedicoModel medico = MedicoModel.fromMap(item);
       medicos.add(medico);
     }).toList();

     return medicos;

   } else if (response.statusCode == 404){
     throw NotFoundException("A url informada não é valida!");

   } else {
     throw Exception("Não foi possivel carregar os dados!");
   }
  }
}