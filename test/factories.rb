Factory.define :person do |f|
  f.sequence(:name) { |n| "Name #{n}" }
end
