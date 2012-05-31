require "profanity_filter/version"
require "profanity_filter/check_profanity"

module ProfanityFilter
end

ActiveRecord::Base.send(:include, ProfanityFilter)
