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

  def call
    start
  end

  def start
    multiplicand_range = max_multiplicand > 0 ? (0..max_multiplicand) : (max_multiplicand..0)
    multiplier_range = max_multiplier > 0 ? (0..max_multiplier) : (max_multiplier..0)

    sum = multiplicand_range.reduce(0) do |acc, multiplicand|
      multiplier_range.each do |multiplier|
        result = multiplicand * multiplier
        acc = acc + result
      end
      acc
    end

    self.update(sum: sum)
  end
end