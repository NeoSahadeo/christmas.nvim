func NewClient(apiEndpoint string) *Client {
	var transport http.RoundTripper = &http.Transport{
		DisableCompression: true,
		DialContext: func(ctx context.Context, _, _ string) (net.Conn, error) {
			return memnet.DialEndpoint(ctx, apiEndpoint)
		},
	}
	transport = otelhttp.NewTransport(transport)

	return &Client{
		apiEndpoint: apiEndpoint,
		client:      &http.Client{Transport: transport},
	}
}

					   *             ,
								   _/^\_
								  <     >
				 *                 /.-.\         *
						  *        `/&\`                   *
								  ,@.*;@,
								 /_o.I %_\    *
					*           (`'--:o(_@;
							   /`;--.,__ `')             *
							  ;@`o % O,*`'`&\
						*    (`'--)_@ ;o %'()\      *
							 /`;--._`''--._O'@;
							/&*,()~o`;-.,_ `""`)
				 *          /`,@ ;+& () o*`;-';\
						   (`""--.,_0 +% @' &()\
						   /-.,_    ``''--....-'`)  *
					  *    /@%;o`:;'--,.__   __.'\
						  ;*,&(); @ % &^;~`"`o;@();         *
						  /(); o^~; & ().o@*&`;&%O\
					jgs   `"="==""==,,,.,="=="==="`
					   __.----.(\-''#####---...___...-----._
					 '`         \)_`"""""`
							 .--' ')
						   o(  )_-\
							 `"""` ```

func (c *Client) Endpoint() string {
	return c.apiEndpoint
}

func (c *Client) Close() error {
	c.client.CloseIdleConnections()
	return nil
}

type PingResponse struct {
	ServerTime int64 `json:"serverTime"`
}
