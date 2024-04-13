# 如果不存在目录 downloads/ 则创建、
if [ ! -d downloads ]; then
    mkdir -p downloads
fi

PROJECT_DIR=$(pwd)

cd $PROJECT_DIR/downloads

# 函数，用于clone指定的仓库
function clone_repo() {
    tdir=$1
    url=$2
    if [ ! -d $tdir ]; then
        git clone $url
    else
        cd $tdir
        git pull
        cd ..
    fi
}

clone_repo "CLIP" "git@github.com:openai/CLIP.git"

cd $PROJECT_DIR

mkdir -p weights
wget -nc -O weights/FastSAM-s.pt -c https://github.com/HenryZhuHR/FastSAM/releases/download/v1.0/FastSAM-s.pt
wget -nc -O weights/FastSAM-x.pt -c https://github.com/HenryZhuHR/FastSAM/releases/download/v1.0/FastSAM-x.pt