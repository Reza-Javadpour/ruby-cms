class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(name:'Default')
    @pages = Page.order("position ASC")
    @sections_count = Section.count + 1
  end

  def create
      @section  =Section.new(section_params)
      if @section.save
        flash[:create] = 'Section Created Successfuly.'
        redirect_to(action:'index')
      else
        @pages = Page.order("position ASC")
        @sections_count = Section.count + 1
        render('new')
      end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order("position ASC")
    @sections_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section Updated Successfuly.'
      redirect_to(action:'show',id:@section.id)
    else
      @pages = Page.order("position ASC")
      @sections_count = Section.count
      render('edit')
    end 
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    # Chon Template nadarim (dar subject) niaz b instance variable nadarim -> @
    section = Section.find(params[:id]).destroy
    flash[:destroy] = 'Section Destroyed Successfully.'
    redirect_to(action:'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
  end

end
