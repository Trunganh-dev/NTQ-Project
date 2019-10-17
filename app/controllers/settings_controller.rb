class SettingsController < ApplicationController
    layout 'layout_group'
    def index
        @group = Group.find_by(id: params[:group_id])
    end


end
