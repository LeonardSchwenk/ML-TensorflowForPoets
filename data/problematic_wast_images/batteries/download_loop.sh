#/bin/bash

# download every line till the last line of the document

while read p; do
  wget --tries=1 "$p" -P /Users/leonardschwenk/Documents/ML-TensorflowForPoets/data/problematic_wast_images/batteries/batteries_dataset
done <batteries_url_list.txt

