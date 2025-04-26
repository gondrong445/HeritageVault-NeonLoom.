import { AuthClient } from "@dfinity/auth-client";

let authClient;

export async function initAuth() {
  authClient = await AuthClient.create();
  return authClient;
}

export async function login() {
  return new Promise((resolve) => {
    authClient.login({
      identityProvider: "https://identity.ic0.app",
      onSuccess: () => resolve(true),
      onError: () => resolve(false),
    });
  });
}

export async function logout() {
  await authClient.logout();
}

export async function getIdentity() {
  return await authClient.getIdentity();
}

export async function isAuthenticated() {
  return await authClient.isAuthenticated();
}
