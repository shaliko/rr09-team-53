module FriendshipsHelper

  def follow_button(user)
    link_to_remote 'follow', :url => friendships_path(:friend_id => user), :method => :post,  :html => {:class => 'icon follow'}
  end

  def unfollow_button(friendship)
    link_to_remote 'unfollow', :url => friendship_path(friendship), :html => {:class => 'icon unfollow'}, :method => :delete#, :confirm => "Are you shure?"
  end

  def relation_button(user_1, user_2)
    friendship = user_1.friendships.find_by_friend_id(user_2)
    if friendship
      unfollow_button(friendship)
    else
      follow_button(user_2)
    end
  end

end
