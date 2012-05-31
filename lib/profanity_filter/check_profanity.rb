module ProfanityFilter

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # check_profanity places: [:title, :body, :excerpt], strength: :strong
    require 'sanitize' 
    before_save :check_words

    def check_profanity section, strength
      section[1].each do |p|
        if check_banned_words p, strength
          self.raise_error and return false
        end
      end
    end

    def check_banned_words section, strength
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
      errors.add(:base, "Profanity found. Program manager has been notified.")
    end

  end
end
