module Biostars
	module API
		class Post

			attr_reader :answer_count, :author, :author_id, :book_count, :comment_count,
				:creation_date, :has_accepted, :id, :lastedit_date, :lastedit_user_id, :parent_id,
				:rank, :reply_count, :root_id, :status, :status_id, :subs_count, :tag_val, 
				:thread_score, :title, :type, :type_id, :url, :view_count, :vote_count, :xhtml

			def initialize(attributes)
				raise Biostars::PostError if attributes.empty? || attributes.nil?

				attributes.each { |k,v| instance_variable_set "@#{k}", v }
			end

		end
	end
end