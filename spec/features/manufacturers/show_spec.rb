require "rails_helper"

RSpec.describe 'manufacturer show page' do
  it 'shows manufacturer details' do
    # [x] done

    # User Story 2, Parent Show 
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: false, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: false, speed: 5, manufacturer_id: latitude_64.id)
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes
    visit "/manufacturers/#{latitude_64.id}"
    # (data from each column that is on the parent table)
    expect(page).to have_content(latitude_64.name)
    expect(page).to have_content("we are excited to import to the USA")
    expect(page).to have_content(latitude_64.num_pros)
  end

  it "shows a count of its children" do
    # [x] done

    # User Story 7, Parent Child Count
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: false, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: false, speed: 5, manufacturer_id: latitude_64.id)
    # As a visitor
    # When I visit a parent's show page
    visit "/manufacturers/#{latitude_64.id}"
    # I see a count of the number of children associated with this parent
    expect(page).to have_content("2")

  end

  it 'has a link to its children show page' do
    # [x] done

    # User Story 10, Parent Child Index Link
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    visit "/manufacturers/#{latitude_64.id}"
    # Then I see a link to take me to that parent'sude_ `child_table_name` page ('/parents/:id/child_table_name')
    expect(page).to have_link("here", href: "/manufacturers/#{latitude_64.id}/discs")
  end

  it 'can update parent name' do
    #   [ ] done

    # User Story 12, Parent Update 

    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
  end
end