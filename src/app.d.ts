// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface Platform {}
	}
}

export {};


interface Eip1193Provider {
    request(request: { method: string; params?: Array<any> | Record<string, any> }): Promise<any>
    on(eventName: string | symbol, listener: (...args: any[]) => void): this
    removeListener(eventName: string | symbol, listener: (...args: any[]) => void): this
}

declare global {
    interface Window {
        ethereum?: Eip1193Provider
    }
}