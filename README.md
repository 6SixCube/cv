# cvmaker

## Step by step

- Clone Github repository
- Install Debian dependencies
- Build the CV 
- View the result


## clone this github repository : 

```bash
git clone https://github.com/6SixCube/cv.git
```

## Install Debian Buster Dependencies

#### git :

```bash
apt install git
```

#### docker :

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
```

!!! And Restart the User Session !!!


## build the CV

### Build all

```bash
./scripts/buildcv.sh
```
Execute both script : scripts/convert2pdf.sh and scripts/convert2html.sh

### PDF

```bash
scripts/convert2pdf.sh
```

First Time : This Script pull the docker hub image : sixc/cvmaker

### HTML

```bash
scripts/convert2html.sh
```

First Time : This Script pull the docker hub image : bwits/pdf2htmlex 

"WARNING: You have to build the PDF version to build the html one"

## View CV

```bash
PDF : okular out/cv_pierre.force.pdf
HTML : firefox out/cv_pierre.force.html
```


## push the docker image on public repository

```bash 
docker tag cvmaker:latest sixc/cvmaker:latest
docker login --username=sixc
docker push sixc/cvmaker:latest
```

## Make your own CV


- Change the path on : docker/entrupoint.sh 

```
latex_src="data/cv_pierre.force.tex" 
```

- Change the image : 

```
data/pierreforce.jpg
```

- Change the data with your own data in file :

```
data/cv_pierre.force.tex
```

