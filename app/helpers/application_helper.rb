module ApplicationHelper
  def full_title(page_title = '')
    base_title = "PHPChimu"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def price_review(price)
    million = price / 1000000
    thousand = (price-price / 1000000*1000000) / 1000
    last_number = price-price / 1000000*1000000-
      (price-price / 1000000*1000000) / 1000*1000
    return million.to_s + "." + thousand.to_s + "." + last_number.to_s
  end
end
