# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    [
    {
        name: "管理者", belonging: "富山県立大学", email: "steins_sis@yahoo.co.jp", password: "steinsgate", password_confirmation: "steinsgate", admin: true, activated: true, activated_at: Time.now
    },
    {
        name: "生徒", belonging: "富山大学", email: "test@gmail.com", password: "password", password_confirmation: "password", admin: false, activated: true, activated_at: Time.now
    },
    {
        name: "株式会社クスリのアオキ", belonging: "株式会社クスリのアオキ", email: "aoki@gmail.com", password: "kusurinoaoki", password_confirmation: "kusurinoaoki", admin: false, activated: true, activated_at: Time.now
    },
    {
        name: "CCM", belonging: "CCM", email: "ccm@gmail.com", password: "steinsgate", password_confirmation: "steinsgate", admin: false, activated: true, activated_at: Time.now
    },
    {
        name: "株式会社ほげほげ", belonging: "株式会社ほげほげ", email: "hogehoge@gmail.com", password: "steinsgate", password_confirmation: "steinsgate", admin: false, activated: true, activated_at: Time.now
    },
    {
        name: "SYTE", belonging: "SYTE", email: "syte@gmail.com", password: "steinsgate", password_confirmation: "steinsgate", admin: false, activated: true, activated_at: Time.now
    }
    ]
)

Firm.create!( firm_name: "株式会社クスリのアオキ" )

