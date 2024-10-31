import {PrismaClient} from '@prisma/client'
const prisma = new PrismaClient()

async function main(){
    const user = await prisma.user.create({
        data: {
            name: "John",
            email: "john@gmail.com"
        }
    })
    main()
    .catch(e => {console.error(e.message)})
    .finally(async () => {await prisma.$disconnect()})
}
