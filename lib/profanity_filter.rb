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
				self.class.column_names.each do |column|
					if check_banned_words column
						self.raise_error
						return false
					end
				end
			end

			def check_banned_words section
				banned_words = WORDS

				if self.send(section).present?

					content = self.send(section)
					content = Sanitize.clean(content)
					words = content.gsub(/\r\n\t/, "").split

					banned_words.each do |banned_word|
						return true if words.include?(banned_word)
					end

				end
				false
			end
		}
	end
end

ActiveRecord::Base.send(:include, ProfanityFilter)
