.data
temp_base: .space 32
Math.0: .word 0
os_heap: .word 2048
os_color: .word 0
ram: .space 131072
stack_base: .space 65536

.text
la   sp, stack_base
la   tp, temp_base
la   s4, ram
mv   s2, s4
mv   s3, s4
mv   s0, sp
mv   s1, sp
vm_start:
la   t0, Bootstrap__ret_106
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Sys.init
Bootstrap__ret_106:
j    vm_halt

Game.new:

li   t0, 6
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.new__ret_0
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Memory.alloc
Game.new__ret_0:

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

la   t0, Game.new__ret_1
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Map.new
Game.new__ret_1:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s2)

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.new__ret_2
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.new
Game.new__ret_2:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s2)

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.new__ret_3
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Raycaster.new
Game.new__ret_3:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s2)

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.new__ret_4
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Renderer.new
Game.new__ret_4:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s2)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s2)

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Game.run:
sw   x0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.run__ret_5
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Game.render
Game.run__ret_5:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

Game.run$Game_0:

lw   t0, 20(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.run__skip_0
j    Game.run$Game_1
Game.run__skip_0:

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.run__ret_6
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Game.update
Game.run__ret_6:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.run__skip_1
j    Game.run$Game_3
Game.run__skip_1:

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.run__ret_7
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Game.render
Game.run__ret_7:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

j    Game.run$Game_2

Game.run$Game_3:

Game.run$Game_2:

li   t0, 30
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.run__ret_8
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Sys.wait
Game.run__ret_8:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

j    Game.run$Game_0

Game.run$Game_1:

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Game.update:
sw   x0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

la   t0, Game.update__ret_9
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Keyboard.keyPressed
Game.update__ret_9:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 119
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_2
j    Game.update$Game_5
Game.update__skip_2:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.update__ret_10
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.moveForward
Game.update__ret_10:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

j    Game.update$Game_4

Game.update$Game_5:

Game.update$Game_4:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 115
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_3
j    Game.update$Game_7
Game.update__skip_3:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.update__ret_11
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.moveBackward
Game.update__ret_11:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

j    Game.update$Game_6

Game.update$Game_7:

Game.update$Game_6:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 97
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_4
j    Game.update$Game_9
Game.update__skip_4:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.update__ret_12
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.moveLeft
Game.update__ret_12:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

j    Game.update$Game_8

Game.update$Game_9:

Game.update$Game_8:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 100
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_5
j    Game.update$Game_11
Game.update__skip_5:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.update__ret_13
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.moveRight
Game.update__ret_13:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

j    Game.update$Game_10

Game.update$Game_11:

Game.update$Game_10:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 130
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_6
j    Game.update$Game_13
Game.update__skip_6:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.update__ret_14
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.rotateLeft
Game.update__ret_14:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

j    Game.update$Game_12

Game.update$Game_13:

Game.update$Game_12:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 132
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_7
j    Game.update$Game_15
Game.update__skip_7:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.update__ret_15
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.rotateRight
Game.update__ret_15:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

j    Game.update$Game_14

Game.update$Game_15:

Game.update$Game_14:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 27
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Game.update__skip_8
j    Game.update$Game_17
Game.update__skip_8:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s2)

j    Game.update$Game_16

Game.update$Game_17:

Game.update$Game_16:

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Game.render:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Game.render__ret_16
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Renderer.render
Game.render__ret_16:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Main.main:
sw   x0, 0(sp)
addi sp, sp, 4

la   t0, Main.main__ret_17
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Math.init
Main.main__ret_17:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

la   t0, Main.main__ret_18
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Game.new
Main.main__ret_18:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Main.main__ret_19
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Game.run
Main.main__ret_19:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.new:

li   t0, 5
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Map.new__ret_20
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Memory.alloc
Map.new__ret_20:

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

li   t0, 24
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s2)

li   t0, 24
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s2)

li   t0, 576
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Map.new__ret_21
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Array.new
Map.new__ret_21:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s2)

