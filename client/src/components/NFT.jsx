import * as React from 'react';
import {useNavigate} from 'react-router-dom';

import { styled } from '@mui/material/styles';

import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Grid from '@mui/material/Grid';
import Paper from '@mui/material/Paper';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

function NFTmint() {
  const navigate = useNavigate();

  return (
    <React.Fragment>
      {/* Head */}
      <Container disableGutters maxWidth="sm" component="main" sx={{ pt: 8, pb: 6 }}>
        <Typography
          component="h1"
          variant="h2"
          align="center"
          color="text.primary"
          gutterBottom
        >
          NFT
        </Typography>
        <Typography variant="h5" align="center" color="text.secondary" component="p">
          Are you ready ?
        </Typography>
      </Container>
      {/* End Head */}

      <Container maxWidth="xl">
        <Box>
          <Grid container spacing={2}>
            <Grid item xs={6}>
              <Item>
                <h2>Staking NFT</h2>
                <Box
                  component="img"
                  sx={{
                    height: 300,
                    width: 400,
                    maxHeight: { xs: 100, md: 300 },
                    maxWidth: { xs: 133, md: 400 },
                  }}
                  alt="Staking NFT"
                  src="./../pic_staking.gif"
                  onClick={(e) => {
                    navigate('/NFT/Staking');
                  }}
                />
                <Button
                  fullWidth variant="contained"
                  size="large"
                  onClick={(e) => {
                    navigate('/NFT/Staking');
                  }}
                >
                  Go !
                </Button>
              </Item>
            </Grid>
            <Grid item xs={6}>
              <Item>
                <h2>Minting NFT</h2>
                <Box
                  component="img"
                  sx={{
                    height: 300,
                    width: 400,
                    maxHeight: { xs: 100, md: 300 },
                    maxWidth: { xs: 133, md: 400 },
                  }}
                  alt="Minting NFT"
                  src="./../pic_mint.gif"
                  onClick={(e) => {
                    navigate('/NFT/Mint');
                  }}
                />
                <Button
                  fullWidth variant="contained"
                  size="large"
                  onClick={(e) => {
                    navigate('/NFT/Mint');
                  }}
                >
                  Go !
                </Button>
              </Item>
            </Grid>
          </Grid>
        </Box>
      </Container>
    </React.Fragment>    
  );
}

export default NFTmint;

