module ApplicationHelper
  def title
    if user_path | movie_path
      "Flix - #{content_for :title}"
    else
      "Flix"
    end
  end
end
