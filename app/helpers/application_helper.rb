module ApplicationHelper
	def sortable(title, column, direction, page_title)
	    direction = sort_direction == "asc" ? "desc" : "asc"
	    icon = sort_direction == 'desc' ? 'down' : 'up'

	    if page_title == "Cookbook | Home"
		    link_to recipes_path(:sort => column, :direction => direction) do 
		    	#{}"<span class='glyphicon glyphicon-chevron-#{icon}' aria-hidden='true'></span>".html_safe
		    	"#{title.upcase}"
		    end
		else
			link_to category_path(page_title.split("|")[1].strip.downcase, :sort => column, :direction => direction) do 
		    	#{}"<span class='glyphicon glyphicon-chevron-#{icon}' aria-hidden='true'></span>".html_safe
		    	"#{title.upcase}"
		    end
		end
    end
end
