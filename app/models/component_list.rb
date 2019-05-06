class ComponentList < ApplicationRecord
  validates :name, presence: true
  validates :components, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "word components only allow letters" }
end
