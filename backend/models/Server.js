const mongoose = require('mongoose');

const serverSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  host: {
    type: String,
    required: true
  },
  useDomain: {
    type: Boolean,
    default: false
  },
  domain: String,
  apiKey: {
    type: String,
    required: true
  },
  location: {
    country: String,
    city: String,
    coordinates: {
      lat: Number,
      lng: Number
    }
  },
  status: {
    type: String,
    enum: ['active', 'inactive', 'maintenance'],
    default: 'active'
  },
  metrics: {
    totalBandwidth: Number,
    activeUsers: Number,
    cpuUsage: Number,
    memoryUsage: Number
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

module.exports = mongoose.model('Server', serverSchema);
