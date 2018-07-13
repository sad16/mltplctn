class Multiplication < ApplicationRecord
  validates :max_multiplicand,
            :max_multiplier,
            presence: true

  validates :max_multiplicand,
            :max_multiplier,
            numericality: { 
              only_integer: true,
              greater_than: -11,
              less_than: 11
            }
end