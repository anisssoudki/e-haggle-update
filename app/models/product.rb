class Product < ApplicationRecord
    belongs_to :user
    has_many :product_categories
    has_many :categories, through: :product_categories
   
    has_one_attached :image
    
    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    validates :description, presence: true, length: { minimum: 3, maximum: 300 }
    validates :image, presence: :true
    acts_as_votable
    # accepts_nested_attributes_for :product_categories
    # self.per_page = 3
    has_many :comments, dependent: :destroy

    # make my own method to check if attr are empty and find objects
    # find the nested params somehow 
    # self.categories.find_or_create(product.product_category) find object first and check if nil if not than update
# dont use equal 
    def product_categories_attributes=(attributes)
       attributes.values.each do |hash| 
   
      
        # self.product_categories = ProductCategory.find_or_create(attributes) if ( !attributes['category_id'].nil? && !attributes['like'].nil?)
      pc = ProductCategory.find_by(product_id: self.id, category_id: hash[:category_id]) 
    if pc && pc.id
      
      pc.update(hash)
     
    else 
      pc = ProductCategory.new(hash)
      self.product_categories << pc 
    end 
    # byebug   
    end
      
#       # self.product_categories[0].category_id = attributes.values[0].values[0].to_i
#       # self.product_categories[0].like = attributes.values[0].values[1].to_i
#       # self.product_categories[1].category_id = attributes.values[1].values[0].to_i
#       # self.product_categories[1].like = attributes.values[1].values[1].to_i
#  self.product_categories
      
 
#       # end
    end
  end
