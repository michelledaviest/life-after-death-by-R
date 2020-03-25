library(grid)

#png(filename="deathR.png")

#function to draw a grid and colour it a passed colour. also pass coordinates
draw_grid <- function(dat, ht=1/10, wt=1/10, vp, colour="grey") {
  grid.rect(x = dat$x,y = dat$y,height = ht, width = wt, hjust = 0,
            vjust = 0,vp = vp, gp=gpar(col=1,fill=colour))  
}

grid.newpage()
#create viewport for the image we have to draw
vp1 <- viewport(x = 0.1, y = 0.1, w = 0.8, h = 0.8, 
                just = c("left", "bottom"), 
                name = "vp1")

#vertical column x-y values
grid.rect(x = 0.1, y = 0.5,
          width = 0.1, height = 1,
          draw = TRUE, vp = vp1, gp = gpar(col="grey", fill="grey"))

#bottom horizontal x-y values
grid.rect(x = 0.45, y = 0.045,
          width = 0.6, height = 0.09,
          draw = TRUE, vp = vp1,
          gp = gpar(col="grey",fill="grey"))

#top horizontal x-y values
grid.rect(x = 0.35, y = 0.955,
          width = 0.4, height = 0.09,
          draw = TRUE, vp = vp1,
          gp = gpar(col="grey",fill="grey"))

#vertical red line
grid.rect(x = 0.525, y = 0.76,
          width = 0.05, height = 0.3,
          draw = TRUE, vp = vp1,
          gp = gpar(col="red",fill="red"))


#draw the rotated R
#grid.text doesn't have a rot parameter so used textGrob
gxa = textGrob("R", x = 0.53, y = 0.51, rot = 340, check.overlap = TRUE, 
               gp = gpar(cex=10, fontfamily="mono",lwd = 20), vp = vp1)
grid.draw(gxa)

#dev.off()