sw   x0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 3
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 4
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 5
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 6
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 7
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 8
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 9
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 10
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 11
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 12
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 13
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 14
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 15
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 16
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 17
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 18
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 19
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 20
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 21
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 22
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 23
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 24
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 25
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 26
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 27
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 28
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 29
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 30
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 31
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 32
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 33
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 34
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 35
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 36
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 37
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 38
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 39
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 40
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 41
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 42
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 43
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 44
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 45
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 46
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 47
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 48
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 49
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 50
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 51
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 52
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 53
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 54
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 55
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 56
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 57
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 58
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 59
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 60
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 61
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 62
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 63
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 64
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 65
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 66
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 67
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 68
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 69
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 70
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 71
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 72
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 73
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 74
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 75
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 76
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 77
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 78
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 79
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 80
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 81
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 82
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 83
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 84
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 85
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 86
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 87
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 88
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 89
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 90
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 91
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 92
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 93
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 94
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 95
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 96
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 97
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 98
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 99
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 100
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 101
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 102
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 103
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 104
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 105
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 106
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 107
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 108
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 109
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 110
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 111
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 112
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 113
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 114
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 115
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 116
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 117
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 118
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 119
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 120
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 121
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 122
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 123
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 124
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 125
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 126
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 127
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 128
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 129
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 130
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 131
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 132
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 133
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 134
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 135
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 136
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 137
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 138
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 139
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 140
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 141
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 142
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 143
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 144
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 145
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 146
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 147
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 148
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 149
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 150
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 151
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 152
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 153
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 154
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 155
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 156
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 157
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 158
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 159
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 160
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 161
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 162
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 163
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 164
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 165
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 166
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 167
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 168
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 169
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 170
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 171
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 172
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 173
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 174
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 175
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 176
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 177
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 178
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 179
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 180
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 181
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 182
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 183
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 184
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 185
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 186
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 187
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 188
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 189
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 190
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 191
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 192
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 193
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 194
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 195
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 196
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 197
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 198
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 199
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 200
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 201
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 202
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 203
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 204
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 205
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 206
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 207
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 208
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 209
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 210
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 211
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 212
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 213
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 214
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 215
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 216
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 217
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 218
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 219
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 220
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 221
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 222
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 223
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 224
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 225
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 226
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 227
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 228
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 229
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 230
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 231
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 232
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 233
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 234
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 235
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 236
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 237
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 238
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 239
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 240
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 241
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 242
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 243
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 244
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 245
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 246
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 247
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 248
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 249
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 250
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 251
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 252
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 253
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 254
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 257
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 258
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 259
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 260
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 261
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 262
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 263
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 264
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 265
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 266
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 267
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 268
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 269
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 270
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 271
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 272
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 273
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 274
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 275
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 276
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 277
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 278
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 279
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 280
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 281
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 282
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 283
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 284
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 285
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 286
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 287
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 288
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 289
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 290
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 291
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 292
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 293
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 294
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 295
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 296
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 297
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 298
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 299
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 300
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 301
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 302
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 303
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 304
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 305
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 306
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 307
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 308
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 309
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 310
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 311
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 312
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 313
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 314
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 315
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 316
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 317
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 318
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 319
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 320
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 321
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 322
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 323
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 324
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 325
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 326
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 327
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 328
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 329
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 330
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 331
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 332
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 333
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 334
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 335
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 336
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 337
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 338
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 339
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 340
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 341
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 342
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 343
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 344
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 345
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 346
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 347
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 348
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 349
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 350
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 351
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 352
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 353
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 354
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 355
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 356
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 357
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 358
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 359
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 361
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 362
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 363
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 364
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 365
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 366
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 367
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 368
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 369
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 370
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 371
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 372
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 373
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 374
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 375
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 376
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 377
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 378
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 379
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 380
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 381
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 382
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 383
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 384
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 385
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 386
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 387
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 388
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 389
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 390
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 391
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 392
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 393
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 394
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 395
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 396
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 397
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 398
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 399
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 400
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 401
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 402
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 403
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 404
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 405
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 406
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 407
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 408
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 409
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 410
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 411
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 412
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 413
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 414
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 415
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 416
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 417
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 418
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 419
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 420
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 421
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 422
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 423
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 424
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 425
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 426
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 427
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 428
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 429
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 430
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 431
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 432
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 433
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 434
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 435
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 436
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 437
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 438
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 439
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 440
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 441
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 442
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 443
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 444
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 445
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 446
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 447
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 448
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 449
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 450
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 451
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 452
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 453
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 454
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 455
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 456
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 457
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 458
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 459
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 460
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 461
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 462
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 463
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 464
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 465
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 466
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 467
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 468
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 469
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 470
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 471
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 472
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 473
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 474
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 475
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 476
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 477
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 478
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 479
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 480
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 481
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 482
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 483
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 484
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 485
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 486
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 487
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 488
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 489
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 490
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 491
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 492
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 493
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 494
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 495
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 496
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 497
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 498
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 499
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 500
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 501
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 502
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 503
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 504
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 505
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 506
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 507
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 508
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 509
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 510
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 511
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 512
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 513
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 514
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 515
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 516
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 517
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 518
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 519
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 520
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 521
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 522
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 523
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 524
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 525
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 526
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 527
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 528
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 529
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 530
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 531
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 532
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 533
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 534
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 535
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 536
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 537
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 538
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 539
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 540
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 541
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 542
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 543
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 544
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 545
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 546
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 547
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 548
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 549
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 550
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 551
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 552
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 553
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 554
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 555
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 556
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 557
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 558
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 559
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 560
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 561
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 562
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 563
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 564
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 565
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 566
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 567
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 568
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 569
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 570
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 571
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 572
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 573
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 574
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 575
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 6
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s2)

