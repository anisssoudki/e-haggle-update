class ProductCategory < ApplicationRecord
    belongs_to :product
    belongs_to :category
    # validates :like, presence: :true
    validates :like, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10} 


   

  end