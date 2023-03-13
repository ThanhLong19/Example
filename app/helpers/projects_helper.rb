module ProjectsHelper
  def link_options_sort
    [["---Choose---", ""],['Name ASC','name asc'],['Name DESC','name desc'],['Owner ASC','owner asc'],['Owner DESC','owner desc'], ['Newest ASC','created_at asc'],['Newest DESC','created_at desc']]
  end
end