li   t0, 22
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.get:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Map.get__ret_22
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Map.get__ret_22:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(s3)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.isInside:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t1, -4(sp)
lw   t0, -8(sp)
or   t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t1, -4(sp)
lw   t0, -8(sp)
or   t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t1, -4(sp)
lw   t0, -8(sp)
or   t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Map.isInside__skip_9
j    Map.isInside$Map_1
Map.isInside__skip_9:

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Map.isInside$Map_0

Map.isInside$Map_1:

Map.isInside$Map_0:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.isWall:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Map.isWall__ret_23
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -32
mv   s0, sp
j    Map.isInside
Map.isWall__ret_23:

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Map.isWall__skip_10
j    Map.isWall$Map_3
Map.isWall__skip_10:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Map.isWall$Map_2

Map.isWall$Map_3:

Map.isWall$Map_2:

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Map.isWall__ret_24
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -32
mv   s0, sp
j    Map.get
Map.isWall__ret_24:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.getWidth:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.getHeight:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.getPlayerStartX:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Map.getPlayerStartY:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Math.init:

li   t0, 91
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.init__ret_25
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Array.new
Math.init__ret_25:

addi sp, sp, -4
lw   t0, 0(sp)
la   t1, Math.0
sw   t0, 0(t1)

sw   x0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 4
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 9
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 3
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 13
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 4
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 18
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 5
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 22
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 6
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 27
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 7
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 31
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 8
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 36
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 9
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 40
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 10
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 44
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 11
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 49
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 12
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 53
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 13
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 58
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 14
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 62
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 15
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 66
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 16
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 71
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 17
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 75
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 18
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 79
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 19
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 83
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 20
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 88
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 21
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 92
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 22
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 96
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 23
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 100
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 24
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 104
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 25
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 108
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 26
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 112
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 27
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 116
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 28
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 120
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 29
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 124
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 30
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 128
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 31
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 132
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 32
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 136
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 33
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 139
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 34
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 143
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 35
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 147
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 36
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 150
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 37
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 154
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 38
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 158
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 39
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 161
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 40
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 165
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 41
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 168
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 42
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 171
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 43
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 175
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 44
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 178
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 45
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 181
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 46
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 184
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 47
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 187
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 48
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 190
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 49
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 193
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 50
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 196
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 51
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 199
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 52
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 202
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 53
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 204
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 54
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 207
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 55
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 210
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 56
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 212
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 57
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 215
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 58
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 217
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 59
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 219
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 60
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 222
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 61
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 224
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 62
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 226
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 63
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 228
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 64
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 230
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 65
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 232
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 66
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 234
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 67
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 236
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 68
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 237
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 69
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 239
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 70
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 241
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 71
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 242
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 72
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 243
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 73
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 245
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 74
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 246
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 75
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 247
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 76
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 248
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 77
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 249
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 78
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 250
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 79
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 251
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 80
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 252
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 81
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 253
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 82
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 254
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 83
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 254
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 84
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 85
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 86
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 87
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 88
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 89
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

li   t0, 90
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(tp)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s3)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Math.sin:
sw   x0, 0(sp)
sw   x0, 4(sp)
addi sp, sp, 8

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.sin__ret_26
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.mod
Math.sin__ret_26:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s1)

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 90
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.sin__skip_11
j    Math.sin$Math_1
Math.sin__skip_11:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(s3)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Math.sin$Math_0

Math.sin$Math_1:

Math.sin$Math_0:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 180
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.sin__skip_12
j    Math.sin$Math_3
Math.sin__skip_12:

li   t0, 180
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(s3)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Math.sin$Math_2

Math.sin$Math_3:

