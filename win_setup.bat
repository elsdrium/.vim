mkdir .\autoload
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile .\autoload\plug.vim"
mkdir %HOMEPATH%\vimfiles
xcopy /E /H * %HOMEPATH%\vimfiles
vim +PlugInstall
