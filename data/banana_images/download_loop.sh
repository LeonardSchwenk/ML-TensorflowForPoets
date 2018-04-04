#/bin/bash

# download every line till the last line of the document

while read p; do
wget --tries=2 "$p" -P /Users/leonardschwenk/Documents/MachineLearning/data/banana_images/banana_dataset

done <banana_url_list.txt

