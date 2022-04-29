class SubjectsController < ApplicationController

  layout 'admin'

  def index
    # @subjects = Subject.order("position ASC")
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name:'default')
    @subjects_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
     if @subject.save
        flash[:create] = "Subject Created Successfuly."
        redirect_to(action:'index')
     else
        @subjects_count = Subject.count + 1
        render('new')
     end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subjects_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject Updated Successfuly."
      redirect_to(action:'show', id:@subject.id)
    else
      @subjects_count = Subject.count
      render('edit')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    # Chon Template nadarim (dar subject) niaz b instance variable nadarim -> @
    subject = Subject.find(params[:id]).destroy
    flash[:destroy] = "Subject Destroyed Successfuly."
    redirect_to(action:'index')
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
