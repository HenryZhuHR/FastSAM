MODEL_PATH="./weights/FastSAM-s.pt"
IMAGE_PATH="examples"


# Everything mode
# CUDA_VISIBLE_DEVICES=1 python Inference.py --model_path $MODEL_PATH --img_path $IMAGE_PATH

# Box prompt (xywh)
CUDA_VISIBLE_DEVICES=1 python Inference.py --model_path $MODEL_PATH --img_path $IMAGE_PATH --box_prompt "[[570,200,230,400]]"


# Text prompt
python Inference.py --model_path $MODEL_PATH --img_path $IMAGE_PATH  --text_prompt "the yellow dog"

# Points prompt
python Inference.py --model_path $MODEL_PATH --img_path $IMAGE_PATH  --point_prompt "[[520,360],[620,300]]" --point_label "[1,0]"