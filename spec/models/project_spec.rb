require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it ("should belong to a skill") do
    skill = Skill.create({:name => "JavaScript"})
    project = Project.create({:name => "Pig Dice"})
    skill.projects.push(project)
    expect(skill.projects()).to(eq([project]))
  end
end
