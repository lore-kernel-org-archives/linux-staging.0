Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62B632
	for <linux-staging@lists.linux.dev>; Sat,  1 Feb 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738405855; cv=none; b=XjtfJMd2L1n8ABqhh0v4/Rr3zx1v5LIuJCDWsFjWe90WVMW+68ewVHqR6JWYRFcP3O+KJQkr7XV44mZ5U1g5fS/1ziHWXvX5M9YlfuUuv3FIwITWsj3YkCa0oH+PUQm8P9GyKwcAKGIuE5m3coKr/rrIqZpWLlYR9oVNPhF9kTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738405855; c=relaxed/simple;
	bh=3iXei+zMuga5mqMZDCe8XCjwCF2tjKl5U1Wbnl4CHtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5qgIXgojdyhvzTz/C1dp7nUzWs6CPZVzn14sHcHkfSaU3jFK3WYBqoXkPy97BDa7h/P+/6wjoc1nlyXgyvWxXVuMo8RFCv5fC6pj5/2RuM669yjfuJJ9ek9qMoZ6DjLTLnUQ/6ysNfXxrqtbH1lI41R00fTTbnlpGViYqu/XJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CDaHmV2I; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CDaHmV2I"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436a03197b2so19178615e9.2
        for <linux-staging@lists.linux.dev>; Sat, 01 Feb 2025 02:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738405852; x=1739010652; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xohF1aQ9sBB9g7xPx+Tdicp2pC5qB9GNqW8EawpT9YE=;
        b=CDaHmV2IJ1PGoiD7l897br53Pd2gnhR44F/76AYroEYZqeXbowqY9bwUOC9vlxkWLK
         r3ufSWXAVrKPVR5tuHHrm19fS6QRs/rqV+hIpDHh+SiXKScMFyidajC1CCYvnXOIZEC+
         7+IhZgk/zAOhr7rOfktGTpapT5Qwj4Stox+ln6zWlFfZma1gKzibVA9Fo+nJcqfa8aGJ
         1LcLYBd9ZEm4Ot+RZKvvM30HrAGX74vBP1ttMHLDYXB5klI7lIzuLAahFIM5aOdTt7A5
         1/kI9a5kV0JUy/lksINgoRvnOTKPE/obYcdl1MHqa0dLnCPka/yXOUnxbrc73xr0rpsD
         tD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738405852; x=1739010652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xohF1aQ9sBB9g7xPx+Tdicp2pC5qB9GNqW8EawpT9YE=;
        b=m+iQNiawcKluxkRnlvx+RsAct//xMlUWZGNPl7iZI223KRRE00/Ot7uvMmADddjs9W
         0IIYzeMNLUIVJ9Y7Aw35/SF5C0m3myZOKmlHP7fPlyvAD6WOuvWIcYsuZ6t1Ydr5jCfw
         6+5lOaVdSfAtgu1jfyeqk77yW2gtNZ3JOU8wvizq+RVc+VKy/LW8qBHB8WzKR225aRru
         QuY3CingnNJEzcFTdJCQTskSAY0AXjeqfXCD8aYgtt90znwf2DRrn4rHikrWxoBHY3X/
         6qy01MzkrLyyH08MNYNrlh7CB0HZbm0ZtE6vtCrADGEt6nIgLZ5Nkb4w8vrZn1fYWkjN
         wEvg==
X-Forwarded-Encrypted: i=1; AJvYcCVJAnWl+qtTrMwHH9BPFPeO3y5rgAIVI6VBm/JuqlE0RkOPnQPjyniRmPXtXuIikvMLwBjTFZVbiR9w9GYy@lists.linux.dev
X-Gm-Message-State: AOJu0YxKWU8rFQrju5xQ3istepIbbc2KjquAjp7cgO2bkkKcAC6ZBzV4
	Ys1RJIxVAqzPpwdouMZpJgJgHu5TLNoA/WIAuzdPWStnRo9wgEXuoHV9UO3uOp8=
X-Gm-Gg: ASbGncuNWNK2Z8/sdocLZbk/PfZPWYTwV7tOVNOWYxuIcxvzjbucX8RLa816Tve5K/f
	2+L3P/67uYCshZjCuGhk1F3V+eJMUPMumUfgS587gHFoj6PJSUvwr0SnsXeHi3hjLiJk0RF7fBz
	0YXEKBq9sWGFYW6paR7e1ob/U6wPEkUNzozkw/AhMRaJDasWM5N+b/2yctA/kb6w6RPCJoKKw8L
	enP2uFco4IV0Yy2Vbrp6eKgYDsJQtTBg7HSuwVsRbw5R2q62uHEofhDdFq6LY6vlIRB2ywFfqL/
	YCYXXBQLtv/7OodqKgtr
X-Google-Smtp-Source: AGHT+IF0BG43GtXbK+RPYd0fGTqtRp85sB3ItAL9AxWDKVzVZUuEde1c6xbWxd/3dCeIjoZisES8Pw==
X-Received: by 2002:a05:600c:3b98:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-438dc3be214mr127884145e9.12.1738405852406;
        Sat, 01 Feb 2025 02:30:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b5136sm7118399f8f.65.2025.02.01.02.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 02:30:51 -0800 (PST)
Date: Sat, 1 Feb 2025 13:30:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC 04/12] staging: media: max96712: change DT parsing routine
Message-ID: <e2b7b98d-fb16-497e-9102-ba49e04e1748@stanley.mountain>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
 <20250131163408.2019144-5-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131163408.2019144-5-laurentiu.palcu@oss.nxp.com>

On Fri, Jan 31, 2025 at 06:33:58PM +0200, Laurentiu Palcu wrote:
> -static int max96712_parse_dt(struct max96712_priv *priv)
> +static int max96712_parse_rx_ports(struct max96712_priv *priv, struct device_node *node,
> +				   struct of_endpoint *ep)
> +{
> +	struct device *dev = &priv->client->dev;
> +	struct max96712_rx_port *source;
> +	struct fwnode_handle *remote_port_parent;
> +
> +	if (priv->rx_ports[ep->port].fwnode) {
> +		dev_info(dev, "Multiple port endpoints are not supported: %d", ep->port);
> +		return 0;
> +	}
> +
> +	source = &priv->rx_ports[ep->port];
> +	source->fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(node));
> +	if (!source->fwnode) {
> +		dev_info(dev, "Endpoint %pOF has no remote endpoint connection\n", ep->local_node);
> +		return 0;
> +	}
> +
> +	remote_port_parent = fwnode_graph_get_remote_port_parent(of_fwnode_handle(node));
> +
> +	if (!fwnode_device_is_available(remote_port_parent)) {
> +		dev_dbg(dev, "Skipping port %d as remote port parent is disabled.\n",
> +			ep->port);
> +		source->fwnode = NULL;

I don't understand the refcounting in this function.  Should we call
fwnode_handle_put(source->fwnode); before setting this to NULL?

> +		goto fwnode_put;
> +	}
> +
> +	priv->rx_port_mask |= BIT(ep->port);
> +	priv->n_rx_ports++;
> +
> +fwnode_put:
> +	fwnode_handle_put(remote_port_parent);
> +	fwnode_handle_put(source->fwnode);
> +	return 0;

I don't understand why we save source->fwnode but drop the refcount on
the success path.  My instinct says that it should be a source_fwnode
local stack variable instead.  (But again, I've only glanced at this
code so I could be wrong).


> +}
> +

regards,
dan carpenter

