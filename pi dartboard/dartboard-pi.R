N.n = 100
throws.x = runif(N.n, min=0, max=+1)
throws.y = runif(N.n, min=0, max=+1)
N.not = sum(((throws.x-0.5)**2 + (throws.y-.5)**2) <= 0.5**2)
p = (4*N.not)/N.n

inside.x = throws.x[which(((throws.x-0.5)**2 + (throws.y-.5)**2) <= 0.5**2)]
inside.y = throws.y[which(((throws.x-0.5)**2 + (throws.y-.5)**2) <= 0.5**2)]
outside.x = throws.x[which(((throws.x-0.5)**2 + (throws.y-.5)**2) > 0.5**2)]
outside.y = throws.y[which(((throws.x-0.5)**2 + (throws.y-.5)**2) > 0.5**2)]

vp1 <- viewport(x = 0, y = 0, w = 1, h = 1, 
                just = c("left", "bottom"), 
                name = "vp1")

grid.rect(x = unit(0.5,"npc"), y = unit(0.5,"npc"),
          width = 1, height = 1,
          draw = TRUE, vp = vp1, gp = gpar())
grid.circle(x = unit(0.5,"npc"), y = unit(0.5,"npc"), r=0.5,
            default.units="npc",
            draw = TRUE, vp = vp1, gp = gpar(lty="dotted"))
grid.points(x = unit(inside.x,"npc"),
            y = unit(inside.y,"npc"),
            default.units = "npc",
            pch = 16, size = unit(0.5, "char"),
            name = NULL,
            gp = gpar(col="green"), draw = TRUE, vp = vp1)
grid.points(x = unit(outside.x,"npc"),
            y = unit(outside.y,"npc"),
            default.units = "npc",
            pch = 16, size = unit(0.5, "char"),
            name = NULL,
            gp = gpar(col="red"), draw = TRUE, vp = vp1)
