class FavoriteMailer < ApplicationMailer

  def new_comment(user, post, comment)
 
    headers["Message-ID"] = "<comments/#{comment.id}@secret-cove-63814.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-cove-63814.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@ysecret-cove-63814.herokuapp.com>"
 
    @user = user
    @post = post
    @comment = comment
 
    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@secret-cove-63814.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-cove-63814.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@secret-cove-63814.herokuapp.com>"

    @post = post

    mail(to: post.user.email, subject: "Your post, #{post.title}, has been favorited!")
  end
end
