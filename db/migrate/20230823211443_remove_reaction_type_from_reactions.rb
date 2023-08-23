class RemoveReactionTypeFromReactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :reactions, :reaction_type, :varchar
  end
end
