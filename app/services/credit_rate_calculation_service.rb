# frozen_string_literal: true

class CreditRateCalculationService
  class << self
    def call(params, type)
      @amount = params[:amount]
      @credit_period = params[:credit_period]
      @annual_equivalent_rate = params[:annual_equivalent_rate]
      @total_payments_in_year = 12

      case type
      when 'Fixed'
        fixed_rate
      when 'Decreasing'
        decreasing_rates
      end
    end

    private

    def decreasing_rates
      rates = []
      rk = @amount / @credit_period

      @credit_period.times do
        ro = ((@amount - (@credit_period - rates.length) * rk) * @annual_equivalent_rate) / @total_payments_in_year
        rates << (ro + rk).round(2)
      end

      rates
    end

    def fixed_rate
      @amount * ((1 + (@annual_equivalent_rate / @total_payments_in_year))**@credit_period) *
        (1 + (@annual_equivalent_rate / @total_payments_in_year) - 1) /
        (((1 + (@annual_equivalent_rate / @total_payments_in_year))**@credit_period) - 1).round(2)
    end
  end
end
