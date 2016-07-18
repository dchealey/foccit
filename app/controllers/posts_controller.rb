class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index do |post,index|
      if index % 5 == 0
        post.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end

#  def censor_posts(posts)
#    if posts
#      i = 0
#      posts.each do |post|
#        i += 1
#        post.title = 'SPAM' if i % 5 == 0
#      end
#    end
#   posts
#  end
end
