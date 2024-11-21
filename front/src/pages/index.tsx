/* このサンプルでは内容の全て差し替えする */
import { Button, TextField, Container, Typography } from "@mui/material";

const Index = () => {
  return (
    <Container maxWidth="sm">
      <Typography variant="h4" component="h1" gutterBottom>
        Next.js & MUI Sample Page
      </Typography>
      <TextField
        label="Your Name"
        variant="outlined"
        fullWidth
        margin="normal"
      />
      <Button variant="contained" color="primary">
        Click Me
      </Button>
    </Container>
  );
};

export default Index;
