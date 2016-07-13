class AddHasSignedDebatePetitionToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_signed_debate_petition, :boolean
  end
end
