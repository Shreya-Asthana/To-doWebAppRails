# app/models/todo.rb
class Todo < ApplicationRecord
  belongs_to :category, optional: true
end
