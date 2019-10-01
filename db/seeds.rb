User.destroy_all
Opponent.destroy_all
Scoreboard.destroy_all

u1 = User.create(name: "Tom Turner",status: "chicken", choice: "Rock")

o1 = Opponent.create(name:"Robot One", status: "chicken", choice: "Paper")

Scoreboard.create(user_id: u1.id, opponent_id: o1.id, streak: 10)


