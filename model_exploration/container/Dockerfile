# Build an image that can do training and inference in SageMaker
# for serving inferences in a stable way.

FROM python:3.6


COPY "requirements.txt" .
RUN ["pip", "install","-r", "requirements.txt"]

# Set some environment variables. PYTHONUNBUFFERED keeps Python from buffering our standard
# output stream, which means that logs can be delivered to the user quickly. PYTHONDONTWRITEBYTECODE
# keeps Python from writing the .pyc files which are unnecessary in this case. We also update
# PATH so that the train and serve programs are found when the container is invoked.

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"

# Set up the program in the image
COPY algorithms /opt/program
WORKDIR /opt/program
