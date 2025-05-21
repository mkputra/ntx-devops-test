# Gunakan image Node.js versi LTS sebagai base image
FROM node:18-alpine

# Set direktori kerja di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependensi aplikasi
RUN npm install

# Salin seluruh kode sumber aplikasi ke dalam container
COPY . .

# Tentukan port yang akan digunakan oleh aplikasi
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["npm", "start"]
