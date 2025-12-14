FROM gcr.io/dataflow-templates-base/python3-template-launcher-base
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src /template/src
ENV FLEX_TEMPLATE_PYTHON_PY_FILE=/template/src/main.py
ENV FLEX_TEMPLATE_PYTHON_REQUIREMENTS_FILE=/template/requirements.txt
