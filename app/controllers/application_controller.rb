class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  include HomeHelper
  include ApplicationHelper

  before_action :to_parse_path,
                :navbar,
                :navside

  def navbar
    @navbar_nodes=default_traversal([1], @parsed_path)
  end

  def navside
    @navisde_path=[1]<<ApplicationHelper::CONTROLLER_MAP[params[:controller]]
    @navside_nodes=default_traversal(@navisde_path, @parsed_path)
  end

  def to_parse_path
    # node2=[1, 8, 5, 9, 1, 7, 4, 7, 3, 1, 9, 7, 2, 10, 9, 8, 10, 5, 2, 8, 8, 9, 4, 1, 5, 9, 4, 5, 9, 6, 3, 9, 4, 1, 3, 8, 6, 7, 9, 4, 4, 5, 6, 9, 8, 5, 3]
    # parent_id2= [1, 18, 15, 19, 181, 187, 184, 157, 153, 151, 159, 197, 192, 1910, 1819, 1818, 18110, 1875, 1872, 1878, 1848, 1849, 1844, 1841, 1575, 1579, 1574, 1535, 1539, 1536, 1513, 1519, 1514, 1591, 1593, 1598, 1596, 1977, 1979, 1974, 1924, 1925, 1926, 19109, 19108, 19105, 19103]
    @parsed_path=path_parse(current_user.node, current_user.path)
  end

end