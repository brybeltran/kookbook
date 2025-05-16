# Primero, crea algunos ingredientes base
cream = Ingredient.create(name: "Clotted cream", description: "Crema espesa", category: "lácteo")
butter = Ingredient.create(name: "Butter", description: "Mantequilla sin sal", category: "lácteo")
cornflour = Ingredient.create(name: "Cornflour", description: "Almidón de maíz", category: "otros")
parmesan = Ingredient.create(name: "Parmesan", description: "Queso parmesano rallado", category: "lácteo")
nutmeg = Ingredient.create(name: "Nutmeg", description: "Nuez moscada", category: "especia")
fettuccine = Ingredient.create(name: "Fettuccine", description: "Pasta fresca", category: "carbohidrato")
herbs = Ingredient.create(name: "Chives or parsley", description: "Hierbas frescas para servir", category: "vegetal")

# Luego, crea 6 recetas y asigna los ingredientes creados
6.times do |i|
  recipe = Recipe.create(
    name: "Creamy Pasta ##{i + 1}",
    instruction: 'In a medium saucepan, stir the clotted cream, butter, and cornflour over a low-ish heat and bring to a low simmer. Turn off the heat and keep warm.'
  )

  # Asocia ingredientes a la receta
  recipe.ingredients << [cream, butter, cornflour, parmesan, nutmeg, fettuccine, herbs]
  recipe.save
end
