class AddRecords < ActiveRecord::Migration[6.0]
  def up
    execute <<~SQL
      CREATE TABLE `records` (
        `id` int unsigned NOT NULL AUTO_INCREMENT,
        `signature` varchar(255) NOT NULL,
        `version` int unsigned NOT NULL,
        `created_at` datetime(6) NOT NULL,
        `updated_at` datetime(6) NOT NULL,

        PRIMARY KEY (`id`)
      ) ENGINE=InnoDB;
    SQL
  end

  def down
    execute <<~SQL
      DROP TABLE `records`;
    SQL
  end
end
