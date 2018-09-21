class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, length: {is: 4}, if: :is_released?
  validates :future_year?

  def is_released?
    self.released == true
  end

  def future_year?
    if self.release_year < Date.today.year
      true
    end
  end

end
