class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display(posts)
    posts.each do |post|
      puts "#{post.id} -\nTitle: #{post.title}\nURL: #{post.url}\nVotes: #{post.votes}\n\n"
    end
  end

  def ask_user_for(label)
    puts "Please enter the #{label}"
    gets.chomp
  end

  def ask_user_for_vote
    puts "Please enter the  vote"
    gets.chomp.to_i
  end
end
