# library(plotly)
# library(rjson)
# 
# json_file <- "https://raw.githubusercontent.com/plotly/plotly.js/master/test/image/mocks/sankey_energy.json"
# json_data <- fromJSON(paste(readLines(json_file), collapse=""))
# 
# p <- plot_ly(
#   type = "sankey",
#   domain = list(
#     x =  c(0,1),
#     y =  c(0,1)
#   ),
#   orientation = "h",
#   valueformat = ".0f",
#   valuesuffix = "TWh",
#   
#   node = list(
#     label = json_data$data[[1]]$node$label,
#     color = json_data$data[[1]]$node$color,
#     pad = 15,
#     thickness = 15,
#     line = list(
#       color = "black",
#       width = 0.5
#     )
#   ),
#   
#   link = list(
#     source = json_data$data[[1]]$link$source,
#     target = json_data$data[[1]]$link$target,
#     value =  json_data$data[[1]]$link$value,
#     label =  json_data$data[[1]]$link$label
#   )
# ) %>% 
#   layout(
#     title = "Energy forecast for 2050<br>Source: Department of Energy & Climate Change, Tom Counsell via <a href='https://bost.ocks.org/mike/sankey/'>Mike Bostock</a>",
#     font = list(
#       size = 10
#     ),
#     xaxis = list(showgrid = F, zeroline = F),
#     yaxis = list(showgrid = F, zeroline = F)
#   )
# p


install.packages("networkD3")
library(networkD3)


URL <- paste0('https://cdn.rawgit.com/christophergandrud/networkD3/',
              'master/JSONdata/energy.json')
energy <- jsonlite::fromJSON(URL)

# Plot
sankeyNetwork(Links = energy$links, Nodes = energy$nodes, Source = 'source',
              Target = 'target', Value = 'value', NodeID = 'name',
              units = 'TWh', fontSize = 12, nodeWidth = 30)

# Colour links
energy$links$energy_type <- sub(' .*', '',
                                energy$nodes[energy$links$source + 1, 'name'])

sankeyNetwork(Links = energy$links, Nodes = energy$nodes, Source = 'source',
              Target = 'target', Value = 'value', NodeID = 'name',
              LinkGroup = 'energy_type', NodeGroup = NULL)


## End(Not run)

