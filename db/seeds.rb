ingredients = Pastum.create([
  {title: 'Farinha', description: '2.2'},
  {title: 'Molho', description: '6.99'},
  {title: 'Ovos', description: '0.27'},
  {title: 'Carne Moída', description: '16.00'},
  {title: 'Carne de Sol', description: '25.0'},
  {title: 'Mandioca', description: '4.5'},
  {title: 'Presunto', description: '10.0'},
  {title: 'Queijo', description: '23.0'}
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
