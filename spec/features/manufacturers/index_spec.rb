require "rails_helper"

RSpec.describe 'the manufacturers index page' do
  # [x] done

  # User Story 1, Parent Index 
  
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'displays the manufacturer name' do
    manufacturer = Manufacturer.create(name: "Innova", is_american: true, num_pros: 15)
    visit "/manufacturers"
  end

  it 'displays the number of pros sponsored by the manufacturer' do

  end

  it 'displays if the manufacturer is in the USA' do

  end

  [ ] done

  # User Story 5, Parent Children Index 

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
end
