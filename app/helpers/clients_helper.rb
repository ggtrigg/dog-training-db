module ClientsHelper
  def inline_address(address)
    [address.street1, address.street2, address.suburb, "#{address.state} #{address.postcode}"].delete_if(&:blank?).join(', ') if address
  end

  def client_details(client)
    [inline_address(@client.address), @client.phonenum_format,
      (mail_to(@client.email_address, nil, class: 'text-info') if @client.email_address.present?)].delete_if(&:blank?).join(' &bull; ').html_safe
  end
end
