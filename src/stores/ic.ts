import { createActor, canisterId } from "../declarations/backend/index.js";

export const backend = createActor(canisterId);
export const backendCanisterId = canisterId;