Math.sin$Math_2:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 270
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.sin__skip_13
j    Math.sin$Math_5
Math.sin__skip_13:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 180
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(s3)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Math.sin$Math_4

Math.sin$Math_5:

Math.sin$Math_4:

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t1, Math.0
lw   t0, 0(t1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s3, s4, t0

lw   t0, 0(s3)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Math.cos:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 90
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t0, Math.cos__ret_27
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.sin
Math.cos__ret_27:

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Math.fixedMul:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedMul__ret_28
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.fixedMul__ret_28:

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedMul__ret_29
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Math.fixedMul__ret_29:

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Math.fixedDiv:
sw   x0, 0(sp)
sw   x0, 4(sp)
sw   x0, 8(sp)
sw   x0, 12(sp)
sw   x0, 16(sp)
sw   x0, 20(sp)
sw   x0, 24(sp)
addi sp, sp, 28

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_14
j    Math.fixedDiv$Math_7
Math.fixedDiv__skip_14:

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Math.fixedDiv$Math_6

Math.fixedDiv$Math_7:

Math.fixedDiv$Math_6:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_15
j    Math.fixedDiv$Math_9
Math.fixedDiv__skip_15:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

j    Math.fixedDiv$Math_8

Math.fixedDiv$Math_9:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

Math.fixedDiv$Math_8:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_16
j    Math.fixedDiv$Math_11
Math.fixedDiv__skip_16:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_17
j    Math.fixedDiv$Math_13
Math.fixedDiv__skip_17:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

j    Math.fixedDiv$Math_12

Math.fixedDiv$Math_13:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

Math.fixedDiv$Math_12:

j    Math.fixedDiv$Math_10

Math.fixedDiv$Math_11:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

Math.fixedDiv$Math_10:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedDiv__ret_30
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Math.fixedDiv__ret_30:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s0)

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedDiv__ret_31
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.fixedDiv__ret_31:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s0)

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

Math.fixedDiv$Math_14:

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 8
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_18
j    Math.fixedDiv$Math_15
Math.fixedDiv__skip_18:

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedDiv__ret_32
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.fixedDiv__ret_32:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_19
j    Math.fixedDiv$Math_17
Math.fixedDiv__skip_19:

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedDiv__ret_33
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.fixedDiv__ret_33:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s0)

j    Math.fixedDiv$Math_16

Math.fixedDiv$Math_17:

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedDiv__ret_34
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.fixedDiv__ret_34:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s0)

Math.fixedDiv$Math_16:

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

j    Math.fixedDiv$Math_14

Math.fixedDiv$Math_15:

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.fixedDiv__ret_35
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.fixedDiv__ret_35:

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.fixedDiv__skip_20
j    Math.fixedDiv$Math_19
Math.fixedDiv__skip_20:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

j    Math.fixedDiv$Math_18

Math.fixedDiv$Math_19:

Math.fixedDiv$Math_18:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Math.mod:
sw   x0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.mod__ret_36
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Math.mod__ret_36:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Math.mod__ret_37
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Math.mod__ret_37:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Math.mod__skip_21
j    Math.mod$Math_21
Math.mod__skip_21:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

j    Math.mod$Math_20

Math.mod$Math_21:

Math.mod$Math_20:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.new:

li   t0, 6
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.new__ret_38
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Memory.alloc
Player.new__ret_38:

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s2)

lw   t0, 20(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.new__ret_39
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Map.getPlayerStartX
Player.new__ret_39:

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.new__ret_40
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Player.new__ret_40:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s2)

lw   t0, 20(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.new__ret_41
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Map.getPlayerStartY
Player.new__ret_41:

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.new__ret_42
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Player.new__ret_42:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s2)

li   t0, 270
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s2)

li   t0, 64
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s2)

li   t0, 10
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.move:
sw   x0, 0(sp)
sw   x0, 4(sp)
sw   x0, 8(sp)
sw   x0, 12(sp)
addi sp, sp, 16

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_43
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.mod
Player.move__ret_43:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s1)

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_44
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.cos
Player.move__ret_44:

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_45
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedMul
Player.move__ret_45:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_46
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.sin
Player.move__ret_46:

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_47
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedMul
Player.move__ret_47:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s0)

lw   t0, 20(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_48
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Player.move__ret_48:

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_49
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Player.move__ret_49:

la   t0, Player.move__ret_50
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -32
mv   s0, sp
j    Map.isWall
Player.move__ret_50:

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Player.move__skip_22
j    Player.move$Player_1
Player.move__skip_22:

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s2)

j    Player.move$Player_0

