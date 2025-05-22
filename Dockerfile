FROM node:18-alpine AS base
# Install Java 17 (requires Alpine 3.18+)
RUN apk add --no-cache openjdk17-jdk
# Set JAVA_HOME (optional but best practice)
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"
# Set working directory
WORKDIR /app
# Copy all files
COPY . .
# Install Node.js dependencies
RUN npm install
# Run tests (optional)
RUN npm run test
# Expose the app port
EXPOSE 8000
# Start the application
CMD ["node", "app.js"]
