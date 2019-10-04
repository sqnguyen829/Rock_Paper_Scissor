User.destroy_all
Status.destroy_all
Scoreboard.destroy_all

u1 = User.create(name: "Tommy")
u2 = User.create(name: "Sam")
u3 = User.create(name: "Jane")
u4 = User.create(name: "Patty")

s1 = Status.create(name: "Egg")
s2 = Status.create(name: "Chicken")
s3 = Status.create(name: "Raptor")
s4 = Status.create(name: "OVERLORD")

Scoreboard.create(user_id: u1.id, status_id: s2.id, streak: 1)
Scoreboard.create(user_id: u2.id, status_id: s3.id, streak: 2)
Scoreboard.create(user_id: u3.id, status_id: s4.id, streak: 0)
Scoreboard.create(user_id: u4.id, status_id: s1.id, streak: 1)


