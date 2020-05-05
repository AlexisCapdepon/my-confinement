class Category { 
  int id;
  String name;

  Category(this.id, this.name);
  
  static List<Category> getCategory() {
    return <Category>[
      Category(1,"Alimentation"),
      Category(2,"Sante"),
      Category(3,"Sport"),
      Category(4,"Animaux"),
    ];
  }
  
}