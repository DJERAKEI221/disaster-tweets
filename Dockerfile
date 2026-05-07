FROM python:3.11-slim

WORKDIR /workspace

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m spacy download en_core_web_sm

COPY . .
RUN chmod +x docker/start_services.sh

EXPOSE 8000 8501

CMD ["./docker/start_services.sh"]

