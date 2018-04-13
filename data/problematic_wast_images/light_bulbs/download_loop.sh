#/bin/bash

# read every line till the document is empty

while read p; do
  wget --tries=2 "$p" -P /Users/leonardschwenk/Documents/ML-TensorflowForPoets/data/problematic_wast_images/light_bulbs/light_blubs_dataset
done <light_bulbs.txt

