ingredients = Ingredient.create([
  {title: 'Farinha', price: '2.2'},
  {title: 'Molho', price: '6.99'},
  {title: 'Ovos', price: '0.27'},
  {title: 'Carne Moída', price: '16.00'},
  {title: 'Carne de Sol', price: '25.0'},
  {title: 'Mandioca', price: '4.5'},
  {title: 'Presunto', price: '10.0'},
  {title: 'Queijo', price: '23.0'}
  ])

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
