module Api
  module V1
    class InitialsController < BaseController
    
      skip_before_action :verify_authenticity_token
      # before_action :set_paper_trail_whodunnit

      def index
        render status: :ok, json: "Hii"
      end

      private

      # def set_medical_appointment
      #   medical_appointment = params[:medical_appointment]
      #   @medical_appointment = MedicalAppointment.find_by(
      #     id: medical_appointment[:id],
      #     ec_force_order_id: medical_appointment[:ec_force_order_id],
      #     ec_force_customer_number: medical_appointment[:ec_force_customer_number]
      #   )
      # end

      # def medical_appointment_params
      #   params.require(:medical_appointment)
      #         .permit(
      #           :ec_force_order_id,
      #           :ec_force_category_name,
      #           :ec_force_product_name,
      #           :ec_force_customer_number,
      #           :ec_force_customer_name_full,
      #           :ec_force_customer_name_kana,
      #           :ec_force_customer_birthday,
      #           :ec_force_tel_num_full,
      #           :ec_force_customer_email,
      #           :memo,
      #           :start_date,
      #           :url,
      #         )
      # end

      # def medical_appointment_list_params
      #   params.require(
      #     :medical_appointment
      #   )
      #         .permit(
      #           :from_date
      #         )
      # end
    end
  end
end
