class Mission::Controller < ApplicationController
  load_and_authorize_resource :mission
end
