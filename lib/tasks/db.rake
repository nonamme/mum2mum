namespace :db do
  desc "Populate database"
  task populate: :environment do
    1000.times do
      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(8, 20),
        address: Address.new(
          city: Faker::Address.city,
          street: Faker::Address.street_name,
          home_number: Faker::Address.building_number,
          post_code: Faker::Address.zip,
          country: Faker::Address.country,
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
      File.open(Dir.glob(Rails.root.join('app/assets/images/svg/*').to_s).sample) do |file|
        user.update image: file
      end
    end
  end
end
