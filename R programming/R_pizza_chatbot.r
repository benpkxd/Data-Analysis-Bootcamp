#inspired by datarockie
#0 Database
  #dimension
  Size <- c("Mini","Medium","Mega")
  Top <- c("Hawaii","Italian","Pepperoni")
  Bev <- c("Coke","Tea","Mineral","None")
  Pay <- c("Alipay","Paypal","Cash")
  #Cust_record
  df <- data.frame(
    username = c("Ben","Toy","Rose","Lisa"),
    address = c("97/3 London","226 Manchester","30/9 Hogwart","31 Bristol c.")
  )

#1 variable
  #1.1 q1-q6 : answer in question1-6
    q1<-c() #declare vector
    q2<-c()
    q3<-c()
  #1.2 price
    pr_piz<-0 #topping * size
    pr_bev<-0 #beverage
    pr_overall<-pr_piz+pr_bev
  #1.3 username

#2 sub_function
  #2.1 greeting
    fnc_greeting <- function()
      {
        name <- readLines("stdin",n=1)
        cat("Hi" ,name,"\nThis is a delivery service at Ben's pizza.\n") 
        return(name)
      }
  #2.2 Answer
    fnc_check <- function(choice)
      {
          x <- readLines("stdin",n=1)
          x <- as.numeric(x)
          while(x>choice)
        {
          print("Try again")
          x <- readLines("stdin",n=1)
          x <- as.numeric(x)
        }
          return(x)
      }
  #2.3 Q1
    Question1 <- function()
      {
        cat("\nWhat size of pizza do you need?","\n[Input Number]\n1 Mini \n2.Medium \n3.Mega\n")
        
        q1 <- fnc_check(3)
        return(q1)
      }
  #2.4 Q2
    Question2 <- function()
      {
        cat("\nWhat toppings?","\n[Input Number]\n1 Hawaii \n2.Italian \n3.Pepperoni\n")
  
        q2 <- fnc_check(3)
        return(q2)
      }

  #2.5 Q3
    Question3 <- function()
      {
        cat("\nAny Beverages?","\n[Input Number]\n1 Coke \n2.Tea \n3.Mineral\n4.None\n")

        q3 <- fnc_check(4)
        return(q3)
      }
  #2.6 Q5
    Question5 <- function()
      {
        cat("\nWhich path will you pay?","\n[Input Number]\n1 Alipay \n2.Paypal \n3.Cash\n")
  
        q5 <- fnc_check(3)
        return(q5)
      }
  #2.7 compute pizza price
    comp1 <- function(q1,q2){
      ifelse(q2 == 1, pr_piz<-25*q1,
           ifelse(q2 == 2, pr_piz<-30*q1, pr_piz<-45*q1))
      return(pr_piz)
    }
  #2.8 compute beverage price
    comp2 <- function(q3){
      ifelse(q3==1, pr_bev<-2,
           ifelse(q3==2, pr_bev<-3,
                  ifelse(q3==3, pr_bev<-4, pr_bev<-0)))
      return(pr_bev)
    }


#Operate
  print("Your username?")
  (name<-fnc_greeting())

#Question1-3
i = 1 #i = number of ordering
  q1<-append(q1,Question1())
  
  q2<-append(q2,Question2())
    pr_piz<-comp1(q1[i],q2[i])
  
  q3<-append(q3,Question3())
    pr_bev<-comp2(q3[i])
    
  pr_overall<-pr_piz+pr_bev+pr_overall

#Question4
  cat("\nDo you need anything else?[Yes:1/No:2]\n")
  q4 <- fnc_check(2)
  #if yes
    while(q4==1){
    i = i+1
  q1<-append(q1,Question1())
  
  q2<-append(q2,Question2())
    pr_piz<-comp1(q1[i],q2[i])
  
  q3<-append(q3,Question3())
    pr_bev<-comp2(q3[i])
    
    pr_overall<-pr_piz+pr_bev+pr_overall
    
    cat("\nDo you need anything else?[Yes:1/No:2]\n")
    q4 <- fnc_check(2)
    }

#Question5
  q5<-Question5()
           
#Question6
  #if custom is not existed in df ,we must ask their location
  if(name %in% df[,1])
  {
    j = 1
    while (df[j,1] == name){
        q6 = df[j,2]
        j = j+1
      }  
    cat("\nYour address is",q6,"\n")
  }else{
    cat("\nWhat is your address\n")
    q6 <- readLines("stdin",n=1)
  }

# "Repeat the order"
cat("\n-------------------------------------------"
    ,"\nHere is ordered detail\n  ~Name : ",name)
cat("\n  ~Main")
  for(j in 1:i){
  cat("\n    ",j," Topping : ",Top[q2[j]]," size ",Size[q1[j]])
  }
cat("\n  ~Beverage")
  for(j in 1:i){
    if(Bev[q3[j]]!="None"){
    cat("\n    ",j,"",Bev[q3[j]])
    }}
cat("\n  ~Payment method : ",Pay[q5],
    "\n  ~Total fee : ",pr_overall,
    "\n  ~Address : ",q6)
