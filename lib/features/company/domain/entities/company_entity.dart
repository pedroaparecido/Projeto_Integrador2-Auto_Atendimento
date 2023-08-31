class CompanyEntity {
  CompanyEntity({
    this.id,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.rua,
    required this.numero,
    required this.cidade,
    required this.cep,
    required this.bairro,
    required this.telefone,
    required this.email,
    required this.facebook,
    required this.instagram,
    required this.whatsapp,
    required this.missao,
    required this.visao,
    required this.valores,
    this.senhaDeAcesso,
  });

  int? id;
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  String rua;
  String numero;
  String cidade;
  String cep;
  String bairro;
  String telefone;
  String email;
  String facebook;
  String instagram;
  String whatsapp;
  String missao;
  String visao;
  String valores;
  String? senhaDeAcesso;

  @override
  String toString() {
    return 'CompanyEntity(id: $id, razaoSocial: $razaoSocial, nomeFantasia: $nomeFantasia, cnpj: $cnpj, rua: $rua, numero: $numero, cidade: $cidade, cep: $cep, bairro: $bairro, telefone: $telefone, email: $email, facebook: $facebook, instagram: $instagram, whatsapp: $whatsapp, missao: $missao, visao: $visao, valores: $valores, senhaDeAcesso: $senhaDeAcesso)';
  }
}
