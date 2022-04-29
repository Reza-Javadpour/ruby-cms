class PagesController < ApplicationController

  # layout false
  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(name:'Default')
    @subjects = Subject.order("position ASC")
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:create] = "Page Created Successfuly"
      redirect_to(action:'index')
    else
      @subjects = Subject.order("position ASC")
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order("position ASC")
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = 'Page Updated Successfuly'
      redirect_to(action:'index')
    else
      @subjects = Subject.order("position ASC")
      @page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    # Chon Template nadarim (dar subject) niaz b instance variable nadarim -> @
    page = Page.find(params[:id]).destroy
    flash[:destroy] = "Page Destroy Successfuly"
    redirect_to(action:'index')
  end

  private

  def page_params
    params.require(:page).permit(:name,:position,:permalink,:subject_id,:visible)
  end

end
