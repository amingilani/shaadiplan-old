json.extract! weddings_guest, :id, :name, :email, :address, :phone, :created_at, :updated_at
json.url weddings_guest_url(weddings_guest, format: :json)