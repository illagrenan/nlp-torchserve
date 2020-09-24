FROM pytorch/torchserve

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-distutils \
        && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade --upgrade-strategy=eager --no-input --disable-pip-version-check --no-cache-dir \
        pip \
        setuptools \
        wheel

RUN pip3 install --upgrade --upgrade-strategy=eager --no-input --disable-pip-version-check --no-cache-dir \
        torchserve \
        transformers \
        simpletransformers \
        loguru

USER model-server
