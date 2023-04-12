class Filter {
  final bool gluten;
  final bool lactose;
  final bool vegan;
  final bool vegetarian;

  const Filter({
    this.gluten = false,
    this.lactose = false,
    this.vegan = false,
    this.vegetarian = false,
  });

  Filter copyWith({
    bool? gluten,
    bool? lactose,
    bool? vegan,
    bool? vegetarian,
  }) {
    return Filter(
      gluten: gluten ?? this.gluten,
      lactose: lactose ?? this.lactose,
      vegan: vegan ?? this.vegan,
      vegetarian: vegetarian ?? this.vegetarian,
    );
  }
}
