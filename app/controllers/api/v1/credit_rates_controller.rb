# frozen_string_literal: true

module Api
  module V1
    class CreditRatesController < ApplicationController
      before_action do
        check_params
      end

      def fixed
        rate = CreditRateCalculationService.call(params, 'Fixed')
        render json: rate
      end

      def decreasing
        rates = CreditRateCalculationService.call(params, 'Decreasing')
        render json: rates
      end

      private

      def check_params
        params.require(%i[amount credit_period annual_equivalent_rate])
      end
    end
  end
end
