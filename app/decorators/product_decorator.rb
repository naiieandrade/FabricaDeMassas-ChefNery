module ProductDecorator
    def category_of_product
        "#{category}"
    end

    def category_decorator(category)
        image_tag("/assets/iconCategory/#{category}.png", :size => "40x40")
    end

    def set_background(category)
        category_css = category.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s.downcase
        link_to image_tag("/assets/backgroundCategory/", class: category_css),{controller: "products" , action: "show_category"}
    end



end