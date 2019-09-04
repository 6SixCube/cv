# cvmaker

## Step by step

- Clone Github repository
- Install dependencies
- Build the CV 
- View the result


## clone this github repository : 

```bash
git clone https://github.com/6SixCube/cv.git
```

## Install Dependencies

it is necessary to have **git** and **docker** install on your machine.

## build the CV

### Build all

```bash
./scripts/buildcv.sh
```

Buildcv.sh execute both script scripts/convert2pdf.sh and scripts/convert2html.sh.

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
PDF : x-www-browser out/cv_pierre.force.pdf
HTML : x-www-browser out/cv_pierre.force.html
```


## push the docker image on public repository

```bash 
docker tag cvmaker:latest sixc/cvmaker:latest
docker login --username=sixc
docker push sixc/cvmaker:latest
```

## Make your own CV


- Put your tex file, image and all data in folder data/ and launch ./scripts/buildcv.sh.
- The build result of your cv will be in out/ folder.

