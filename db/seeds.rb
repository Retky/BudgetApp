# Users
user1 = User.create(name: "Felix", email: "felix@mailex.com", password: "123456")
user2 = User.create(name: "John", email: "john@mailex.com", password: "123456")

# Categorys
catFood = Category.create(name: "Food", icon: 'https://picsum.photos/200', author_id: user1.id)
catKids = Category.create(name: "Kids", icon: 'https://picsum.photos/200', author_id: user1.id)
catTransport = Category.create(name: "Transport", icon: 'https://picsum.photos/200', author_id: user2.id)

# Movements
move1 = Movement.create(name: "Michiburger", amount: 7.75, author_id: user1.id)
move2 = Movement.create(name: "Bus", amount: 0.75, author_id: user2.id)
move3 = Movement.create(name: "PizzaCap", amount: 5.80, author_id: user1.id)

# CategoryMovements
catMoveA1 = CategoryMovement.create(category_id: catFood.id, movement_id: move1.id)
catMoveA2 = CategoryMovement.create(category_id: catKids.id, movement_id: move1.id)
catMoveA3 = CategoryMovement.create(category_id: catFood.id, movement_id: move3.id)
catMoveB1 = CategoryMovement.create(category_id: catTransport.id, movement_id: move2.id)
