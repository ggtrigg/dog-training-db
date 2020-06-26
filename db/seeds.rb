# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  %q(What are the dog's issues?),
  %q(Has vet or other professional been consulted?),
  %q(Does dog show fear or aggression towards people?),
  %q(Does dog show fear or aggression towards other animals?),
  %q(Who will be present during the consultation? Other people? Other animals?),
  %q(Is dog suffering with pain? Are there any known health issues? Any medication?),
  %q(Is appointment scheduled for the dog's quiet time?),
  %q(Is there anything else I need to be aware of?)
].each do |item|
  IntakeItem.create(text: item)
end
