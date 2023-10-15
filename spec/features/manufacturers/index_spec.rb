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

  # [x] done

  # User Story 5, Parent Children Index 

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  #   [x] done

  # User Story 6, Parent Index sorted by Most Recently Created 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

# [ ] done

# User Story 9, Parent Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
end
