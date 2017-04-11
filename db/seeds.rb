# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = [
  {
    name: "Margot Lee Shetterly" #,
    # bio_url: "https://en.wikipedia.org/wiki/Roxane_Gay"
  },
  {
    name: "Sandi Metz" #,
    # bio_url: "https://en.wikipedia.org/wiki/Sandi_Metz"
  },
  {
    name: "Octavia E. Butler" #,
    # bio_url: "https://en.wikipedia.org/wiki/Octavia_E._Butler"
  }
]


success_count = 0
authors.each do |author|
  auth = Author.create(author)

  if auth.id
    success_count += 1
    puts "#{auth.name} successfully added"
  end
end

puts "#{success_count} out of #{authors.length} successfully added"
