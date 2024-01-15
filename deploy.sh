# after running 'hugo server' to render updates,
# copy contents to the docs/ folder for gh-pages to read
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

hugo -t hugo-coder

cp -r public/ docs/

# commit
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push


