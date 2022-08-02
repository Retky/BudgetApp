# User
user1 = User.create(name: "Felix")

# Category
catFood = Category.create(name: "Food", user_id: user1.id)

# Movement
move1 = Movement.create(name: "Michiburger", amount: 7.75, user_id: user1.id)

# CategoryMovement
catMove1 = CategoryMovement.create(category_id: catFood.id, movement_id: move1.id)
