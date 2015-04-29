# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

FactoryGirl.define do
  factory :user do
    name                   "Example User"
    email                  "user@example.com"
    password               "foobar"
    password_confirmation  "foobar"
  end
end
