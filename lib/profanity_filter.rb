require "profanity_filter/version"
require "profanity_filter/banned_word"

module ProfanityFilter

	def self.included(base)
		base.class_eval {
			require 'sanitize' 
			before_save :check_profanity

			def raise_error
				errors.add(:base, "Profanity found. This prevented the record from saving.")
			end

			def check_profanity
				banned_words = WORDS
				if self.attributes.values.any? {|c| banned_words.include? Sanitize.clean(content).gsub(/\r\n\t/, "") }
					self.raise_error
					return false
				end
			end
		}
	end
end

ActiveRecord::Base.send(:include, ProfanityFilter)
