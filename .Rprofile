

if(!require("flexdashboard")){
  install.packages("flexdashboard")  
}


# par(family = "AppleGothic")
# theme_set(theme_gray(base_family="AppleGothic"))

setHook(packageEvent("grDevices", "onLoad"),
        function(...){
          if(capabilities("aqua"))
            grDevices::quartzFonts(
              sans =grDevices::quartzFont(rep("AppleGothic",5)),
              serif=grDevices::quartzFont(rep("AppleMyungjo",5)))
          grDevices::pdf.options(family="Korea1")
          grDevices::ps.options(family="Korea1")
        }
)
attach(NULL, name = "KoreaEnv")
assign("familyset_hook",
       function() {
         macfontdevs=c("quartz","quartz_off_screen")
         devname=strsplit(names(dev.cur()),":")[[1L]][1]
         if (capabilities("aqua") &&
             devname %in% macfontdevs)
           par(family="sans")
       },
       pos="KoreaEnv")
setHook("plot.new", get("familyset_hook", pos="KoreaEnv"))
setHook("persp", get("familyset_hook", pos="KoreaEnv"))
options(java.parameters=c("-Xmx8g", "-Dfile.encoding=UTF-8"))

