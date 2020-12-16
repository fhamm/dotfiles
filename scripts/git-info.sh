for dir in */; do
    path=$(pwd);
    gitpath="${path}/${dir}.git"
    gitstate=$(git --git-dir=${gitpath} rev-parse --is-inside-work-tree 2>/dev/null)

    if [[ $gitstate == "true" ]]; then
        echo $dir
        printf "Branch -> "; 
        git --git-dir=${gitpath} branch --show-current; 
        git --git-dir=${gitpath} log -1 --format=%cd
        git --git-dir=${gitpath} log -1 --pretty=oneline; 
        echo '-----'
    fi
done