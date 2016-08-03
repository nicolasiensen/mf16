class SettingsController < ApplicationController
  def edit
    authorize Setting
  end

  def update
    authorize Setting
    Setting.livestream_embed = params[:livestream_embed]
    Setting.daily_task_description = params[:daily_task_description]
    Setting.daily_task_link = params[:daily_task_link]
    redirect_to edit_settings_path, notice: "Suas alterações foram salvas com sucesso"
  end
end