Player.move$Player_1:

Player.move$Player_0:

lw   t0, 20(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_51
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Player.move__ret_51:

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.move__ret_52
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Player.move__ret_52:

la   t0, Player.move__ret_53
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -32
mv   s0, sp
j    Map.isWall
Player.move__ret_53:

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Player.move__skip_23
j    Player.move$Player_3
Player.move__skip_23:

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s2)

j    Player.move$Player_2

Player.move$Player_3:

Player.move$Player_2:

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.moveForward:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.moveForward__ret_54
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Player.move
Player.moveForward__ret_54:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.moveBackward:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 180
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t0, Player.moveBackward__ret_55
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Player.move
Player.moveBackward__ret_55:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.moveLeft:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 90
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t0, Player.moveLeft__ret_56
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Player.move
Player.moveLeft__ret_56:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.moveRight:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 90
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t0, Player.moveRight__ret_57
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Player.move
Player.moveRight__ret_57:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.rotate:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.rotate__ret_58
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Player.rotate__ret_58:

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s2)

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
or   t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 359
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t1, t0
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Player.rotate__skip_24
j    Player.rotate$Player_5
Player.rotate__skip_24:

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.rotate__ret_59
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Player.rotate__ret_59:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s2)

j    Player.rotate$Player_4

Player.rotate$Player_5:

Player.rotate$Player_4:

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.rotateLeft:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

la   t0, Player.rotateLeft__ret_60
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Player.rotate
Player.rotateLeft__ret_60:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.rotateRight:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Player.rotateRight__ret_61
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Player.rotate
Player.rotateRight__ret_61:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.getXFixed:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.getYFixed:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Player.getAngle:

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Raycaster.new:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.new__ret_62
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Memory.alloc
Raycaster.new__ret_62:

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s2)

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Raycaster.castRay:
sw   x0, 0(sp)
sw   x0, 4(sp)
sw   x0, 8(sp)
sw   x0, 12(sp)
sw   x0, 16(sp)
sw   x0, 20(sp)
sw   x0, 24(sp)
sw   x0, 28(sp)
sw   x0, 32(sp)
sw   x0, 36(sp)
sw   x0, 40(sp)
sw   x0, 44(sp)
sw   x0, 48(sp)
addi sp, sp, 52

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 12(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_63
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.cos
Raycaster.castRay__ret_63:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

lw   t0, 12(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_64
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.sin
Raycaster.castRay__ret_64:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_65
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Raycaster.castRay__ret_65:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_66
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Raycaster.castRay__ret_66:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s0)

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_25
j    Raycaster.castRay$Raycaster_1
Raycaster.castRay__skip_25:

li   t0, 32767
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

j    Raycaster.castRay$Raycaster_0

Raycaster.castRay$Raycaster_1:

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_67
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedDiv
Raycaster.castRay__ret_67:

la   t0, Raycaster.castRay__ret_68
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.abs
Raycaster.castRay__ret_68:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

Raycaster.castRay$Raycaster_0:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_26
j    Raycaster.castRay$Raycaster_3
Raycaster.castRay__skip_26:

li   t0, 32767
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s0)

j    Raycaster.castRay$Raycaster_2

Raycaster.castRay$Raycaster_3:

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_69
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedDiv
Raycaster.castRay__ret_69:

la   t0, Raycaster.castRay__ret_70
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.abs
Raycaster.castRay__ret_70:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s0)

Raycaster.castRay$Raycaster_2:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_27
j    Raycaster.castRay$Raycaster_5
Raycaster.castRay__skip_27:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

li   t0, 32767
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 32(s0)

j    Raycaster.castRay$Raycaster_4

Raycaster.castRay$Raycaster_5:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_28
j    Raycaster.castRay$Raycaster_7
Raycaster.castRay__skip_28:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_71
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Raycaster.castRay__ret_71:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_72
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.abs
Raycaster.castRay__ret_72:

la   t0, Raycaster.castRay__ret_73
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedDiv
Raycaster.castRay__ret_73:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 32(s0)

j    Raycaster.castRay$Raycaster_6

Raycaster.castRay$Raycaster_7:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_74
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Raycaster.castRay__ret_74:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_75
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.abs
Raycaster.castRay__ret_75:

la   t0, Raycaster.castRay__ret_76
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedDiv
Raycaster.castRay__ret_76:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 32(s0)

Raycaster.castRay$Raycaster_6:

Raycaster.castRay$Raycaster_4:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_29
j    Raycaster.castRay$Raycaster_9
Raycaster.castRay__skip_29:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 28(s0)

