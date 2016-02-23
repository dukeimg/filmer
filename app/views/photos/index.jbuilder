json.array! @all do |p|

  json.(p, :created_at, :updated_at)

  json.id p.id
  json.thumb p.image(:thumb)
  json.original p.image(:original)
end