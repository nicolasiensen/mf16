class SettingsController < ApplicationController
  def edit
    authorize Setting
  end

  def update
    authorize Setting
    Setting.livestream_embed = params[:livestream_embed]
    redirect_to edit_settings_path
  end
end
