module Biostars
	module API
		class Post

			attr_reader :answer_count, :author, :author_id, :book_count, :comment_count,
				:creation_date, :has_accepted, :id, :lastedit_date, :lastedit_user_id, :parent_id,
				:rank, :reply_count, :root_id, :status, :status_id, :subs_count, :tag_val, 
				:thread_score, :title, :type, :type_id, :url, :view_count, :vote_count, :xhtml

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v 
				end
			end
			
	  	def self.find(id)
	 			response = Biostars::API.getRequest "#{API_URL}/post/#{id}"

				if response.success?
				 new JSON.parse response.body
				else
					raise Biostars::PostError
				end
	  	end
		end
	end
end