class Project < ActiveRecord::Base
    belong_to               :portfolio
    has_one                 :project_manager
    has_many                :milestones
    has_many                :deliverables, :through => : milestones
    validates_presence_of   :name, :description
    validates_acceptance_of :non_disclosure_agreement
    validates_uniqueness_of :short_name
end