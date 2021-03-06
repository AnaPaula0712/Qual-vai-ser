require 'csv'
require "open-uri"

GroupedEvent.destroy_all
Member.destroy_all
Group.destroy_all
User.destroy_all

puts "Criando Usuario"

user11 = URI.open('https://images.unsplash.com/photo-1600273759837-a4d4abb62142?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
user1 = User.create!(
  email: 'maria@email.com',
  nickname: "Maria",
  password: '123456'
)
user1.photo.attach(io: user11, filename: 'photo.png', content_type: 'image/png')

user12 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638966749/Captura_de_Tela_%C3%81rea_de_Sele%C3%A7%C3%A3o_20211208093119_dbphaz.jpg')
user2 = User.create!(
  email: 'paulo@email.com',
  nickname: "Paulo",
  password: '123456'
)
user2.photo.attach(io: user12, filename: 'photo.png', content_type: 'image/png')

file_member1 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883289/Lia_oy1oy6.jpg')
member1 = User.create!(
  email: 'bia_bi@qualvaiser.com',
  nickname: "Bia",
  password: '123456'
)
member1.photo.attach(io: file_member1, filename: 'photo.png', content_type: 'image/png')

file_member2 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883290/Junior_dneaen.png')
member2 = User.create!(
  email: 'junior_jr@qualvaiser.com',
  nickname: "Junior",
  password: '123456'
)
member2.photo.attach(io: file_member2, filename: 'photo.png', content_type: 'image/png')

file_member3 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883290/Victor_Augusto_lhj0uy.png')
member3 = User.create!(
  email: 'victor_vi@qualvaiser.com',
  nickname: "Victor",
  password: '123456'
)
member3.photo.attach(io: file_member3, filename: 'photo.png', content_type: 'image/png')

file_member4 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638907226/bia_adfkpz.jpg')
member4 = User.create!(
  email: 'juliana@qualvaiser.com',
  nickname: "Juju",
  password: '123456'
)
member4.photo.attach(io: file_member4, filename: 'photo.png', content_type: 'image/png')

file_member5 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883290/Tsubasa_fynlzq.png')
member5 = User.create!(
  email: 'tsubasa@qualvaiser.com',
  nickname: "Tsu",
  password: '123456'
)
member5.photo.attach(io: file_member5, filename: 'photo.png', content_type: 'image/png')

file_member6 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883289/Carol_uhzjnx.png')
member6 = User.create!(
  email: 'carolina@qualvaiser.com',
  nickname: "Carol",
  password: '123456'
)
member6.photo.attach(io: file_member6, filename: 'photo.png', content_type: 'image/png')

file_member7 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883289/GIL_ffrbel.jpg')
member7 = User.create!(
  email: 'julio_alves@qualvaiser.com',
  nickname: "Julio",
  password: '123456'
)
member7.photo.attach(io: file_member7, filename: 'photo.png', content_type: 'image/png')

file_member8 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883289/Julia_lseeso.jpg')
member8 = User.create!(
  email: 'julia@qualvaiser.com',
  nickname: "Julinha",
  password: '123456'
)
member8.photo.attach(io: file_member8, filename: 'photo.png', content_type: 'image/png')

file_member9 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883289/Camila_jobh0e.jpg')
member9 = User.create!(
  email: 'camila@qualvaiser.com',
  nickname: "Cah",
  password: '123456'
)
member9.photo.attach(io: file_member9, filename: 'photo.png', content_type: 'image/png')

file_member10 = URI.open('https://res.cloudinary.com/jump-29/image/upload/v1638883289/Ana_paula_h8li4h.png')
member10 = User.create!(
  email: 'ana.paula@qualvaiser.com',
  nickname: "Ana",
  password: '123456'
)
member10.photo.attach(io: file_member10, filename: 'photo.png', content_type: 'image/png')

puts "Criando grupos"

group1 = Group.create!(user: member5, name: "Balada de s??bado")
Member.create!(user: member5, group: group1, adm: true)
Member.create!(user: user2, group: group1)
Member.create!(user: member10, group: group1)
Member.create!(user: member3, group: group1)
Member.create!(user: member2, group: group1)

group2 = Group.create!(user: member3, name: "Carnaval 2022")
Member.create!(user: member3, group: group2, adm: true)
Member.create!(user: member4, group: group2)
Member.create!(user: member10, group: group2)
Member.create!(user: member2, group: group2)
Member.create!(user: member5, group: group2)

# numbers = 0..3
# numbers.each do |i|
#   array_users = User.all
#   user = array_users[i]
#   array_users.slice(i)
#   group = Group.create!(user: user, name: Faker::Team.name)
#   Member.create!(user: user, group: group, adm: true)
#   numbers.each do |j|
#     member = array_users[j]
#     Member.create!(user: member, group: group)
#   end
# end

Event.destroy_all

puts "Criando Evento"

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath1 = 'rev_nordeste_all.csv'

CSV.foreach(filepath1, csv_options) do |row|
  file = URI.open(row[8].split("url('")[1].slice(0...-5))
  event = Event.create!(
    name: row[4],
    address: row[6],
    region: "Nordeste",
    date: row[5],
    price: row[9],
    description: row[7]
  )
  event.photo.attach(io: file, filename: 'photo.png', content_type: 'image/png')
  sleep(1)
end

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath3 = 'rev_sudestebh.csv'

CSV.foreach(filepath3, csv_options) do |row|
  file = URI.open(row[8].split("url('")[1].slice(0...-5))
  event = Event.create!(
    name: row[4],
    address: row[6],
    region: "Sudeste",
    date: row[5],
    price: row[9],
    description: row[7]
  )
  event.photo.attach(io: file, filename: 'photo.png', content_type: 'image/png')
  sleep(1)
end

GroupedEvent.create!(group: Group.first, event: Event.all[0])
GroupedEvent.create!(group: Group.first, event: Event.all[1])
GroupedEvent.create!(group: Group.first, event: Event.all[2])

# Vote.create!(group: Group.first, user: User.first, grouped_event: GroupedEvent.first)
