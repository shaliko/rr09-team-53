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

    desc "Bootstrap friends"
    task :friends => :environment do
      Friendship.delete_all
      User.all.each do |user|
        friends = User.all(:conditions => ["id !=?", user.id], :limit => rand(User.count))
        friends.each do |friend|
          user.friendships.create(:friend_id => friend.id) if friend != user
        end
      end
    end

    desc "Call all the bootstrap tasks"
    task :all do
      tasks = %w[users friends]
      tasks.each do |task|
        Rake::Task["bootstrap:#{task}"].invoke
      end
    end

  end
