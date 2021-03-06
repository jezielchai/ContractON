require 'spec_helper'

describe "postings/edit" do
  before(:each) do
    @posting = assign(:posting, stub_model(Posting,
      :title => "MyString",
      :description => "MyString",
      :requirements => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :salary => "9.99",
      :duration => "MyString"
    ))
  end

  it "renders the edit posting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => postings_path(@posting), :method => "post" do
      assert_select "input#posting_title", :name => "posting[title]"
      assert_select "input#posting_description", :name => "posting[description]"
      assert_select "input#posting_requirements", :name => "posting[requirements]"
      assert_select "input#posting_city", :name => "posting[city]"
      assert_select "input#posting_state", :name => "posting[state]"
      assert_select "input#posting_zipcode", :name => "posting[zipcode]"
      assert_select "input#posting_salary", :name => "posting[salary]"
      assert_select "input#posting_duration", :name => "posting[duration]"
    end
  end
end
