require "rails_helper"

RSpec.describe "discs index page" do
  it "shows all discs in the database" do
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: true, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: true, speed: 5, manufacturer_id: latitude_64.id)
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
    river = Disc.create(mold_name: "River", overstable: true, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: true, speed: 5, manufacturer_id: latitude_64.id)
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

  it "only shows records with true booleans" do
    #     [x] done

    # User Story 15, Child Index only shows `true` Records 

    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    visit "/discs"
    expect(page).not_to have_content("false")
  end

  it "can update children from their index" do
    #     [x] done

    # User Story 18, Child Update From Childs Index Page 
    latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)
    river = Disc.create(mold_name: "River", overstable: true, speed: 7, manufacturer_id: latitude_64.id)
    fuse = Disc.create(mold_name: "Fuse", overstable: true, speed: 5, manufacturer_id: latitude_64.id)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    visit '/discs'
    # Next to every child, I see a link to edit that child's info
    expect(page).to have_link("edit disc here", href: "/discs/#{river.id}/edit")
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
  end

  it "discs can be deleted from the index page" do
    #     [x] done

    # User Story 23, Child Delete From Childs Index Page 

    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child
  end
end