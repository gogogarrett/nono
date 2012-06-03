require "nono/version"
require "nono/banned_word"

module NoNo

  module ClassMethods
    def check_profanity
      require 'sanitize'
      validate :is_profane?
    end
  end

  module InstanceMethods
    def is_profane?

      self.attributes.values.select{|x| !x.nil? }.each do |c|
        if c.class == String
          if WORDS.include? Sanitize.clean(c).gsub(/\r\n\t/, "").gsub(" ", "")
            errors.add(:base, "Profanity found. This prevented the record from saving.")
            return false
          end
        end
      end
    end
  end

  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end
end

ActiveRecord::Base.send(:include, NoNo)
