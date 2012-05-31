module ProfanityFilter

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # check_profanity places: [:title, :body, :excerpt]
    require 'sanitize' 
    before_save :check_words

    def check_profanity section
      section[1].each do |p|
        if check_banned_words p
          self.raise_error and return false
        end
      end
    end

    def check_banned_words section
      @word = []
      banned_words = ProfanityFitler::WORDS

      if self.send(section).present?

        content = self.send(section)
        content = Sanitize.clean(content)
        words = content.gsub(/\r\n\t/, "").split

        banned_words.each do |banned_word|
          if words.include?(banned_word)
            @word << word
            return true
          end
        end

      end
      false
    end

    def raise_error
      errors.add(:base, "Profanity found.")
    end

  end
end
