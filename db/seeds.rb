# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lists = List.create!([
    { title: "lista 1" },
    { title: "lista 2" },
    { title: "lista 3" },
    { title: "lista 4" },
    { title: "lista 5" },
    { title: "lista 6" }
])

lists.each do |list|
    Item.create!([
        {
            description: "exemplo 1",
            marked: false,
            list: list
        },
        {
            description: "exemplo 2",
            marked: false,
            list: list
        },
        {
            description: "exemplo 3",
            marked: false,
            list: list
        }
    ])
end