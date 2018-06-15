class PicsController < ApplicationController
  before_action :current_user_must_be_pic_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_pic_user
    pic = Pic.find(params[:id])

    unless current_user == pic.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @pics = current_user.pics.page(params[:page]).per(10)

    render("pics/index.html.erb")
  end

  def show
    @pic = Pic.find(params[:id])

    render("pics/show.html.erb")
  end

  def new
    @pic = Pic.new

    render("pics/new.html.erb")
  end

  def create
    @pic = Pic.new

    @pic.caption = params[:caption]
    @pic.image = params[:image]
    @pic.user_id = params[:user_id]
    @pic.restaurant_id = params[:restaurant_id]

    save_status = @pic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pics/new", "/create_pic"
        redirect_to("/pics")
      else
        redirect_back(:fallback_location => "/", :notice => "Pic created successfully.")
      end
    else
      render("pics/new.html.erb")
    end
  end

  def edit
    @pic = Pic.find(params[:id])

    render("pics/edit.html.erb")
  end

  def update
    @pic = Pic.find(params[:id])

    @pic.caption = params[:caption]
    @pic.image = params[:image]
    @pic.user_id = params[:user_id]
    @pic.restaurant_id = params[:restaurant_id]

    save_status = @pic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pics/#{@pic.id}/edit", "/update_pic"
        redirect_to("/pics/#{@pic.id}", :notice => "Pic updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pic updated successfully.")
      end
    else
      render("pics/edit.html.erb")
    end
  end

  def destroy
    @pic = Pic.find(params[:id])

    @pic.destroy

    if URI(request.referer).path == "/pics/#{@pic.id}"
      redirect_to("/", :notice => "Pic deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pic deleted.")
    end
  end
end
