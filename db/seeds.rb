User.destroy_all
Status.destroy_all
Scoreboard.destroy_all

u1 = User.create(name: "Tom Turner",status: "chicken", choice: "Rock")

s1 = Status.create(name:"Robot One", status: "chicken", choice: "Paper")

Scoreboard.create(user_id: u1.id, status_id: s1.id, streak: 10)


