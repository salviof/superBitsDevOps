find . -name target -type d -exec rm -rf {} \;

git pull
git add --all
git commit -m "Atualizacao automática"
git push
#chmod +777 * -R
cd devOpsProjetos
git pull

