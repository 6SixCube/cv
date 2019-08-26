# cvmaker

## push the docker image on public repository

```bash 
docker tag cvmaker:latest sixc/cvmaker:latest
docker login --username=sixc --password-stdin
docker push sixc/cvmaker:latest
```

## build the CV

### Build all

./scripts/buildcv.sh

### PDF

```bash
scripts/convert2pdf.sh
```

### HTML

```bash
scripts/convert2html.sh
```

"WARNING: You have to build the PDF version to build the html one"


