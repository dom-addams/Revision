import { AzureFunction, Context, HttpResponse } from "@azure/functions";

// Health Check Function
const AzFunctionHealthCheck: AzureFunction = async (
  context: Context
): Promise<HttpResponse> => {
  // Set body to return
  const status = "UP";

  // Try returning Status 200 and Body { status: "UP" }
  // Else return Status 500 and Error Message
  try {
    return {
      status: 200,
      body: { status },
    };
  } catch (error) {
    return {
      status: 500,
      body: error.message,
    };
  }
};

export default AzFunctionHealthCheck;
