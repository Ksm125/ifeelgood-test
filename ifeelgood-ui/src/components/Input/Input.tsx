import classNames from "classnames";
import type { FC } from "react";
import style from "./input.module.scss";

export const Input: FC<InputProps> = ({ className, ...props }) => {
  return <input {...props} className={classNames(style.input, className)} />;
};

type InputProps = React.InputHTMLAttributes<HTMLInputElement>;
