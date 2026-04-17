class Project < ActiveRecord::Base #Définition de la classe Project qui hérite de ActiveRecord::Base
    belong_to               :portfolio #Indique que chaque projet appartient à un portfolio
    has_one                 :project_manager #Indique que chaque projet a un project manager
    has_many                :milestones #Indique que chaque projet peut avoir plusieurs milestones
    has_many                :deliverables, :through => : milestones #Indique que chaque projet peut avoir plusieurs deliverables à travers les milestones
    validates_presence_of   :name, :description #Valide la présence des attributs name et description
    validates_acceptance_of :non_disclosure_agreement #Valide que l'accord de non-divulgation a été accepté
    validates_uniqueness_of :short_name #Valide que le short_name est unique
end #Fin de la classe Project