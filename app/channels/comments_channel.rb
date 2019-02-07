class CommentsChannel < ApplicationCable::Channel
	# server side of the comments controller
  
  def self.broadcast(comment) 
    broadcast_to comment.post, comment:
      CommentsController.render(partial: 'comments/comment', locals: { comment: comment })
      # uses comments controller rendering outside of the comments contoller itself
  end
  
  def subscribed
    # DHH sets up simply for example, 
    # but recommends figure out from url or embedded tag which post you are on, and subscibe people to that post
    

    stream_from Post.last 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
