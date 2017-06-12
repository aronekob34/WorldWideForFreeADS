class RunPdf < Prawn::Document
	require "open-uri"

	def initialize(run, ads, options = {})
		super(left_margin: 0, right_margin: 0, bottom_margin: 0, top_margin: 0)	
		@run = run
		@ads = ads
		instructions	
		run_title
	end

	def instructions
		draw_text "Please follow this instructions", :size => 40, :at => [50, 750]
		move_down 100
		text "THIS PAGE WILL NOT HAVE MARGINS, IT IS NORMAL BEHAVIOUR.", :size => 20
		move_down 10		
		text "1. If you are using Mozilla you will need to open the PDF with Adobe otherwise Mozilla will change the layout while printing. The pages are supposed to be full screen flyers images", :size => 20
		move_down 10
		text "2. Print the pages and distribute them around your city. You can post them on walls, trees, light poles, give them to shops..etc.. ", :size => 20
		move_down 10
		text "3. Then come back to the website and click on 'DISTRIBUTED' or on the 'v' simbol in the Print list ", :size => 20
		move_down 10
		text "4. Click again on the 'v' symbol so that the Print Order changes to distributed", :size => 20
		move_down 10
		text "5. Your fliers will be given to other members and they will follow the same procedure, keep printing other fliers by clicking on the print icon of your Campaign and you will get more fliers around the world.", :size => 20
		move_down 10
		text "5. You can also use the app on mobile at growstartups.xyz", :size => 20
		move_down 10
		text "NOTICE !! You can only create one Print Order at the time, if you gave away the fliers set the Print Order in the Print List as completed and you will be able to print new ones", :size => 20
		move_down 10
		text "NOTICE !! If you made a mistake in your Print Order you can edit it with the pen icon or delete it, then create a new one.", :size => 20
	end

	def run_title
		i = 0
		@ads.each do |ad|
			language = ad.run.language
			flyers = ad.company.flyers
			unless flyers.where(:confirmed => true).first == nil || flyers.where(:confirmed => true).first.image.url == nil
				flyer = flyers.where(:language_id => language.id, :confirmed => true).first if flyers.where(:language_id => language.id, :confirmed => true).present?
				flyer = flyers.where(:confirmed => true).first if flyer.nil? || flyer.image.url.nil?
				unless flyer.image.url.nil?
					image open(flyer.image.url), :width => 616
					move_up 144
					language = Language.find(flyer.language_id)
					if language.iso == "WH" || language.iso == "WI"
						text Ad.urlShortner(ad), :size => 20, :color => "000000", :align => :center
					else
						text Ad.urlShortner(ad), :size => 20, :color => "ffffff", :align => :center
					end
					qrcode(ad)
				end
			end
		end
	end

	def qrcode(ad)	
		print_qr_code(Ad.adUrl(ad), :extent=>100, pos: [257, 109])
	end
end