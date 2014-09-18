namespace :message do
  task :destroy_period => :environment do
    Message.where(created_at: 1.week.ago..Time.now).destroy_all
  end
end
