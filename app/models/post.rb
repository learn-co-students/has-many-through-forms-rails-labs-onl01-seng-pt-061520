class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes[:name].blank? }
  validates :title, presence: true
  validates :content, presence: true

  def categoires_attributes=(categoires_attributes)
    if categoires_attributes[:category]&.present?
      categoires_attributes.values.each do |categoires_attribute|
        category = Category.find_or_create_by(categoires_attribute)
        self.post_categories.build(category: category)
      end
    end
  end

end
