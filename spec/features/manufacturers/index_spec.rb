require "rails_helper"

RSpec.describe 'the manufacturers index page' do
  it 'displays the manufacturer attributes' do
    manufacturer = Manufacturer.create(name: "Innova", is_american: true, num_pros: 15)
    # [x] done

    # User Story 1, Parent Index 
    
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    visit "/manufacturers"
    # Then I see the name of each parent record in the system
    expect(page).to have_content(manufacturer.name)
  end

  it 'displays children associated with the parent' do
    discraft = Manufacturer.create(name: "Discraft", is_american: true, num_pros: 10)
    buzzz = Disc.create(manufacturer_id:discraft.id, mold_name:"Buzzz", overstable:false, speed:5)
    zone = Disc.create(manufacturer_id:discraft.id, mold_name:"Zone", overstable:true, speed:4)
    # [x] done

    # User Story 5, Parent Children Index 

    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    visit "/manufacturers/#{discraft.id}/discs"
    # Then I see each Child that is associated with that Parent with each Child's attributes
    # (data from each column that is on the child table)
    expect(page).to have_content(buzzz.mold_name)
    expect(page).to have_content(buzzz.overstable)
    expect(page).to have_content(buzzz.speed)
    expect(page).to have_content(zone.mold_name)
    expect(page).to have_content(zone.overstable)
    expect(page).to have_content(zone.speed)
  end

  it "shows parents in order from most recent" do
    innova = Manufacturer.create(name: "Innova", is_american: true, num_pros: 15)

    sleep 2 

    discraft = Manufacturer.create(name: "Discraft", is_american: true, num_pros: 10)
    #   [x] done

    # User Story 6, Parent Index sorted by Most Recently Created 

    # As a visitor
    # When I visit the parent index,
    visit '/manufacturers'
    # I see that records are ordered by most recently created first
    expect(innova.created_at).to be_before(discraft.created_at)
    expect(discraft.name).to appear_before(innova.name)
    # And next to each of the records I see when it was created

  end

  it 'has a link to the parent index' do
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: false, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: false, speed: 5, manufacturer_id: latitude_64.id)
    # [x] done

    # User Story 9, Parent Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    visit "/discs"
    expect(page).to have_link("Manufacturer Index", href: "/manufacturers")
    
    visit "/discs/#{river.id}"
    expect(page).to have_link("Manufacturer Index", href: "/manufacturers")
    
    visit "/manufacturers"
    expect(page).to have_link("Manufacturer Index", href: "/manufacturers")
    
    visit "/manufacturers/#{latitude_64.id}"
    expect(page).to have_link("Manufacturer Index", href: "/manufacturers")
  end
end