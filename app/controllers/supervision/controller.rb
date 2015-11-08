class Supervision::Controller < ApplicationController
  load_and_authorize_resource :supervision
end
