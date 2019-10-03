class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @content = Content.all
  end


  def show
  end

  def new
    @content = Content.new
  end


  def edit
  end


  def create
   @content = current_user.contents.create(content_params)
  if @content.save
   flash[:success] = "Content was successfully created"
   redirect_to content_path(@content)
  else
   render 'new'
  end
 end


  def update
  if @content.update(content_params)
   flash[:success] = "Content was updated"
   redirect_to content_path(@content)
  else
   flash[:success] = "Content was not updated"
   render 'edit'
  end
end

  def destroy
  @content.destroy
  flash[:success] = "Contetn was deleted"
  redirect_to contents_path
  end

  private

    def content_params
       params.require(:content).permit(:title, :description, :level, :startDate, :endDate , :user_id)
    end

    def set_content
      @content = Content.find(params[:id])
    end

end
