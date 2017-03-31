module UsersHelper
  def pluralize_without_count(count, singlular, plural)
    if count != 0
      count == 1 ? "#{singlular}" : "#{plural}"
    end
  end
end
