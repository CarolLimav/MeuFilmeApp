import 'combo_model.dart';
import 'filme_model.dart';

class CartPage{
  final List<Combo> combos;
  final Filme filme;
  final String dia;
  final String assento;

  CartPage({
    required this.combos,
    required this.filme,
    required this.dia,
    required this.assento,
  });
  
}
