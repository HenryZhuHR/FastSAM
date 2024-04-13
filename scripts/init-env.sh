VENV_NAME=fastsam

if [ ! -d downloads/CLIP ]; then
    echo "Run 'bash scripts/get-resource.sh' first to download the CLIP repository."
    exit 1
fi

ENV_DIR=.env

if [ ! -d $ENV_DIR/$VENV_NAME ]; then
    SYS_PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    conda create -p .env/$VENV_NAME -y python=$SYS_PYTHON_VERSION 
else
    echo "Conda environment '$VENV_NAME' already exists."
fi


echo "Activating conda environment '$VENV_NAME'..."

eval "$(conda shell.bash hook)"
conda activate $VENV_NAME

echo "Activated $(python --version) in ($ENV_DIR/$VENV_NAME)"

python3 -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
python3 -m pip install -r requirements.txt


python3 -m pip install -e downloads/CLIP
