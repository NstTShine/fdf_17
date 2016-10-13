module ApplicationHelper

  def full_title page_title = ""
    base_title = t "framgia_food_and_drinks"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
