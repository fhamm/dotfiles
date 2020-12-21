path=$(pwd);
date=$(date +'%Y-%m-%d');
versions_path="${path}/version-control"
versions_file="${versions_path}/${date}.txt"

if [ ! -d $versions_path ]; then
     mkdir -p $versions_path;
     echo "Created folder at ${versions_path}"
fi

foundgit=false

for dir in */; do
    path=$(pwd);
    gitpath="${path}/${dir}.git"
    gitstate=$(git --git-dir=${gitpath} rev-parse --is-inside-work-tree 2>/dev/null)

    if [[ $gitstate == "true" ]]; then
        foundgit=true
        echo $dir >> $versions_file;
        printf "Branch -> " >> $versions_file; 
        git --git-dir=${gitpath} branch --show-current >> $versions_file; 
        git --git-dir=${gitpath} log -1 --format=%cd >> $versions_file;
        git --git-dir=${gitpath} log -1 --pretty=oneline >> $versions_file; 
        echo '-----' >> $versions_file
    fi
done

if $foundgit ; then
    echo "Version log exported to ${versions_file}"
else
    echo "No valid git workdir found. Ignoring..."
fi
