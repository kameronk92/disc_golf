require "rails_helper"

RSpec.describe "discs index page" do
  it "shows all discs in the database" do
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: false, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: false, speed: 5, manufacturer_id: latitude_64.id)
    # [x] done

    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    visit "/discs"
    # Then I see each Child in the system including the Child's attributes
    # (data from each column that is on the child table)
    expect(page).to have_content(river.mold_name)
    expect(page).to have_content(fuse.mold_name)
    expect(page).to have_content("does it hyzer? #{river.overstable}")
    expect(page).to have_content(fuse.speed)
    expect(page).to have_content(river.speed)
  end

  it "includes a link to the child index" do
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: false, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: false, speed: 5, manufacturer_id: latitude_64.id)
    # [x] done

    # User Story 8, Child Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    visit "/discs"
    expect(page).to have_link("Disc Index", href: "/discs")
    visit "/discs/#{river.id}"
    expect(page).to have_link("Disc Index", href: "/discs")
    visit "/manufacturers"
    expect(page).to have_link("Disc Index", href: "/discs")
    visit "/manufacturers/#{latitude_64.id}"
    expect(page).to have_link("Disc Index", href: "/discs")
  end
end