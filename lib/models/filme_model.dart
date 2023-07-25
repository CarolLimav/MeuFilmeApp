

class Filme{
  final String id;
  final String nome;
  final String imageUrl; 
  final String sinopse; 
  final String descricao; 
  bool selecionado; 

Filme({
  required this.descricao,
 required  this.id,
 required this.imageUrl,
  required this.nome,
 required this.sinopse,
 this.selecionado = false,
 
});
}

