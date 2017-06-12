module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end
	def subtitle(page_subtitle)
		content_for(:subtitle) { page_subtitle }
	end
	def paragraph(page_paragraph)
		content_for(:paragraph) { page_paragraph }
	end

	def header(type, text)
		case type
			when "companies"
				content_for(:companies) { text } 
			when "runs"
				content_for(:runs) { text }
			when "campaigns"
				content_for(:campaigns) { text }
			when "runs#index"
				content_for(:runs_index) { text }				
			when "runs#new"
				content_for(:runs_new) { text }								
			when "runs#status"
				content_for(:runs_status) { text }	
			when "flyers#index"
				content_for(:flyer) { text }							
			when "statistics"
				content_for(:statistics) { text }					
		end
	end
end
