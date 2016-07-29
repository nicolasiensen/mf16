class AddWantsToReceiveTasksViaWhatsappToUser < ActiveRecord::Migration
  def change
    add_column :users, :wants_to_receive_tasks_via_whatsapp, :bool
  end
end
