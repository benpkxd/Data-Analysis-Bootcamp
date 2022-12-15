#1. variable
weapon <- c("Rock","Scissor","Paper")
win <- 0
lose <- 0
ans1 <- 0
ans2 <- 0
#2. Sub function
#2.1 fnc.check & change to numeric
fnc_ansncheck <- function(choice){
  x <- as.numeric(readLines("stdin",n=1))
  while(x<=0 | x>choice)
  {
    print("try again")
    x <- as.numeric(readLines("stdin",n=1))
  }
  return(x)
}
#2.2 fnc.battle
fnc_battle <- function(){
  
  Player<-fnc_ansncheck(3)
  Com<-sample(1:3,1)

  cat("\nPlayer ( ",weapon[Player]," ) : ( ",weapon[Com]," ) Com\n")
  
  if(Player == Com){
  cat("draw, please rechoose.\nChoose: ")
    result <- 0
  }else if((Player-Com == -1 & Player < Com) | (Player-Com == 2 & Player > Com)){
    result <- 1
  }else{
    result <- -1
  }
    
  return(result)
}
#2.3 fnc.Result
fnc_result<-function(Win,Lose){
    cat("\nGood Bye Dude!
      Win : ",Win,"
      Lose: ",Lose,"
      Win rate : ",paste(round(Win*100 / (Win+Lose),1),"%"),"\n")
}
#2.4 fnc.interactive
fnc_inter<-function(){
  cat("\nChoose your weapon",
     "\nRock     : press 1",
     "\nScissor  : press 2",
     "\nPaper    : press 3",
     "\nChoose: ")
}
#3.Operate
cat("Welcome to RockScissorPaper Game
     New game : press 1
     End game : press 2\n")

ans1<-fnc_ansncheck(2)
while(ans1 == 1){

fnc_inter()
ans2 <- 0
while(ans2 == 0){
ans2 <- fnc_battle()
}

if(ans2 == 1){win <- win + 1}
if(ans2 == -1){lose <- lose + 1}
  
cat("\nDo you want to continue?
[Yes:1 No:2]
Choose :\n")
ans1<-fnc_ansncheck(2)
}
fnc_result(win,lose)
quit() #to exit game