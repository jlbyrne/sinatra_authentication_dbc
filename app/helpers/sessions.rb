enable :sessions

helpers do

  def current_user?
  	if session[:id] != nil 
  	  @current_user = User.find(session[:id])	
  	  return true
  	else
  	  return false
  	end
  end

end
