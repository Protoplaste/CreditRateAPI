# frozen_string_literal: true

class CreditRateCalculationService
  class << self
    def call(params, type)
      @amount = params[:amount]
      @credit_period = params[:credit_period]
      @annual_equivalent_rate = params[:annual_equivalent_rate]
      @monthly_payments_this_year = 12

      case type
      when 'Fixed'
        calculate_rate
      when 'Decreasing'
        calculate_decreasing_rates
      end
    end

    private

    def calculate_decreasing_rates
      payments_left = @credit_period
      amount_left = @amount
      rates = []

      @credit_period.times do
        rates << calculate_rate(payments_left, amount_left)
        payments_left -= 1
        amount_left -= rates.last
      end
      rates
    end

    def calculate_rate(credit_period = @credit_period, amount = @amount)
      amount * ((1 + (@annual_equivalent_rate / @monthly_payments_this_year))**credit_period) *
        (1 + (@annual_equivalent_rate / @monthly_payments_this_year) - 1) /
        (((1 + (@annual_equivalent_rate / @monthly_payments_this_year))**credit_period) - 1)
    end
  end
end
