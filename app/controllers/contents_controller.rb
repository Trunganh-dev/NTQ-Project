class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :set_group
  before_action :authenticate_user!

  layout "layout_group", only: [:new]

  def new
    @content = Content.new
  end

  def edit
    respond_to do |format|
    format.html
    format.js
    end
  end

  def create
   @content = current_user.contents.create(content_params)
   @content.group_id = @group.id
  if @content.save
   flash[:success] = "Content was successfully created"
   redirect_to @group
  else
   render 'new'
  end
 end

  def update
  if @content.update(content_params)
   flash[:success] = "Content was updated"
   redirect_to @group
  else
   flash[:success] = "Content was not updated"
   render 'edit'
  end
end

  def destroy
  @content.destroy
  flash[:success] = "Contetn was deleted"
  redirect_to @group
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def content_params
       params.require(:content).permit(:title, :description, :level, :startDate, :endDate)
    end

end