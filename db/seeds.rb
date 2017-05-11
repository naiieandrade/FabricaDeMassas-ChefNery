ingredients = Pastum.create([
  {title: 'Farinha', description: '2.2', type_ingredient: 'pasta'}
]),
ingredients = Filling.create([
  {title: 'Carne Moída', description: '16.00', type_ingredient: 'filling'},
  {title: 'Carne de Sol', description: '25.0', type_ingredient: 'filling'},
  {title: 'Mandioca', description: '4.5', type_ingredient: 'filling'},
  {title: 'Presunto', description: '10.0', type_ingredient: 'filling'},
  {title: 'Queijo', description: '23.0', type_ingredient: 'filling'}
]),

ingredients = Spice.create([
  {title: 'Pimenta', description: '16.00', type_ingredient: 'spice'},
  {title: 'Orégano', description: '25.0', type_ingredient: 'spice'}
]),

ingredients = Sauce.create([
  {title: 'Tomate', description: '16.00', type_ingredient: 'sauce'},
  {title: 'Caipira', description: '25.0', type_ingredient: 'sauce'}
]),

products = Product.create([
    {title: 'Corniccione',
      description: "Delicioso Corniccione",
      category: "Culinária Italiana",
      price: 25,
      imageproduct: "lasanha.jpg",
      :ingredients => Ingredient.where(:title => ['Ovos', 'Queijo'])},
    {title: 'Lasanha',
      description: "Deliciosa lasanha com molhos vermelho e branco",
      category: "Culinária Italiana",
      price: 25,
      :ingredients => Ingredient.where(:title => ['Farinha', 'Molho', 'Ovos', 'Carne Moída', 'Presunto', 'Queijo'])},
    {title: 'Escondidinho',
      description: "Delicioso escondidinho",
      category: "Culinária Brasileira",
      price: 25,
      :ingredients => Ingredient.where(:title => ['Ovos', 'Carne de Sol', 'Mandioca' 'Queijo'])},

    {title: 'Pão Chines',
      description: "Delicioso Pão Chines",
      category: "Culinária Oriental",
      price: 25,
      :ingredients => Ingredient.where(:title => ['Ovos', 'Farinha'])},

    {title: 'Pão Italiano',
      description: "Delicioso Pão Italiano",
      category: "Culinária Italiana",
      price: 25,
      :ingredients => Ingredient.where(:title => ['Ovos', 'Farinha'])}

    ]),

admin = User.create(name: "admin", email:"admin@admin.com", password:"123456", is_administrator: true)

OrderStatus.delete_all
OrderStatus.create! id: 1, description: "Em progresso"
OrderStatus.create! id: 2, description: "Aceito"
OrderStatus.create! id: 3, description: "Cancelado"
