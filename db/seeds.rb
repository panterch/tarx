# seeds database, uses faker library
#
# gem install faker


require 'faker'

LEVELS = 4
MAX_CHILDREN = 10
CODES = ('AAA'..'ZZZ').to_a

Person.destroy_all

def create_children(parent, level)
  (0..rand(MAX_CHILDREN)).each do
    child = Person.create!(:name => Faker::Name.name, :parent => parent,
                           :code => CODES[@cnt])
    @cnt = @cnt + 1
    create_children(child, level - 1) if level > 1
  end
end

parent = Person.create!(:name => Faker::Name.name, :code => CODES[0])
@cnt = 1
create_children(parent, LEVELS)
puts "Seeded #{@cnt} persons"

