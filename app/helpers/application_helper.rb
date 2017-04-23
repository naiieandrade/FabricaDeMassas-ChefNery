module ApplicationHelper

	def getImages
		images = []

		images << '/assets/image0.jpg'
		images << '/assets/image1.jpg'
		images << '/assets/image2.jpg'
		images << '/assets/image3.jpg'
		images << '/assets/image4.jpg'
	end

	def getPanelInfo
		info = []

		info << ["Massas Italianas", "Some text", "Veja os Produtos Italianos", "check"]
		info << ["Massas Orientais", "Some text", "Veja os Produtos Orientais", "gift"]
		info << ["Massas Árabes", "Some text", "Veja os Produtos Árabes", "compass"]
	end
end
