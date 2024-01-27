# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# userを作成
# userを100人以上作成したい場合は、以下のように書く
# すでに存在している場合は、作成しない
100.times do |n|
  User.find_or_create_by!(name: "John Doe #{n + 1}")
end

# 1人だけ作成する場合は、以下のように書く
# User.find_or_create_by!(name: "John Doe")
