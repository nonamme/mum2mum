namespace :db do
  desc "Populate database"
  task populate: :environment do
    1000.times do
      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(6),
        address: Address.new(
          city: Faker::Address.city,
          street: Faker::Address.street_name,
          home_number: Faker::Address.building_number,
          post_code: Faker::Address.zip,
          country: Faker::Address.country,
          latitude: rand(51.500000..53.000000),
          longitude: rand(-4.200000..1.500000)
        )
      )
    end
  end

  desc "Add status to profiles"
  task addstatus: :environment do
    a = [:coffee, :shopping, :helpful]
    User.all.each do |user|
      user.update status: a.sample
    end
  end

  desc "Add missing picture"
  task addpicture: :environment do
    User.all.each do |user|
      user.update image: File.open(Dir.glob(File.join(Rails.root, "app", "assets", "images", "svg", "*")).sample)
    end
  end
end
