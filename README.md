# freeswitch

FreeSWITCH VoIP switch for Veilcall.

## Architecture

```
Browser (Tor) → WSS → Go API (Verto proxy) → FreeSWITCH :8081 → SIP Trunk → PSTN
```

- Verto WebSocket module on port 8081
- SIP over TLS to carrier (TCP outbound only)
- CDR completely disabled — no call records
