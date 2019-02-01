require 'rails_helper'

describe 'When I visit /astronauts' do
  context 'as a visitor' do
    it "I see a list of all astronauts with their name, age, and job" do
      tim = Astronaut.create(name: "Tim", age: 29, job: "Commander")
      jim = Astronaut.create(name: "Jim", age: 50, job: "Navigator")

      visit astronauts_path

      within("astronaut-<%= tim.id %>") do
        expect(page).to have_content("Name: #{tim.name}")
        expect(page).to have_content("Age: #{tim.age}")
        expect(page).to have_content("Job: #{tim.job}")
        expect(page).to_not have_content("Name: #{jim.name}")
        expect(page).to_not have_content("Age: #{jim.age}")
        expect(page).to_not have_content("Job: #{jim.job}")
      end
      within("astronaut-<%= jim.id %>") do
        expect(page).to have_content("Name: #{jim.name}")
        expect(page).to have_content("Age: #{jim.age}")
        expect(page).to have_content("Job: #{jim.job}")
        expect(page).to_not have_content("Name: #{tim.name}")
        expect(page).to_not have_content("Age: #{tim.age}")
        expect(page).to_not have_content("Job: #{tim.job}")
      end
    end
  end
end
