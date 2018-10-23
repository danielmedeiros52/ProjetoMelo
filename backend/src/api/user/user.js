const restful = require('node-restful');
const mongoose = restful.mongoose

const userSchema = new mongoose.Schema({

    name: { type: String, required: true },
    cpf: { type: String, required: true },
    ocupation: { type: String, required: true },
    nasc: { type: Date, default: Date.now },
    horaIni: { type: Date },
    horaFim: { type: Date },
    categoria: [
        {
            description: { type: String, required: true }
        }
    ]
})

module.exports = restful.model('User', userSchema)