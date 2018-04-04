#/bin/bash

# download every line till the last line of the document

while read p; do
  wget --tries=1 "$p" -P /Users/leonardschwenk/Documents/MachineLearning/data/glass_bottle_images/glass_bottle_dataset
done <glass_bottle_url_list.txt

