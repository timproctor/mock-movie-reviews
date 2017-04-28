module ApplicationHelper
  def page_title
    if user_path(@user) | movie_path(@path)
      "Flix - #{content_for :title}"
    else
      "Flix"
    end
  end
end
