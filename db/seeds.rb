User.destroy_all
Status.destroy_all
Scoreboard.destroy_all

u1 = User.create(name: "Tom Turner")

s1 = Status.create(status: "Egg")
s2 = Status.create(status: "Chicken")
s3 = Status.create(status: "Raptor")
s4 = Status.create(status: "OVERLORD")

Scoreboard.create(user_id: u1.id, status_id: s1.id, streak: 10)


