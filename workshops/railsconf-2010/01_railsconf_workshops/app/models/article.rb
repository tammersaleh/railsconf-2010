class Article < ActiveRecord::Base
  belongs_to :state
  belongs_to :category

  validates_presence_of :state_id, :category_id

  def flag!
    self.state = State.find_by_name("review")
    save!
  end
end
