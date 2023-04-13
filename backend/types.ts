export type ApiResponse<T> = {
    data: {
        value: T,
        others?: any
    }
    statusCode: number,
    statusMessage: string,
    update?: boolean,
    disabled?: boolean,
    error?: object
}  