require 'rails_helper'

describe 'projects/show.html.haml' do
  before do
    project = double()
    project.stub(:name).and_return('Project A')
    assign(:project, project)
  end

  it 'displays project information' do
    render
    assert_select "h1", text: "Project A", count: 1
  end
end
