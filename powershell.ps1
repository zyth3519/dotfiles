function ya {
	yarn add $args
}
function yi {
	yarn install
}
function ys {
	yarn serve
}
function yga {
	yarn global add $args
}
function vc {
	vue create $args
}
function er {
	if ($args.count -eq 0) {
		explorer.exe .
	}
 else {
		explorer.exe $args
	}
}
function gcc {
	git add .
	git commit -m \"$agrs\" 
}
function gpc {
	git pull
	gcc
}

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
