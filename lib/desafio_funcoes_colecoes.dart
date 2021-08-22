void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  var listaHomem = [];
  var listaMulher = [];
  var listaMaioresDeIdade = [];

  //! Baseado na lista acima.

  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  print('1 - Remova os pacientes duplicados e apresente a nova lista');
  // minha resolução
  var listSemDuplicado = pessoas.toSet().toList();
  print(listSemDuplicado);

  // resolucao Rahman
  final pessoasSemDuplicado = pessoas.toSet().map((e) => e.split('|')).toList();
  pessoasSemDuplicado.forEach((p) => print(p[0]));

  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  print('');
  print(
      '2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas');
  // minha resolução
  listSemDuplicado.every((element) {
    if (element.contains('Masculino')) {
      listaHomem.add(element);
      return true;
    } else if (element.contains('Feminino')) {
      listaMulher.add(element);
      return true;
    } else {
      print('Não definido');
      return true;
    }
  });
  print('------------------------------');
  print('quantidade de mulheres ${listaMulher.length}');
  apresentarPeloNome(listaMulher);
  print('------------------------------');
  print('quantidade de homens ${listaHomem.length}');
  apresentarPeloNome(listaHomem);

  // resolucao Rahman
  final mapSexo = <String, List<String>>{};
  for (var pessoa in pessoasSemDuplicado) {
    final sexo = pessoas[2].toLowerCase();
    final listaMasculino = mapSexo['M'] ?? <String>[];
    final listaFeminino = mapSexo['F'] ?? <String>[];

    if (sexo == 'masculino') {
      listaMasculino.add(pessoa[0]);
    }

    if (sexo == 'feminino') {
      listaFeminino.add(pessoa[0]);
    }
  }
  final masculinos = mapSexo['M'] ?? <String>[];
  final femininos = mapSexo['F'] ?? <String>[];

  print('Masculinos (${masculinos.length})');
  masculinos.forEach(print);
  print('Femininos (${femininos.length})');
  femininos.forEach(print);

  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  print('');
  print(
      '3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome');
  // minha resolução
  listSemDuplicado.forEach((element) {
    final pessoaDados = element.split('|');
    var idade = int.tryParse(pessoaDados[1]) ?? 0;
    if (18 < idade) {
      listaMaioresDeIdade.add(element);
    }
  });
  print('------------------------------');
  print('Lista Maiores de idade:');
  apresentarPeloNome(listaMaioresDeIdade);
  // resolucao Rahman

  final pessoasMaiores18 = pessoasSemDuplicado.where((p) {
    final idade = int.tryParse(p[1]) ?? 0;
    return idade > 18;
  }).toList();

  pessoasMaiores18.forEach((element) => print(element[0]));

  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.​

  print('');
  print('4 - Encontre a pessoa mais velha e apresente o nome dela.');
  // minha resolução
  listSemDuplicado.sort((pessoa1, pessoa2) {
    final pessoadados1 = pessoa1.split('|');
    final pessoadados2 = pessoa2.split('|');

    final idadePessoa1 = int.tryParse(pessoadados1[1]) ?? 0;
    final idadePessoa2 = int.tryParse(pessoadados2[1]) ?? 0;
    return idadePessoa1.compareTo(idadePessoa2);
  });
  print('------------------------------');
  print('Mais velho: ${listSemDuplicado.last}');

  // resolucao Rahman
}

void apresentarPeloNome(List lista) {
  lista.forEach((element) {
    final pessoaNome = element.split('|');
    print(pessoaNome[0]);
  });
}
