require "rails_helper"

RSpec.describe 'the discs show page' do
  describe '#initialize' do
    #   [ ] done

    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)  
  
  it 'displays the disc mold' do
      disc = Disc.create(manufacturer_id:1, mold_name:"Destroyer", overstable:true, speed:12)
      visit "/discs/#{disc.id}"
      # expect().to eq()
    end

    it 'displays the disc speed' 
  end
end