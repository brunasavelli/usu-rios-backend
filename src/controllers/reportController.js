const PDFDocument = require("pdfkit");

const userModel = require("../models/userModel");

const exportUserPDF = async (req, res) => {
    try {
        const users = await userModel.getUsers();

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=users.pdf");

        const doc = new PDFDocument();
        doc.pipe(res);

        //Titulo
        doc.fontSize(20).text("Lista de Usuários", { align: "center" });
        doc.moveDown();

        //Cabeçalho
        doc.fontSize(12).text("Id | Nome | Email", {underline: true});
        doc.moveDown(2);

        //Conteúdo
        users.forEach((user) => {
            doc.text(
                `${user.id} | ${user.name} | ${user.email}`
            );
        });

        doc.end();
    } catch (error) {
        res.status(500).json({ message: "Erro ao gerar o PDF"});
    }
}

module.exports = { exportUserPDF };