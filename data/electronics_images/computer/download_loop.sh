#/bin/bash

# read every line till the document is empty

while read p; do
  wget --tries=2 "$p" -P /Users/leonardschwenk/Documents/ML-TensorflowForPoets/data/electronics_images/computer/computer_dataset
done <computer_url_list.txt

