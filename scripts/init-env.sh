VENV_NAME=fastsam
# CUSTOM_PYTHON_VERSION=3.10 # Uncomment and set to the desired Python version
CUDA_VERSION=11.1

if [ ! -d downloads/CLIP ]; then
    echo "Run 'bash scripts/get-resource.sh' first to download the CLIP repository."
    exit 1
fi

PROJECT_HOME=$(pwd)
ENV_DIR=$PROJECT_HOME/.env

if [ ! -d $ENV_DIR/$VENV_NAME ]; then
    SYS_PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
    if [ -z "$CUSTOM_PYTHON_VERSION" ]; then
        ENV_PYTHON_VERSION=$SYS_PYTHON_VERSION
    else
        ENV_PYTHON_VERSION=$CUSTOM_PYTHON_VERSION
    fi
    conda create -p .env/$VENV_NAME -y python=$ENV_PYTHON_VERSION 
else
    echo "Conda environment '$VENV_NAME' already exists."
fi

ENV_PATH=$ENV_DIR/$VENV_NAME

echo "Activating conda environment '$ENV_PATH'..."
eval "$(conda shell.bash hook)"
conda activate $ENV_PATH
echo "Activated $(python --version) in ($ENV_PATH)"

# CUDA_VERSION
python3 -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
# python3 -m pip install -r requirements.txt

pip check -r requirements.txt

python3 -m pip install -e downloads/CLIP

echo "To activate this environment, use"
echo "    conda activate $ENV_PATH"
echo "To deactivate an active environment, use"
echo "    conda deactivate"
echo "To remove this environment, use"
echo "    conda remove -n $VENV_NAME --all -y"