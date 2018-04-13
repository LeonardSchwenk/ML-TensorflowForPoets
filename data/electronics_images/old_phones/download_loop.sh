#/bin/bash

# read every line till the document is empty

while read p; do
  wget --tries=2 "$p" -P /Users/leonardschwenk/Documents/ML-TensorflowForPoets/data/electronics_images/old_phones/old_phones_dataset
done <old_phones_url_list.txt

