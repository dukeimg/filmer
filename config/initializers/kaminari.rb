# Conflict between will_paginate and kaminari fix
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end