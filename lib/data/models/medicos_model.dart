class MedicoModel{
    final String nome;
    final String especialidade;
    final String codConselho;
    final String contato;
    final String cpf;

  MedicoModel({
        required this.nome,
        required this.especialidade,
        required this.codConselho,
        required this.contato,
        required this.cpf,
       });
  factory MedicoModel.fromMap(Map<String, dynamic> map) {
      return MedicoModel(
          nome: map["name"],
          especialidade: map["Especialidade"],
          codConselho: map["codConselho"],
          contato: map["contato"],
          cpf: map["CPF"]
      );
  }
}