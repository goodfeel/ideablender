class Idea < ActiveRecord::Base
  attr_accessible :author, :category, :content, :multi_line

  def self.random
    Idea.order("RANDOM()").first
  end
end
