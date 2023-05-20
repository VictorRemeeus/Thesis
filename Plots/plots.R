#graph instructions: https://r-graph-gallery.com/48-grouped-barplot-with-ggplot2
library(ggplot2)

subsets <- read.csv("G:\\Master\\Block 3\\Thesis\\Visuals\\Data visuals\\cleaned_normal_f1.csv", header = TRUE)
subsets

plot <- ggplot(subsets, aes(fill =  feature, y = Average.F1, x=Subset)) + geom_bar(position = "dodge", stat = "identity") 
print(plot + labs(fill = "Feature", y= "Average F1-scores", x = "Subsets")) + geom_text(aes(label = Average.F1, vjust = -5),
                                                                                         position = position_dodge(width = 1),
                                                                                         vjust = -0.5, size = 3 )


normalvs <- read.csv("G:\\Master\\Block 3\\Thesis\\Visuals\\Data visuals\\normal vs selection FINAL.csv", header = TRUE)
normal_selection = ggplot(normalvs, aes(fill =  feature, y = Average.F1, x=Subset)) + geom_bar(position = "dodge", stat = "identity")

                                                                                              
print(normal_selection + labs(fill = "Features", y= "Average F1-scores", x = "Subsets")) +geom_text(aes(label = Average.F1, vjust = -5),
                                                                                                    position = position_dodge(width = 1),
                                                                                                    vjust = -0.5, size = 3 )

imbalanced <- read.csv("G:\\Master\\Block 3\\Thesis\\Visuals\\Data visuals\\Imbalanced.csv", header = TRUE, sep = ";")
imbalanced_plot <- ggplot(imbalanced, aes(fill=Sentiment, x=Genre, y =Reviews)) + 
  geom_bar(position="fill", stat="identity") 
imbalanced_plot

rnorm(12,0,15)
