require 'rails_helper'

describe 'projects/index.html.haml' do
  before do
    project = double()
    project.stub(:name).and_return('Project A', 'Project B')
    project.stub(:id).and_return(3, 4)
    assign(:projects, [project, project])
  end

  it 'displays a list of all projects' do
    render
    assert_select "li", text: "Project A", count: 1
    assert_select "li", text: "Project B", count: 1
  end

  it 'provides a link to the project show page' do
    render
    assert_select "a[href=?]", project_path(3), count: 1
    assert_select "a[href=?]", project_path(4), count: 1
  end
end
