module BankBilletPaymentsHelper
	def barcode_to_png(barcode, id)
		# png = Barby::PngOutputter.new(@barcode)
		png = barcode.to_png
		if(!File.file?('app/assets/images/barcode'+ id.to_s + '.png'))
			File.open('app/assets/images/barcode'+ id.to_s + '.png', 'w:ASCII-8BIT') {|f| f.write png}
		end

		return 'barcode'+ id.to_s + '.png'
	end
end
