class Product < ApplicationRecord
    belongs_to :user
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_one_attached :image
    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    validates :description, presence: true, length: { minimum: 3, maximum: 300 }
    validates :image, presence: :true
    acts_as_votable
    has_many :comments, dependent: :destroy

    
    def product_categories_attributes=(attributes)
      attributes.values.each do |hash| 
        pc = ProductCategory.find_by(product_id: self.id, category_id: hash[:category_id]) 
          if pc && pc.id
            pc.update(hash)
          else 
            pc = ProductCategory.new(hash)
            self.product_categories << pc 
          end 
      end  
    end

  end
