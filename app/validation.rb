# frozen_string_literal: true

require 'dry-validation'
# test class
class NewUserContract < Dry::Validation::Contract
  schema do
    required(:email).value(:string)
    required(:age).value(:integer)
  end
end



