# Docker-Image based on Ubuntu-Linux for creating LaTeX documents also within a CI/CD pipeline

## In General

LaTeX is a language to typeset documents. One of its main features is that the original document is just a plain text file which can be edited with any text editor. This enables us to have these text files under a version control system like Git. You can easily go back to a previous version with the help of the version control system. Additionally, build pipelines came up. There are some services available on the Internet which even give you free build minutes in their pipeline implementation. So, this LaTeX-Docker-images uses these pipelines to enable an auto-generation of the outcoming PDF file with every check-in to the repository. 

This docker image enables you to use the CI-pipeline provided by GitLab or BitBucket to automatically create a PDF document out of your LaTeX files every time you push them to your Git-repository. 

But you can also use this Docker-Image locally to process LaTeX-files on your local machine.

Additionally there is a _German_ article about using this Docker image at https://www.tornau.name/2019/08/continuous-delivery-pipelines-fuer-latex-dokumente/

## Image is available at Docker Hub

The Docker image is available at Docker Hub at https://hub.docker.com/r/ctornau/latex . Feel free to use it within your projects.

## Build LaTeX-PDF with CI/CD-pipeline on Gitlab

You can use the image the following way on [GitLab](https://www.gitlab.com) by using the file ```.gitlab-ci.yml```:

```yaml
image: ctornau/latex

build:
  stage: build
  artifacts:
    paths:
      - main.pdf
  script:
    - latexmk -pdf main.tex
```

Please follow the link https://gitlab.com/tornau/latex to a sample GitLab project.

## Build LaTeX-PDF with CI/CD-pipeline on BitBucket

If you prefer [BitBucket](https://bitbucket.org) place the following in the file named ```bitbucket-pipelines.yml``` within your repository:

```yaml
image: ctornau/latex

pipelines:
    default:
        - step:
            name: Build and Upload PDF
            script:
                - latexmk -pdf main.tex
                - curl -X POST "https://${BB_AUTH_STRING}@api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads" --form files=@"main.pdf"
            artifacts:
                - main.pdf
```

To have a working BitBucket-pipeline please make sure that the secret variable ```BB_AUTH_STRING``` contains the secret to access the download area of BitBucket. Instructions to do this are placed at https://confluence.atlassian.com/bitbucket/deploy-build-artifacts-to-bitbucket-downloads-872124574.html . 

Please follow the link https://bitbucket.org/tornau/latex to an example BitBucket repository.

## Build LaTeX-PDF with Azure DevOps

The build can also be run on Azure DevOps. Azure DevOps is available at https://dev.azure.com/ . Enjoy.

## Run it locally

Have your LaTeX-files to compile in the following directory ```c:\your\location``` and run the following Docker-command

```docker run -v c:\your\location\:/latex ctornau/latex /bin/sh -c "cd latex && latexmk -pdf main.tex"```

## References

- [Docker](https://www.docker.com)
- [Docker Hub](https://hub.docker.com/)



