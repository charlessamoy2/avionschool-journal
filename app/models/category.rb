class Category < ApplicationRecord
    validates :name,:description,  presence: true
    validates :name, uniqueness: { scope: :user, message: "should not have a duplicate per user"}

    has_many :tasks
    belongs_to :user
end
