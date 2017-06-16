# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Section.delete_all
Mission.delete_all
Checkpoint.delete_all
Reference.delete_all

unless User.find_by(email: "ppgod@live.cn")
  User.create!(
  email: "ppgod@live.cn",
  password: "12345678",
  is_admin: true
  )
end

DATA = [
  # 第一章节
  {
    name: "完成課程上的 JD-Store 框架", description: "完成課程上的 JD-Store 框架",
    missions: [
      {
        name: "完成 JD-Store 框架", description: "完成 JD-Store 框架",
        checkpoints: [
          {
            name: "后台管理员可以管理产品的 CRUD",
            is_text: false,
            reference: {name: "#674", url: "https://fullstack.xinshengdaxue.com/posts/674"}
          },
          {
            name: "后台管理员可以针对产品上传图片",
            is_text: false,
            reference: {name: "#676", url: "https://fullstack.xinshengdaxue.com/posts/676"}

          },
          {
            name: "顾客可以将产品加入购物⻋",
            is_text: false,
            reference: {name: "#680", url: "https://fullstack.xinshengdaxue.com/posts/680"}
          },
          {
            name: "顾客可以显⽰购物⻋明细",
            is_text: false,
            reference: {name: "#683", url: "https://fullstack.xinshengdaxue.com/posts/683"}
          },
          {
            name: "顾客可以计算购物⻋内总价",
            is_text: false,
            reference: {name: "#684", url: "https://fullstack.xinshengdaxue.com/posts/684"}
          },
          {
            name: "顾客可以删减购物⻋的物品数量",
            is_text: false,
            reference: {name: "#687", url: "https://fullstack.xinshengdaxue.com/posts/687"}
          },
          {
            name: "顾客可以针对订单结帐",
            is_text: false,
            reference: {name: "#688", url: "https://fullstack.xinshengdaxue.com/posts/688"}
          },
          {
            name: "顾客可以看到⾃⼰所有的订单",
            is_text: false,
            reference: {name: "#695", url: "https://fullstack.xinshengdaxue.com/posts/695"}
          },
          {
            name: "顾客可以付款（暂时利⽤ is_paid）",
            is_text: false,
            reference: {name: "#696", url: "https://fullstack.xinshengdaxue.com/posts/696"}
          },
          {
            name: "顾客可以在下单之后收到⼀张订单确认信",
            is_text: false,
            reference: {name: "#697", url: "https://fullstack.xinshengdaxue.com/posts/697"}
          },
          {
            name: "后台管理员可以将订单进⾏不同的操作，如：已下单，已结帐，已出货，已到货，退货",
            is_text: false,
            reference: {name: "#699", url: "https://fullstack.xinshengdaxue.com/posts/699"}
          }
        ]
      }
    ]
  },
  {
    name: "找到队友并且完成组队，顺畅的协作", description: "找到队友并且完成组队，顺畅的协作",
    missions: []
  },
  {
    name: "找到主题，确立⽅向与⻛格", description: "找到主题，确立⽅向与⻛格",
    missions: []
  },
  {
    name: "能够完成前后端任务", description: "能够完成前后端任务",
    missions: []
  },
  {
    name: "在⼤赛得到很多票，并取得名次", description: "在⼤赛得到很多票，并取得名次",
    missions: []
  }
]

DATA.each do |section|
  s = Section.create!(
  name: section[:name],
  description: section[:description]
  )
  if section[:missions]
    section[:missions].each do |mission|
      m = Mission.create!(
      section_id: s.id,
      name: mission[:name],
      description: mission[:description]
      )
      if mission[:checkpoints]
        mission[:checkpoints].each do |checkpoint|
          c = Checkpoint.create!(
          mission_id: m.id,
          name: checkpoint[:name],
          is_text: checkpoint[:is_text]
          )
          r = checkpoint[:reference]
          Reference.create!(
          checkpoint_id: c.id,
          name: r[:name],
          url: r[:url]
          ) if r
        end
      end
    end
  end
end
