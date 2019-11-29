json.extract! contactform, :id, :contactname, :contactemail, :contactmessage, :created_at, :updated_at
json.url contactform_url(contactform, format: :json)
