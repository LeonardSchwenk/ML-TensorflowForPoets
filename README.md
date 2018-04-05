### MachineLearning

Download URL lists to download images for /data are alle the image URLS are comming from http://image-net.org/ .

You can start the donwload_loop.sh to start the automatic download for all URLs in the spicific text file. 
--> data is not cleansed we come later to that

####  Take care for the PATH which is set in the download_loop.sh when you want to download the pictures #####

Install tensorflow = https://www.tensorflow.org/install/ 

Set those shell variables as follows:

IMAGE_SIZE=224
ARCHITECTURE="mobilenet_0.50_${IMAGE_SIZE}"

TensorBoard is a monitoring and inspection tool included with tensorflow. You will use it to monitor the training progress.


tensorboard --logdir tf_files/training_summaries &

#### I use Tensorflow for peots to retrain the model and set my own labels and data for the classification ####

git clone https://github.com/googlecodelabs/tensorflow-for-poets-2

python -m scripts.retrain -h # help shows you the man 

copy your datasets in the folder tensorflow-for-poets-2/tf_files 

tf_files/<data set folder name>/ 
                             <image data folders, the folder should be named after the labels you want to give the data later>
                              Example dataset with banana images name the folder banana and the label will also be named banana later


## RETRAIN the the model

python -m scripts.retrain \
--bottleneck_dir=tf_files/bottlenecks \
--how_many_training_steps=500 \
--model_dir=tf_files/models/ \
--summaries_dir=tf_files/training_summaries/"${ARCHITECTURE}" \
--output_graph=tf_files/retrained_graph.pb \
--output_labels=tf_files/retrained_labels.txt \
--architecture="${ARCHITECTURE}" \
--image_dir=tf_files/trash_photos 

--make sure you name the --image_dir after your folder--

#### finaly you can use your model  ####

 python -m scripts.label_image    
 --graph=tf_files/retrained_graph.pb     
 --image=/Users/leonardschwenk/Desktop/glass_bottel.jpg

!! use --image for the path to the image you want to classify !!

## output should look like this 

2018-04-04 16:57:19.535509: I tensorflow/core/platform/cpu_feature_guard.cc:140] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA

Evaluation time (1-image): 0.253s

glass bottle 0.9876863
banana 0.011086713
paper 0.0012269325

#### data cleansing help ####

## delets all files which have 3kb or less (most likely broken)
find . -name "*.jpg" -size -3k -delete

## delets all files who dont have the name jpg
find . -type f  ! -name "*.jpg*"  -delete

## check if its really a jpeg | to many error save them in a file (sometimes its a .jpg file but there is still text in it)
find . -name "*.jpg" -print0 | xargs -0 jpeginfo -c | grep -e WARNING -e ERROR

## remove all files from errors mentioned in the error file 
cat 1.txt | xargs echo rm | sh
