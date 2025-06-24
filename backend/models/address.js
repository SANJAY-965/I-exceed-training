const mongoose = require('mongoose');

const addressSchema = new mongoose.Schema({
  userId:     { type: String, required: true },
  street:     { type: String, required: true },
  landmark:   { type: String },
  city:       { type: String, required: true },
  state:      { type: String, required: true },
  country:    { type: String, required: true },
  pincode:    { type: String, required: true },
  mobile:     { type: String, required: true },
}, { timestamps: true });

module.exports = mongoose.model('Address', addressSchema);
