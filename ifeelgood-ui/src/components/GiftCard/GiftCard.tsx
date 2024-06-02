import { type FC } from "react";
import fnacImage from "../../assets/fnac.webp";
import type { TGiftCard } from "../../schemas/giftCard";
import style from "./giftCard.module.scss";

export const GiftCard: FC<TGiftCard> = ({
  amount,
  code,
  securityCode,
  currency,
}) => {
  return (
    <div className={style.giftCard}>
      <img className={style.giftCard__image} src={fnacImage} alt="Fnac" />
      <div className={style.giftCard__detail}>
        <p>Code: {code}</p>
        <p>Security code: {securityCode}</p>
      </div>

      <p className={style.giftCard__price}>
        {amount} {currency}
      </p>
    </div>
  );
};
