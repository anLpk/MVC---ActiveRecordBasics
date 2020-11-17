require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    posts = Post.all
    @view.display(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    post_title = @view.ask_user_for("title")
    post_url = @view.ask_user_for("url")
    post_vote = @view.ask_user_for_vote
    posts = Post.create(title: post_title, url: post_url, votes: post_vote)
    # display_posts
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    p_title = @view.ask_user_for("title")
    posts = Post.find_by(title: p_title)
    new_title = @view.ask_user_for("new title!")
    new_url = @view.ask_user_for("new url")
    posts.update(title: new_title, url: new_url)
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    display_posts
    delete_id = @view.ask_user_for('ID')
    Post.destroy_by(id: delete_id)
    display_posts
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    display_posts
    choosen_id = @view.ask_user_for('ID')
    find = Post.find_by(id: choosen_id)
    find.votes += 1
    find.save
    display_posts
  end

  private

  def display_posts
    posts = Post.all
    @view.display(posts)
  end
end
