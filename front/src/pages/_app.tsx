import "@/styles/globals.css";
import type { AppProps } from "next/app";
import { AppCacheProvider } from "@mui/material-nextjs/v15-pagesRouter";

export default function App(props: AppProps) {
  return (
    <AppCacheProvider {...props}>
      <props.Component />
    </AppCacheProvider>
  );
}
