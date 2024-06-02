import { useState } from "react";
import { Button } from "../../components/Button/Button";
import { Input } from "../../components/Input/Input";
import { useCreateGiftCardMutation } from "../../services/api/giftCardsApi";
import style from "./home.module.scss";

// We hardcode the different values for now. In a real-world application, these values would be dynamic.
const PROMOTION_ID = 931;
const REWARD_SKU = "FNA-ECARTE-004";

export const Generator = () => {
  const [createGiftCard, { isLoading }] = useCreateGiftCardMutation();

  const [recipientEmail, setRecipientEmail] = useState("");

  const handleRecipientEmailChange = (
    e: React.ChangeEvent<HTMLInputElement>
  ) => {
    setRecipientEmail(e.target.value);
  };

  const handleGenerateGiftCard = () => {
    createGiftCard({
      promotionId: PROMOTION_ID,
      rewardSku: REWARD_SKU,
      recipientEmail,
    });
  };

  const buttonText = isLoading
    ? "Generating gift card..."
    : "Generate gift card";

  return (
    <div className={style.home__generator}>

        <Input
          placeholder="Recipient email"
          type="email"
          onChange={handleRecipientEmailChange}
        />

      <Button
        disabled={!recipientEmail || isLoading}
        onClick={handleGenerateGiftCard}
      >
        {buttonText}
      </Button>
    </div>
  );
};
