class Idea < ActiveRecord::Base
  attr_accessible :author, :category, :content, :multi_line
end
