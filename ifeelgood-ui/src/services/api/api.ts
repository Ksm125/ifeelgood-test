import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

const API_VERSION = "v1";
const BASE_URL = `http://localhost:3000/api/${API_VERSION}`;

export enum Tags {
  GiftCard = "gift_card",
}

export enum ApiMethod {
  GET = "GET",
  POST = "POST",
  PUT = "PUT",
  DELETE = "DELETE",
}

export const api = createApi({
  reducerPath: "api",
  baseQuery: fetchBaseQuery({ baseUrl: BASE_URL }),
  endpoints: () => ({}),
  tagTypes: Object.values(Tags),
});
