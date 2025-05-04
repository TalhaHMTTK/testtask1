class Comment < ApplicationRecord
  belongs_to :post
  
  after_create_commit do
    broadcast_append_to [post, :comments], target: "comments_#{post.id}", partial: "comments/comment", locals: { comment: self }
  end
end
