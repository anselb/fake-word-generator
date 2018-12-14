json.extract! order_list, :id, :name, :order, :order_array, :created_at, :updated_at
json.url order_list_url(order_list, format: :json)
