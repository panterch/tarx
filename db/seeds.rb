# seeds database, uses faker library
#
# gem install faker


require 'faker'

LEVELS = 4
MAX_CHILDREN = 10
CODES = ('AAA'..'ZZZ').to_a

Person.destroy_all

def create_children(parent, level, cnt)
  (0..rand(MAX_CHILDREN)).each do
    cnt = cnt + 1
    child = Person.create!(:name => Faker::Name.name, :parent => parent,
                           :code => CODES[cnt])
    create_children(child, level - 1, cnt) if level > 1
  end
end

parent = Person.create!(:name => Faker::Name.name, :code => CODES[0])
create_children(parent, LEVELS, 0)

