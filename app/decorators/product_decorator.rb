module ProductDecorator
    def category_of_product
        "#{category}"
    end

    def category_decorator(category)
        image_tag("/assets/#{category}.png", :size => "40x40")
    end
end