li   t0, 32767
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 36(s0)

j    Raycaster.castRay$Raycaster_8

Raycaster.castRay$Raycaster_9:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_30
j    Raycaster.castRay$Raycaster_11
Raycaster.castRay__skip_30:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 28(s0)

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_77
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Raycaster.castRay__ret_77:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_78
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.abs
Raycaster.castRay__ret_78:

la   t0, Raycaster.castRay__ret_79
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedDiv
Raycaster.castRay__ret_79:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 36(s0)

j    Raycaster.castRay$Raycaster_10

Raycaster.castRay$Raycaster_11:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 28(s0)

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_80
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Raycaster.castRay__ret_80:

lw   t0, 8(s1)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_81
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Math.abs
Raycaster.castRay__ret_81:

la   t0, Raycaster.castRay__ret_82
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.fixedDiv
Raycaster.castRay__ret_82:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 36(s0)

Raycaster.castRay$Raycaster_10:

Raycaster.castRay$Raycaster_8:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 40(s0)

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 44(s0)

Raycaster.castRay$Raycaster_12:

lw   t0, 40(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_31
j    Raycaster.castRay$Raycaster_13
Raycaster.castRay__skip_31:

lw   t0, 32(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 36(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_32
j    Raycaster.castRay$Raycaster_15
Raycaster.castRay__skip_32:

lw   t0, 32(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 32(s0)

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 44(s0)

j    Raycaster.castRay$Raycaster_14

Raycaster.castRay$Raycaster_15:

lw   t0, 36(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 36(s0)

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 28(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s0)

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 44(s0)

Raycaster.castRay$Raycaster_14:

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Raycaster.castRay__ret_83
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -32
mv   s0, sp
j    Map.isWall
Raycaster.castRay__ret_83:

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_33
j    Raycaster.castRay$Raycaster_17
Raycaster.castRay__skip_33:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 40(s0)

j    Raycaster.castRay$Raycaster_16

Raycaster.castRay$Raycaster_17:

Raycaster.castRay$Raycaster_16:

j    Raycaster.castRay$Raycaster_12

Raycaster.castRay$Raycaster_13:

lw   t0, 44(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sltiu t0, t0, 1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Raycaster.castRay__skip_34
j    Raycaster.castRay$Raycaster_19
Raycaster.castRay__skip_34:

lw   t0, 32(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 48(s0)

j    Raycaster.castRay$Raycaster_18

Raycaster.castRay$Raycaster_19:

lw   t0, 36(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 48(s0)

Raycaster.castRay$Raycaster_18:

lw   t0, 48(s0)
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Renderer.new:

li   t0, 5
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.new__ret_84
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Memory.alloc
Renderer.new__ret_84:

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s2)

li   t0, 64
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s2)

li   t0, 512
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s2)

li   t0, 128
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s2)

lw   t0, 8(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.new__ret_85
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Renderer.new__ret_85:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s2)

sub  t0, s2, s4
srai t0, t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Renderer.render:
sw   x0, 0(sp)
sw   x0, 4(sp)
sw   x0, 8(sp)
sw   x0, 12(sp)
sw   x0, 16(sp)
sw   x0, 20(sp)
sw   x0, 24(sp)
sw   x0, 28(sp)
addi sp, sp, 32

lw   t0, 0(s1)
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
slli t0, t0, 2
add  s2, s4, t0

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

Renderer.render$Renderer_0:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_35
j    Renderer.render$Renderer_1
Renderer.render__skip_35:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_86
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Renderer.render__ret_86:

lw   t0, 12(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_87
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Renderer.render__ret_87:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s2)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_88
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Renderer.render__ret_88:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 8(s0)

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_89
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.getAngle
Renderer.render__ret_89:

lw   t0, 8(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

Renderer.render$Renderer_2:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_36
j    Renderer.render$Renderer_3
Renderer.render__skip_36:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

j    Renderer.render$Renderer_2

Renderer.render$Renderer_3:

Renderer.render$Renderer_4:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_37
j    Renderer.render$Renderer_5
Renderer.render__skip_37:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 360
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 4(s0)

j    Renderer.render$Renderer_4

Renderer.render$Renderer_5:

lw   t0, 0(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_90
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.getXFixed
Renderer.render__ret_90:

lw   t0, 4(s1)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_91
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Player.getYFixed
Renderer.render__ret_91:

lw   t0, 4(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_92
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -36
mv   s0, sp
j    Raycaster.castRay
Renderer.render__ret_92:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s0)

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_38
j    Renderer.render$Renderer_7
Renderer.render__skip_38:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 12(s0)

j    Renderer.render$Renderer_6

Renderer.render$Renderer_7:

Renderer.render$Renderer_6:

li   t0, 25600
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 12(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_93
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Renderer.render__ret_93:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t1, t0
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_39
j    Renderer.render$Renderer_9
Renderer.render__skip_39:

li   t0, 256
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 16(s0)

j    Renderer.render$Renderer_8

Renderer.render$Renderer_9:

Renderer.render$Renderer_8:

li   t0, 128
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_94
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Renderer.render__ret_94:

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

li   t0, 128
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 2
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_95
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.divide
Renderer.render__ret_95:

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 28(s0)

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_40
j    Renderer.render$Renderer_11
Renderer.render__skip_40:

sw   x0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 24(s0)

j    Renderer.render$Renderer_10

Renderer.render$Renderer_11:

Renderer.render$Renderer_10:

lw   t0, 28(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t1, t0
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_41
j    Renderer.render$Renderer_13
Renderer.render__skip_41:

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 28(s0)

j    Renderer.render$Renderer_12

Renderer.render$Renderer_13:

Renderer.render$Renderer_12:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_96
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -28
mv   s0, sp
j    Math.multiply
Renderer.render__ret_96:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 20(s0)

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t1, t0
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_42
j    Renderer.render$Renderer_15
Renderer.render__skip_42:

sw   x0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_97
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Screen.setColor
Renderer.render__ret_97:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

sw   x0, 0(sp)
addi sp, sp, 4

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

la   t0, Renderer.render__ret_98
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -36
mv   s0, sp
j    Screen.drawRectangle
Renderer.render__ret_98:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

j    Renderer.render$Renderer_14

Renderer.render$Renderer_15:

Renderer.render$Renderer_14:

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, -4(sp)
sub  t0, x0, t0
sw   t0, -4(sp)

la   t0, Renderer.render__ret_99
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Screen.setColor
Renderer.render__ret_99:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 24(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 28(s0)
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_100
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -36
mv   s0, sp
j    Screen.drawRectangle
Renderer.render__ret_100:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

lw   t0, 28(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
slt  t0, t0, t1
sub  t0, x0, t0
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, -4(sp)
xori t0, t0, -1
sw   t0, -4(sp)

addi sp, sp, -4
lw   t0, 0(sp)
beqz t0, Renderer.render__skip_43
j    Renderer.render$Renderer_17
Renderer.render__skip_43:

sw   x0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_101
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -24
mv   s0, sp
j    Screen.setColor
Renderer.render__ret_101:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 28(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

lw   t0, 20(s0)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t0, 16(s2)
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
sub  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

li   t0, 255
sw   t0, 0(sp)
addi sp, sp, 4

la   t0, Renderer.render__ret_102
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -36
mv   s0, sp
j    Screen.drawRectangle
Renderer.render__ret_102:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

j    Renderer.render$Renderer_16

Renderer.render$Renderer_17:

Renderer.render$Renderer_16:

lw   t0, 0(s0)
sw   t0, 0(sp)
addi sp, sp, 4

li   t0, 1
sw   t0, 0(sp)
addi sp, sp, 4

lw   t1, -4(sp)
lw   t0, -8(sp)
add  t0, t0, t1
sw   t0, -8(sp)
addi sp, sp, -4

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(s0)

j    Renderer.render$Renderer_0

Renderer.render$Renderer_1:

sw   x0, 0(sp)
addi sp, sp, 4

mv   t0, s0
lw   t1, -20(t0)
lw   t2, -4(sp)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

Sys.init:

la   t0, Sys.init__ret_103
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Screen.clearScreen
Sys.init__ret_103:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

la   t0, Sys.init__ret_104
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Main.main
Sys.init__ret_104:

addi sp, sp, -4
lw   t0, 0(sp)
sw   t0, 0(tp)

la   t0, Sys.init__ret_105
sw   t0, 0(sp)
sw   s0, 4(sp)
sw   s1, 8(sp)
sw   s2, 12(sp)
sw   s3, 16(sp)
addi sp, sp, 20
addi s1, sp, -20
mv   s0, sp
j    Sys.halt
Sys.init__ret_105:

Sys.init$HALT:

j    Sys.init$HALT

# ===== mini SO =====
# return da VM com o valor de retorno em t2
# (jalr explícito: o FPGRARS monta jr t1 errado, ver write_return)
os_return:
mv   t0, s0
lw   t1, -20(t0)
sw   t2, 0(s1)
addi sp, s1, 4
lw   s3, -4(t0)
lw   s2, -8(t0)
lw   s1, -12(t0)
lw   s0, -16(t0)
jalr x0, t1, 0

# Sys.error: imprime ERR<código em a0> e encerra
os_fail:
mv   t3, a0
li   a7, 11
li   a0, 69
ecall
li   a0, 82
ecall
li   a0, 82
ecall
mv   a0, t3
li   a7, 1
ecall
li   a0, 10
li   a7, 11
ecall
li   a0, 1
li   a7, 10
ecall

Array.new:
j    Memory.alloc

Keyboard.keyPressed:
li   t3, 0xFF210000
lbu  t4, 0(t3)
beqz t4, os__key_arrows
lbu  t2, 4(t3)
li   t5, 10
li   t6, 128
beq  t2, t5, os__key_map
li   t5, 8
li   t6, 129
beq  t2, t5, os__key_map
li   t5, 127
li   t6, 139
beq  t2, t5, os__key_map
li   t5, 27
li   t6, 140
beq  t2, t5, os__key_map
j    os__key_end
os__key_map:
mv   t2, t6
j    os__key_end
os__key_arrows:
li   t3, 0xFF200520
lbu  t4, 12(t3)
andi t5, t4, 128
li   t2, 131
bnez t5, os__key_end
lbu  t4, 13(t3)
andi t5, t4, 2
li   t2, 130
bnez t5, os__key_end
andi t5, t4, 4
li   t2, 132
bnez t5, os__key_end
andi t5, t4, 16
li   t2, 133
bnez t5, os__key_end
li   t2, 0
os__key_end:
j    os_return

Math.abs:
lw   t3, 0(s1)
srai t4, t3, 31
xor  t2, t3, t4
sub  t2, t2, t4
j    os_return

Math.divide:
lw   t3, 0(s1)
lw   t4, 4(s1)
li   a0, 3
beqz t4, os_fail
div  t2, t3, t4
j    os_return

Math.multiply:
lw   t3, 0(s1)
lw   t4, 4(s1)
mul  t2, t3, t4
j    os_return

Memory.alloc:
lw   t3, 0(s1)
li   a0, 5
blez t3, os_fail
la   t4, os_heap
lw   t2, 0(t4)
add  t5, t2, t3
li   t6, 16384
li   a0, 6
bgt  t5, t6, os_fail
sw   t5, 0(t4)
j    os_return

Screen.drawRectangle:
lw   t3, 0(s1)
lw   t4, 4(s1)
lw   t5, 8(s1)
lw   t6, 12(s1)
bgez t3, os__rect_x1
li   t3, 0
os__rect_x1:
bgez t4, os__rect_y1
li   t4, 0
os__rect_y1:
li   a0, 511
ble  t5, a0, os__rect_x2
mv   t5, a0
os__rect_x2:
li   a0, 255
ble  t6, a0, os__rect_y2
mv   t6, a0
os__rect_y2:
bgt  t3, t5, os__rect_end
bgt  t4, t6, os__rect_end
la   a0, os_color
lw   a0, 0(a0)
li   a1, 0xFF000000
slli a2, t4, 9
add  a2, a2, a1
os__rect_row:
add  a3, a2, t3
add  a4, a2, t5
os__rect_col:
sb   a0, 0(a3)
addi a3, a3, 1
bleu a3, a4, os__rect_col
addi a2, a2, 512
addi t4, t4, 1
ble  t4, t6, os__rect_row
os__rect_end:
li   t2, 0
j    os_return

Screen.setColor:
lw   t3, 0(s1)
snez t3, t3
addi t3, t3, -1
andi t3, t3, 255
la   t4, os_color
sw   t3, 0(t4)
li   t2, 0
j    os_return

Sys.wait:
lw   a0, 0(s1)
blez a0, os__wait_end
li   a7, 32
ecall
os__wait_end:
li   t2, 0
j    os_return

Screen.clearScreen:
li   t3, 0xFF000000
li   t4, 131072
add  t4, t4, t3
li   t5, -1
os__clear_loop:
sw   t5, 0(t3)
addi t3, t3, 4
bltu t3, t4, os__clear_loop
li   t2, 0
j    os_return

Sys.halt:
li   a0, 0
li   a7, 10
ecall

vm_halt:
li   a0, 0
li   a7, 10
ecall
