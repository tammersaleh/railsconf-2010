Factory.define :state do |f|
  f.name "draft"
end

Factory.define :category do |f|
  f.name "category"
end

Factory.define :article do |f|
  f.title "title"
  f.body  "body"
  f.association :state
  f.association :category
end
