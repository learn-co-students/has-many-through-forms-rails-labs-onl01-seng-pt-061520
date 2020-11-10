class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categoires_attributes=(categoires_attributes)
    categoires_attributes.values.each do |categoires_attribute|
      category = Category.find_or_create_by(categoires_attribute)
      self.post_categories.build(category: category)
    end
  end

end
