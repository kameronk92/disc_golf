require "rails_helper"

RSpec.describe 'the discs show page' do
  it 'displays the disc attributes' do
    innova = Manufacturer.create(name: "Innova", is_american: true, num_pros: 15)
    disc = Disc.create(manufacturer_id:innova.id, mold_name:"Destroyer", overstable:true, speed:12)
    #   [x] done

    # User Story 4, Child Show 

    # As a visitor
    # When I visit '/child_table_name/:id'
    visit "/discs/#{disc.id}"
    # Then I see the child with that id including the child's attributes
    expect(page).to have_content(disc.mold_name)
    expect(page).to have_content(disc.overstable)
    expect(page).to have_content(disc.speed)
    # (data from each column that is on the child table)
  end

  it 'has a delete button' do
    #     [x] done

    # User Story 20, Child Delete 

    # As a visitor
    # When I visit a child show page
    # Then I see a link to delete the child "Delete Child"
    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child
  end
end