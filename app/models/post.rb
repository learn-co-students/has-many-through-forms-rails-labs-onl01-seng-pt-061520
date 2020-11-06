class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: :all_blank




  def comments_attributes=(comment_attributes)
    comment_attributes.values.each do |comment_attribute|
      comment = Comment.find_or_create_by(comment_attribute)
      self.comment_attributes.build(comment: comment)
    end
  end

  # def categories_attributes=(categories_hashes)
  #   categories_hashes.each do [i, categories_attributes]
  #     category = Category.find_or_create_by(name: category_atributes[:name])
  #     self.post_categories.build(category: category) 
  #   end
  # end 


end
