class RenamePassDigestColumnToPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :pass_digest, :password_digest
  end
end
