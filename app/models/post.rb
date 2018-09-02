class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbaity


  def is_clickbaity
    if title == nil || word_check == false
      errors.add(:title, "not clickbaity")
    end
  end


  def word_check
    valid_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    valid_words.each do |word|
      if title.include?(word)
        return true
      end
    end
    false
  end
end
