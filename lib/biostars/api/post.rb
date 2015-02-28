module Biostars
  module API
    class Post

      # @return [Fixnum] number of answers.
      attr_reader :answer_count

      # @return [String] author name.
      attr_reader :author

      # @return [Fixnum] author's identifier, a number.
      attr_reader :author_id

      # @return [Fixnum] number of bookmarks.
      attr_reader :book_count

      # @return [Fixnum] number of comments.
      attr_reader :comment_count

      # @return [String] creation date, ISO 8601 format.
      attr_reader :creation_date

      # @return [Boolean] true if the question has an accepted answer, boolean.
      attr_reader :has_accepted

      # @return [Fixnum] identifier of the post, a number.
      attr_reader :id

      # @return [String] date of last edit, ISO 8601 format.
      attr_reader :lastedit_date

      # @return [Fixnum] user who last edited this post.
      attr_reader :lastedit_user_id

      # @return [Fixnum] identifier of the parent post.
      attr_reader :parent_id

      # @return [Fixnum] rank, a number.
      attr_reader :rank

      # @return [Fixnum] number of replies.
      attr_reader :reply_count

      # @return [Fixnum] identifier of the root post.
      attr_reader :root_id

      # @return [String] status message.
      attr_reader :status

      # @return [Fixnum] status' identifier, a number.
      attr_reader :status_id

      # @return [Fixnum] number of subscribers following this post.
      attr_reader :subs_count

      # @return [String] tags.
      attr_reader :tag_val

      # @return [Fixnum] thread's score.
      attr_reader :thread_score

      # @return [String] title.
      attr_reader :title

      # @return [String] type of post.
      attr_reader :type

      # @return [Fixnum] type's identifier for this post.
      attr_reader :type_id

      # @return [String] url.
      attr_reader :url

      # @return [Fixnum] number of views.
      attr_reader :view_count

      # @return [Fixnum] number of votes.
      attr_reader :vote_count

      # @return [String] content.
      attr_reader :xhtml
            def initialize(attributes)
			attributes.each do |k,v| 
				instance_variable_set("@#{k}", v) unless v.nil?
			end
		end
			
			# Finds post with the given id.
			#
			# @param id [Fixnum] post id.
			# @return [Post] returns Post object.
			# @raise [Biostars::PostError] if Post is not found.
	  	def self.find(id)
	  		attributes = Biostars::API.get "post/#{id}"
	  		attributes ? new(attributes) : raise(Biostars::PostError)
	  	end
		end
	end
end
