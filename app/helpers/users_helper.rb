module UsersHelper
  def pluralize_without_count(count, singlular,  pplural)
    if count != 0
      count == 1 ? "#{singlular}" : "#{plural}"
    end
  end
end
