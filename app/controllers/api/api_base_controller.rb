class Api::ApiBaseController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  layout false
end
