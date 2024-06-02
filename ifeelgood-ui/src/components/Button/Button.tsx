import classNames from "classnames";
import type { FC } from "react";
import style from "./button.module.scss";

export const Button: FC<ButtonProps> = ({ className, ...props }) => {
  return <button {...props} className={classNames(style.button, className)} />;
};

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement>;
