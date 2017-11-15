module Admin
  class AdminController < ApplicationController
    layout 'admin'
    include SessionsHelper
  end
end