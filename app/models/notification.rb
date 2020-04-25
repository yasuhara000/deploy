class Notification < ApplicationRecord
    default_scope->{order(created_at: :desc)}
    belongs_to :question, optional: true
    belongs_to :answer, optional: true
    belongs_to :valuation, optional: true
    belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
    belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
    belongs_to :e_visiter, class_name: 'Engineer', foreign_key: 'e_visiter_id', optional: true
    belongs_to :e_visited, class_name: 'Engineer', foreign_key: 'e_visited_id', optional: true
end
