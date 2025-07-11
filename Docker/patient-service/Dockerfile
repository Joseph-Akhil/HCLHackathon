# ✅ Start from AWS Lambda Node.js base image
FROM public.ecr.aws/lambda/nodejs:18

# Set working directory
WORKDIR /var/task

# Copy and install dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Specify the Lambda handler file and function
CMD ["lambda.handler"]
