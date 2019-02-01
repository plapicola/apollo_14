require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it "should be able to return an average age" do
      tim = Astronaut.create(name: "Tim", age: 29, job: "Commander")
      jim = Astronaut.create(name: "Jim", age: 50, job: "Navigator")

      average_age = (jim.age + tim.age) / 2.0

      expect(Astronaut.average_age).to eq(average_age)
    end

    it "can determine total time in space" do
      jim = Astronaut.create(name: "Tim", age: 29, job: "Commander")
      zombieland = jim.missions.create(title: "Zombieland", time_in_space: "902")
      bagel = jim.missions.create(title: "Bagel", time_in_space: "490")

      expected = zombieland.time_in_space + bagel.time_in_space

      expect(jim.total_time_in_space).to eq(expected)
    end
  end
end
