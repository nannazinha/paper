class Invoice < ApplicationRecord
  belongs_to :user
  has_many :service_quantity

  before_save :calculate_total
  after_save :generate_invoice

  def calculate_total
    total_int = 0
    self.service_quantity.each {|s| total_int += Service.find(s.service_id).price * s.quantity}
    self.total = total_int
  end

  def generate_invoice
    url = URI("https://app.papero.com.br/api/v1/invoices")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Token token=#{ENV['IUGUSANDBOX_API_SECRET']}"
    request.body = "{\n    \"price\": #{self.total},
                     \n    \"notification_url\": \"https://notificationendpoint.com/notify\",
                     \n    \"payer_name\": \"#{self.user.name}\",
                     \n    \"payer_email\": \"#{self.user.email}\",
                     \n    \"payer_cpf_cnpj\": \"#{self.user.cpf}\",
                     \n    \"payer_address_zip_code\": \"#{self.user.zip_code}\",
                     \n    \"payer_address_street\": \"#{self.user.street}\",
                     \n    \"payer_address_number\": \"#{self.user.number}\",
                     \n    \"payer_address_complement\": \"#{self.user.complement}\",
                     \n    \"payer_address_district\": \"#{self.user.district}\",
                     \n    \"payer_address_city\": \"#{self.user.city}\",
                     \n    \"payer_address_state\": \"#{self.user.state}\",
                     \n    \"bank_slip_extra_days\": 1,
                     \n    \"items_description\": \"mensalidade\",
                     \n    \"client_app_invoice_id\": \"#{self.id}\"\n
                   }"
    # request
    response = https.request(request)
    filepath = response.read_body

    invoice_response = JSON.parse(filepath)
    link = invoice_response["url"]
raise
    # mail = UserMailer.with(link).create_manual_invoice
    #  mail.deliver_now
    # redirect_to new_fatura_path
   end
end
