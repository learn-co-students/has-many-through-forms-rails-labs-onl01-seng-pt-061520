class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes.any? { |attribute| attribute.blank? } }

  def user_attributes=(user_attributes)
    #raise params.inspect
    if user_attributes[:username].present?
      user_attributes.values.each do |user_attribute|
        user = User.find_or_create_by(username: user_attribute)
        # binding.pry
        self.user = user
        self.save
      end
    end
  end

end
