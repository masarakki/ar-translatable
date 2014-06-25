class User < ActiveRecord::Base
  translatable :first_name
  translatable :last_name
end
