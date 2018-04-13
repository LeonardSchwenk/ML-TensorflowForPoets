#/bin/bash

# download every line till the last line of the document

while read p; do
wget --tries=2 "$p" -P /Users/leonardschwenk/Documents/MachineLearning/data/plastic_images/plastic_dataset

done <plastic_url_list.txt

