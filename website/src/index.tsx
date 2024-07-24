import * as React from 'react';
import { createRoot } from 'react-dom/client';
import { ServiceContext } from './common/service-context';
import "./index.css";
import { CreateServices } from './services';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import { AppHeader } from './components/app-header';
import { AgentClasses } from './components/agent-classes';
import { Flows } from './components/flows';
import { FlowView } from './components/flow-view';
import { AgentList } from './components/agent-list';
import { NotificationLayer } from './components/notification';
import { ModalLayer } from './components/modal-layer';
import { AgentDetail } from './components/agent-detail';

const services = CreateServices();

function App() {
  return <ServiceContext.Provider value={services}>
    <Router>
      <NotificationLayer>
        <ModalLayer>
          <AppHeader/>
          <div className="content">
            <Routes>
              <Route path="/agent-classes" element={<AgentClasses/>} />
              <Route path="/agents" element={<AgentList/>} />
              <Route path="/agent/:id" element={<AgentDetail/>} />
              <Route path="/flows" element={<Flows/>} />
              <Route path="/flow/:id" element={<FlowView/>} />
            </Routes>
          </div>
        </ModalLayer>
      </NotificationLayer>
    </Router>
  </ServiceContext.Provider>
}

createRoot(document.getElementById("root")!).render(<App/>);