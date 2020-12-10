class Song < ApplicationRecord
    validates :title, presence: true #=> title has to be a real value
    
    validates :title, uniqueness: {
        scope: %i[release_year artist_name], #=> `%i[]` seems to turn the array items into symbols
        message: 'cannot be repeated by the same artist in the same year' #=> this particular error message must be defined/included in this hash
      }
    validates :artist_name, presence: true

    validates :released, inclusion: { in: [true, false] } #=> :released must be a value of either `true` or `false` (truthy, not strings; therefore %w wouldn't work)
    
    with_options if: :released? do |song| #=> assumes song.released == true ###=> https://guides.rubyonrails.org/active_record_validations.html#grouping-conditional-validations
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Time.now.year #=> `Time` doesn't mandate including a `require 'time'` at top like `Date`/`DateTime` does `require 'date'`
        }
      end

end
