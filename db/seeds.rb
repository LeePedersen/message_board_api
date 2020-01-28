# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  Group.destroy_all
  Message.destroy_all
  def self.begin
    seed = Seed.new
    seed.generate_groups
  end

  def generate_groups
    10.times do |i|
      group = Group.create!(name: Faker::Dessert.variety)
      puts "Group #{i}: name is #{group.name}."
      5.times do |j|
        message = group.messages.create!(author: Faker::Name.name, content: Faker::Coffee.notes)
        puts "Message #{j}: author = #{message.author}"
      end
    end
  end
end

Seed.begin
