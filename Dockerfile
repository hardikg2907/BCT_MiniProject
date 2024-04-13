FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install
# RUN npm run build

# Copy the entire project directory to the container
COPY . .

# Expose ports 3000 and 8454
EXPOSE 3000 

# Run npx hardhat node on one terminal
# CMD ["npx", "hardhat", "node"]

# Deploy using hardhat on a second terminal
CMD ["npx", "hardhat", "run", "src/backend/scripts/deploy.js", "--network", "localhost"]

# Command to run the React app
CMD ["npm", "start"]