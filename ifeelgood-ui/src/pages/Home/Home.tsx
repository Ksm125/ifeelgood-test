import { GiftCard } from "../../components/GiftCard/GiftCard";
import { Loader } from "../../components/Loader/Loader";
import type { TGiftCard } from "../../schemas/giftCard";
import { useGetGiftCardsQuery } from "../../services/api/giftCardsApi";
import { EmptyData } from "./EmptyData";
import { Generator } from "./Generator";
import style from "./home.module.scss";

export const Home = () => {
  const { data, isFetching } =
    useGetGiftCardsQuery();

  const noGiftCards = !data || data.length === 0;

  if (isFetching) {
    return <Loader />;
  }

  return (
    <div className={style.home}>
      <Generator />
      <div className={style.home__content}>
        {noGiftCards ? (
          <EmptyData />
        ) : (
          data.map((giftCard: TGiftCard) => (
            <GiftCard key={giftCard.id} {...giftCard} />
          ))
        )}
      </div>
    </div>
  );
};
