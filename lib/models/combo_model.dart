

class Combo{
final String id;
final String nome; 
double? preco;
final String descricao;
final String imageUrl;
bool selecionado;


Combo({required this.id, required this.descricao,  required this.preco, required this.imageUrl, required this.nome, this.selecionado = false});

}