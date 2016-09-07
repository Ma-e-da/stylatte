module ApplicationHelper

  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "Stylatte"
    if page_title.empty?
      base_title
    end
  end

  # 現在のユーザーのstylistカラムにt入っていたら、trueを返す
  def stylist?
    current_user(:stylist, true)
  end
  
end
