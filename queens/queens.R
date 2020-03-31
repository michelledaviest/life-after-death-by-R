checkdiagonal <- function(mat,pos,inc){
  while(pos[2]>0 & pos[1]<=N & pos[1]>=1 & pos[2]<=N){
    if(mat[pos[1],pos[2]] == 1) return(FALSE)
    pos = pos + inc
  }
  return(TRUE)
}

isvalid <- function(mat,row,col){
  if(mat[row,col]==1) return(FALSE)
  for(j in 1:N){ #check row
    if(mat[row,j]==1) return(FALSE)
  }
  for(i in 1:N){ #check column
    if(mat[i,col]==1) return(FALSE)
  }
  if(checkdiagonal(mat,c(row,col),c(1,1))&
     checkdiagonal(mat,c(row,col),c(-1,-1)) &
     checkdiagonal(mat,c(row,col),c(1,-1))&
     checkdiagonal(mat,c(row,col),c(-1,1)) )
    return(TRUE)
  else return(FALSE)
}

print_list <- function(list){
  for(i in 1:dim(list)[1]){
    for(j in 1:dim(list)[2]){
      cat(list[i,j]," ")
    }
    cat("\n")
  }
}

plot_board <- function(list){
  c = rep(1:0,N/2)
  c = c(c,rep(0:1,N/2))
  board = matrix(rep(c,(N*N)/length(c)),N,N,byrow=TRUE)
  for(row in 1:dim(list)[1]){
    board[list[row,][1],list[row,][2]] = 2
  }
  #print_list(board)
  image(board, col=c("white","black","blue"))
}

nqueens <- function(mat,n,list){
  if(n==0){
    print_list(mat)
    cat("\n")
    plot_board(list)
    #print_list(list)
    return(TRUE)
  }
  else{
    for(i in 1:N){
      for(j in 1:N){
        if(isvalid(mat,i,j)){
          mat[i,j] = 1
          list[N-n+1,] = c(i,j)
          if(nqueens(mat,n-1,list)==TRUE) 
            return(TRUE)
          else{
            mat[i,j] = 0
            list[N-n+1,] = c(0,0)
          }
        }
      }
    }
    return(FALSE)
  }
}

N = 6
matr = matrix(0, nrow=N, ncol=N)
queen_pos = matrix(0, nrow=N, ncol=2)

nqueens(matr,N,queen_pos)

