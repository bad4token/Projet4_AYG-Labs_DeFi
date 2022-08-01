// Import NPM
import React from 'react';

import { EthProvider } from "./contexts/EthContext";

// Import ASSETS
import './App.css';

// Import UI
import CssBaseline from '@mui/material/CssBaseline';

import ResponsiveAppBar from "./components/ResponsiveAppBar";
import Footer from "./components/Footer";

//Connect Button import
import '@rainbow-me/rainbowkit/dist/index.css';
import {
  getDefaultWallets,
  RainbowKitProvider,
} from '@rainbow-me/rainbowkit';
import {
  chain,
  configureChains,
  createClient,
  WagmiConfig,
} from 'wagmi';
import { alchemyProvider } from 'wagmi/providers/alchemy';
import { publicProvider } from 'wagmi/providers/public';

function Link({ uri, text }) {
  return <a href={uri} target="_blank" rel="noreferrer">{text}</a>;
}


//Connect Button
const { chains, provider } = configureChains(
  [chain.mainnet, chain.kovan, chain.localhost, chain.polygon, chain.optimism, chain.arbitrum],
  [
    alchemyProvider({ alchemyId: process.env.ALCHEMY_ID }),
    publicProvider()
  ]
);

const { connectors } = getDefaultWallets({
  appName: 'My RainbowKit App',
  chains
});

const wagmiClient = createClient({
  autoConnect: true,
  connectors,
  provider
});

function App() {
  return (
    <EthProvider>
      <WagmiConfig client={wagmiClient}>
        <RainbowKitProvider chains={chains}>  
          <React.Fragment>
            <CssBaseline />
            <ResponsiveAppBar></ResponsiveAppBar> 
            <Footer> </Footer>
            <Link uri={"https://soliditylang.org"} text={"Link"} />
          </React.Fragment>
        </RainbowKitProvider>
      </WagmiConfig>
    </EthProvider>

  );
}

export default App;