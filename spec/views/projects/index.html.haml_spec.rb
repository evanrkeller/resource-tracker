require 'rails_helper'

describe 'projects/index.html.haml' do
  it 'displays a list of all projects' do
    project = double()
    project.stub(:name).and_return('Project A', 'Project B')
    assign(:projects, [project, project])
    render
    assert_select "li", text: "Project A", count: 1
    assert_select "li", text: "Project B", count: 1
  end
end
