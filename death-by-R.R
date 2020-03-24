library(grid)

#png(filename="deathR.png")

#function to draw a grid and colour it a passed colour. also pass coordinates
draw_grid <- function(dat, ht=1/10, wt=1/10, vp, colour="lightgrey") {
  grid.rect(x = dat$x,y = dat$y,height = ht, width = wt, hjust = 0,
            vjust = 0,vp = vp, gp=gpar(col=1,fill=colour))  
}

grid.newpage()
#create viewport for the image we have to draw
vp1 <- viewport(x = 0.1, y = 0.1, w = 0.8, h = 0.8, 
                just = c("left", "bottom"), 
                name = "vp1")

#vertical column x-y values
dat <- data.frame(x = rep(0, 1),
                  y = rep(seq(0, 0.9, .1), each = 1))
draw_grid(dat,vp=vp1)

#bottom horizontal x-y values
dat <- data.frame(x = rep(seq(0, 0.6, .1), each = 1),
                  y = rep(0, 1))
draw_grid(dat,vp=vp1)

#top horizontal x-y values
dat <- data.frame(x = rep(seq(0, 0.5, .1), each = 1),
                  y = rep(0.9, 1))
draw_grid(dat,vp=vp1)

#vertical red line
dat <- data.frame(x = rep(0.55, 1),
                  y = rep(seq(0.8, 0.6, -.1), each = 1))
draw_grid(dat, 1/10, 1/20, vp1, "red")

#draw the rotated R
#grid.text doesn't have a rot parameter so used textGrob
gxa = textGrob("R", x = 0.55, y = 0.51, rot = 340, check.overlap = TRUE, 
         gp = gpar(cex=10, fontfamily="mono",lwd = 20), vp = vp1)
grid.draw(gxa)

#dev.off()
