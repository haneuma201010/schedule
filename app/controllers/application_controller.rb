class ApplicationController < ActionController::Base
  include AdminSessionsHelper
  include SchoolSessionsHelper
  include TeacherSessionsHelper
  include StudentSessionsHelper
end
