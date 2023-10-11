# frozen_string_literal: true

module Api
  module V1
    class CreditRatesController < ApplicationController
      before_action do
        check_params
      end

      def fixed
      end

      def decreasing
      end

      private

      def check_params
        params.require(%i[amount credit_period annual_equivalent_rate])
      end
    end
  end
end
