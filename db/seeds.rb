# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Section.delete_all
Missions.delete_all
Checkpoint.delete_all
Reference.delete_all
# 手册章节
SECTIONS = [
  "完成課程上的 JD Store 框架",
  "找到队友并且完成组队，顺畅的协作",
  "找到主题，确立⽅向与⻛格",
  "能够完成前后端任务",
  "在⼤赛得到很多票，并取得名次"
]

5.times do |time|
  Section.create!(
  id: time,
  name: SECTIONS[time]
  )
end

CHECKPOINTS = [
  "后台管理员可以管理产品的 CRUD",
  "后台管理员可以针对产品上传图片",
  "顾客可以将产品加入购物⻋",
  "顾客可以显⽰购物⻋明细",
  "顾客可以计算购物⻋内总价",
  "顾客可以删减购物⻋的物品数量",
  "顾客可以针对订单结帐",
  "顾客可以看到⾃⼰所有的订单",
  "顾客可以付款（暂时利⽤ is_paid）",
  "顾客可以在下单之后收到⼀张订单确认信",
  "后台管理员可以将订单进⾏不同的操作，如：已下单，已结帐，已出货，已到货，退货"
]

REFERENCES = [
  {name: "#674", url: "https://fullstack.xinshengdaxue.com/posts/674"},
  {name: "#676", url: "https://fullstack.xinshengdaxue.com/posts/676"},
  {name: "#680", url: "https://fullstack.xinshengdaxue.com/posts/680"},
  {name: "#683", url: "https://fullstack.xinshengdaxue.com/posts/683"},
  {name: "#684", url: "https://fullstack.xinshengdaxue.com/posts/684"},
  {name: "#687", url: "https://fullstack.xinshengdaxue.com/posts/687"},
  {name: "#688", url: "https://fullstack.xinshengdaxue.com/posts/688"},
  {name: "#695", url: "https://fullstack.xinshengdaxue.com/posts/695"},
  {name: "#696", url: "https://fullstack.xinshengdaxue.com/posts/696"},
  {name: "#697", url: "https://fullstack.xinshengdaxue.com/posts/697"},
  {name: "#699", url: "https://fullstack.xinshengdaxue.com/posts/699"},
]

CHECKPOINTS.size.times do |time|
  checkpoint = Checkpoint.create!(
  section_id: 0,
  name: CHECKPOINTS[time]
  )
  REFERENCES[time][:checkpoint_id] = checkpoint.id
  Reference.create!(REFERENCES[time])
end

CHECKPOINTS = [
  "后台管理员可以管理产品的 CRUD",
  "后台管理员可以针对产品上传图片",
  "顾客可以将产品加入购物⻋",
  "顾客可以显⽰购物⻋明细",
  "顾客可以计算购物⻋内总价",
  "顾客可以删减购物⻋的物品数量",
  "顾客可以针对订单结帐",
  "顾客可以看到⾃⼰所有的订单",
  "顾客可以付款（暂时利⽤ is_paid）",
  "顾客可以在下单之后收到⼀张订单确认信",
  "后台管理员可以将订单进⾏不同的操作，如：已下单，已结帐，已出货，已到货，退货"
]

REFERENCES = [
  {name: "#674", url: "https://fullstack.xinshengdaxue.com/posts/674"},
  {name: "#676", url: "https://fullstack.xinshengdaxue.com/posts/676"},
  {name: "#680", url: "https://fullstack.xinshengdaxue.com/posts/680"},
  {name: "#683", url: "https://fullstack.xinshengdaxue.com/posts/683"},
  {name: "#684", url: "https://fullstack.xinshengdaxue.com/posts/684"},
  {name: "#687", url: "https://fullstack.xinshengdaxue.com/posts/687"},
  {name: "#688", url: "https://fullstack.xinshengdaxue.com/posts/688"},
  {name: "#695", url: "https://fullstack.xinshengdaxue.com/posts/695"},
  {name: "#696", url: "https://fullstack.xinshengdaxue.com/posts/696"},
  {name: "#697", url: "https://fullstack.xinshengdaxue.com/posts/697"},
  {name: "#699", url: "https://fullstack.xinshengdaxue.com/posts/699"},
]

CHECKPOINTS.size.times do |time|
  checkpoint = Checkpoint.create!(
  section_id: 0,
  name: CHECKPOINTS[time]
  )
  REFERENCES[time][:checkpoint_id] = checkpoint.id
  Reference.create!(REFERENCES[time])
end
