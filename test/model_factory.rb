class Poodle < ActiveRecord::Base
end

Factory.define(:poodle) do |poodle|
  poodle.name "Mister Woofypants"
end