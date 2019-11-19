# frozen_string_literal: true

Product.destroy_all

40.times do
  p = Product.create(name: Faker::Commerce.unique.product_name,
                     price_cents: rand(5000..100_000).to_i,
                     description: Faker::Hipster.sentence(rand(3..6)))

  puts "Creating #{p.name}"

  downloaded_image = open("https://source.unsplash.com/600x600/?#{p.name}")
  p.image.attach(io: downloaded_image, filename: "m-#{p.name}.jpg")
end
