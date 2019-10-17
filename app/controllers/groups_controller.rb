class GroupsController < ApplicationController
  layout "layout_group", only: [:show]
  before_action :logged_in_user, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @cours    = Course.find_by(id: params[:course_id])
    @running  = Group.running_by_course(params[:course_id])
    @comming  = Group.comming_by_course(params[:course_id])
  end

  def new
  end

  def show
      @group = Group.find_by(id: params[:id])
      @course = Course.find_by(id: @group.course_id)
      @contents = Content.where(group_id: @group.id,status: 1).order("endDate DESC").page(params[:page]).per(5)
  end

  def create
    @course = Course.find_by(name: params[:group][:course_name])
    if !@course.nil?
      @group = Group.new(group_params)
      @group.slug = to_slug(params[:group][:name])
      @group.course_id = @course.id
      @group.save
      if @group.save
        @role = Role.new
        @role.user_id = current_user.id
        @role.group_id = @group.id
        @role.roles = 1
        @role.status = 1
        @role.save
        flash[:success] = "Create new groups successfully"
        redirect_to group_members_path(@group)   
      else
        flash[:danger] = "Create new groups fail. Name not UNIQUE"
        redirect_to root_path
      end
    else 
      @course = Course.create(name: params[:group][:course_name])
      @group = Group.new(group_params)
      @group.slug = to_slug(params[:group][:name])
      @group.course_id = @course.id
      @group.save
      if @group.save
        @role = Role.new
        @role.user_id = current_user.id
        @role.group_id = @group.id
        @role.roles = 1
        @role.status = 1
        @role.save
        flash[:success] = "Create new groups successfully"
        redirect_to group_members_path(@group)   
      else
        flash[:danger] = "Create new groups fail. Name not UNIQUE"
        redirect_to root_path
      end
    end
  end

  def update
    binding.pry
  end
  private
  def group_params
    params.require(:group).permit :name, :decription, :startdate
  end

  def logged_in_user
    unless user_signed_in?
        flash[:danger] = "Please Log In"
        redirect_to root_path
    end
  end

end
