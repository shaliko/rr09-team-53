  namespace :bootstrap do
    desc "Bootstrap users"
    task :users => :environment do
      User.delete_all
      10.times do
        User.create({
          :username => "username_#{User.count+1}",
          :email    => "user_#{User.count+1}@hashtrain.com",
          :password => "123456",
          :password_confirmation => "123456"
        })
      end
    end

    desc "Call all the bootstrap tasks"
    task :all do
      tasks = %w[users]
      tasks.each do |task|
        Rake::Task["bootstrap:#{task}"].invoke
      end
    end

  end
