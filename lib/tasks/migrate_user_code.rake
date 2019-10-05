namespace :db do
  desc 'Migrate user code'
  task 'migrate_user_code:setup' => :environment do
    User.all.each do |user|
      user.update_attribute(:code, "C#{user.id.split('-').first}")
    end
  end
end
