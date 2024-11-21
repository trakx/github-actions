
changedFiles="src/Trakx.Wallets.Models/Wallets/Wallet.cs src/Trakx.Wallets.Cross/Extensions/MappingRegistrationExtensions.cs src/Trakx.Wallets.Models/Enums/WalletBalanceType.cs src/Trakx.Wallets.Cross/Constants/SecretsConstants.cs"


# set inputs.paths to a new var
inputPaths="./src/Trakx.Wallets.Models"

echo "Checking if any file starts with $inputPaths"

# ensure inputPaths has at least one comma
if [[ $inputPaths != *","* ]]; then
    inputPaths="$inputPaths,"
fi

echo "Splitting paths by comma"

# split the paths by comma
IFS=',' read -ra paths <<< "${inputPaths}"

# split files by space
IFS=' ' read -ra changedFiles <<< "${changedFiles}"

echo "Paths: ${paths[@]}"

hasChanges=false
pathsWithChanges=""

for path in "${paths[@]}"; do
    # ensure path does not start with ./
    if [[ $path == "./"* ]]; then
        path="${path#./}"
    fi

    # ensure path ends with /
    path="${path%/}/"

    # if is root path, should always be true
    if [[ $path == "/" ]]; then
        echo "Root path detected, all files are considered changed"
        pathsWithChanges="$path,$pathsWithChanges"
        hasChanges=true
        break
    fi

    # check if any file starts with the path
    for file in "${changedFiles[@]}"; do
        if [[ $file == "$path"* ]]; then
            echo "Found changes in path $path"
            pathsWithChanges="$path,$pathsWithChanges"
            hasChanges=true
            break
        fi
    done
done
pathsWithChanges=${pathsWithChanges:-1}

echo "finished"
