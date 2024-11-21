import {
  DocumentHeadTags,
  DocumentHeadTagsProps,
  documentGetInitialProps,
} from "@mui/material-nextjs/v15-pagesRouter";
import { Html, Head, Main, NextScript } from "next/document";

export default function Document(props: DocumentHeadTagsProps) {
  return (
    <Html lang="ja">
      <Head>
        <DocumentHeadTags {...props} />
      </Head>
      <body>
        <Main />
        <NextScript />
      </body>
    </Html>
  );
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
Document.getInitialProps = async (ctx: any) => {
  const finalProps = await documentGetInitialProps(ctx);
  return finalProps;
};
