class Idea < ActiveRecord::Base
  attr_accessible :author, :category, :content, :multi_line

  def self.random
    Idea.order("RANDOM()").first
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['content LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
