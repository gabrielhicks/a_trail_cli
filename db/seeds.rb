Bio.destroy_all
Character.destroy_all
Skill.destroy_all
Story.destroy_all
User.destroy_all
UserBio.destroy_all
UserSkill.destroy_all
UserStory.destroy_all

bio1 = Bio.create(level: 1, name: "Gabey")
bio2 = Bio.create(level: 2, name: "Gabe")
bio3 =Bio.create(level: 3, name: "Gabriel")

gabey = Character.create(name: "Gabey Hicks")
gabe = Character.create(name: "Gabe Hicks")
gabriel = Character.create(name: "Gabriel Hicks")

