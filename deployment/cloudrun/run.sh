REGION="asia-southeast1"
PROJECT_ID="poc-beam-capstone"

gcloud run services replace ./deployment/cloudrun/service.yaml --region "$REGION" --project "$PROJECT_ID"
