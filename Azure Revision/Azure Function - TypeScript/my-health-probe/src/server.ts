// Import Function, Create new instance of HealthCheck Function, and Export Function Entry Point

import { AzureFunction, Context, HttpRequest } from "@azure/functions";
import AzFunctionHealthCheck from "./functionHandlers/AzFunctionHealthCheck";
import AzFunctionHelloWorld from "./functionHandlers/AzFunctionHelloWorld";

// const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
//   await AzFunctionHealthCheck(context);
// };

const azFunctionHealthCheck = AzFunctionHealthCheck;
const azFunctionHelloWorld = AzFunctionHelloWorld;

export default {
    healthCheck: async function (context: Context, req: HttpRequest): Promise<void> {
        await azFunctionHealthCheck(context);
    },
    helloWorld: async function (context: Context, req: HttpRequest): Promise<void> {
        await azFunctionHelloWorld(context, req);
    }
};
