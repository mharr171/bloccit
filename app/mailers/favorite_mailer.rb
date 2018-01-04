class FavoriteMailer < ApplicationMailer
  default from: "matt@livefullstack.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, cc: "mharr171.z@gmail.com", subject: "New comment on #{post.title}")
  end
end
