module ApplicationHelper

	def status_tag(boolean,option={})
		option[:true_text] ||= ''
		option[:false_text] ||= ''
		if boolean
			content_tag(:span,option[:true_text],class:'fa fa-eye')
		else
			content_tag(:span,option[:false_text], class:'fa fa-eye-slash')
		end
		
	end
end
