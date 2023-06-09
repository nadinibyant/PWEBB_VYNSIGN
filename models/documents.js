const {Sequelize, DataTypes } = require('sequelize');
const sequelize = new Sequelize('mysql://root@localhost/dbttd');

const Document = sequelize.define('Document', 
{
    id: {
        type:DataTypes.STRING,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    filename: {
        type: DataTypes.STRING,
        allowNull: false
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false
    },
    created_at: {
        type: DataTypes.DATE
    },
    updated_at: {
        type: DataTypes.DATE
    }
}, 
{
    tableName: 'documents',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at'
});

module.exports = Document