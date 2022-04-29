class DemoController < ApplicationController
  
  def index
  end

  def about
  	@names = ["reza","Ali","Mohammad","Sajjad"]
  	render('demo/about_us')
  	# redirect_to(:controller => "demo" , :action => "about_us")
  end
  
end
