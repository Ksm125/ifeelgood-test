import camelcaseKeys from "camelcase-keys";
import snakecaseKeys from "snakecase-keys";
import type { TGiftCard } from "../../schemas/giftCard";
import { ApiMethod, Tags, api } from "./api";

const LIST_TAG = "LIST";

export const giftCardsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getGiftCards: build.query<TGiftCard[], void>({
      query: () => "gift_cards",
      // @ts-expect-error - To check why transformResponse does not infer correctly response type
      transformResponse: (response) => camelcaseKeys(response.data),
      providesTags: (result) => {
        const defaultTags = [{ type: Tags.GiftCard, id: LIST_TAG }];
        if (!result) return defaultTags;

        console.log({ result });

        return [
          ...defaultTags,
          ...result.map(({ id }) => ({ type: Tags.GiftCard, id })),
        ];
      },
    }),
    createGiftCard: build.mutation({
      query: (body: CreateGiftCardParams) => ({
        url: `gift_cards`,
        method: ApiMethod.POST,
        body: snakecaseKeys(body),
      }),
      invalidatesTags: [{ type: Tags.GiftCard, id: LIST_TAG }],
    }),
  }),
});

type CreateGiftCardParams = {
  promotionId: number;
  rewardSku: string;
  recipientEmail: string;
  amount?: number;
};

export const { useGetGiftCardsQuery, useCreateGiftCardMutation } = giftCardsApi;
