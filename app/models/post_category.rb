class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category



  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [], category_attributes: [:name])
  end
end
