require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'class methods' do
    it "should be able to order by title" do
      zombieland = Mission.create(title: "Zombieland", time_in_space: "902")
      bagel = Mission.create(title: "Bagel", time_in_space: "490")

      expected = [bagel, zombieland]

      expect(Mission.order_by_name).to eq(expected)
    end
  end
end
