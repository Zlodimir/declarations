namespace :ds do
  desc 'Drop all declarations which not connected to user'
  task drop_unlinked_declarations: :environment do
    Declaration.where(user_id: nil).delete_all
  end
end
