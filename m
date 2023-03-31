Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28238256F
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 12:24:03 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4Pnzww2yyHz49Q6m
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 15:24:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1680265440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baET9cubz4N9wt7gVurSp9qJQ/b3e8TRSP9pS9RzYcg=;
	b=V0I/mmouoHmyfeYbHuUj3E1r8cIp9JmLW0dujzyaG9jMU5+G8uJinLiCtatmveA8wu2kh2
	L9e6ffyBhEnA5Prd28jCx34l+zqRLVztz0s3uj6QwrKC5bkSpnflIiQsFL+9t28FbhSYsY
	XkyYV4866PjgJXS8cjZKD2BsHZcLhD03ZtbL9gMaD44Fr+eRDaL2YqsWbeFuKmNmhIheEu
	bxNjyIe8W2U0Awr5Sif+TVrZuOOmpShnTvxPOrKCtinHCxkVMTzAsHmpVydD198sjI0pRy
	9b3hKQ8lLWN9kTTEQVyLf7L86y0gg036LS1suTApUFTukcn2dV/JQDfdOMP8tQ==
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Pnzwk3lZXzyRB;
	Fri, 31 Mar 2023 15:23:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1680265431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baET9cubz4N9wt7gVurSp9qJQ/b3e8TRSP9pS9RzYcg=;
	b=bwMffGnN8GUjWoNBxMqSfgs0ezYRrSCo3ebiFUVa7X08hsIyy4UJ2uAw2kFDJ/TopV1fVJ
	D+0H71Dhv42Vg6JoM0fb9vLHJ1Ae5Blk+ce3g+DNX1ZaqpOFFVe2iqCgolsERcQLjAE2Wo
	vcMIA1puDPmkLUrTspL/oy+HOq6KynM=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1680265431; a=rsa-sha256; cv=none;
	b=oL1crNEDL7zy2VeG+72aM1EjV3fNvXLPgpwADvQXvSt1Dv05+u/29DAudHFRlFvJUeMxoH
	s3fpchlSmmJUbdG9/fn/jBmE8axs5KpJC8YjyKLdXvy/cfhpefK2KmutqvwkN3hZub9Dhe
	iizdvf6u79FMH50+XrI0nI01qNFG6yQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1680265431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baET9cubz4N9wt7gVurSp9qJQ/b3e8TRSP9pS9RzYcg=;
	b=NliZAsa9umrzonZ2F/8aHOmiSdzsga442wg+ZtgrNp3yZK6t8Cn309hssV3RZdqrAUuXAr
	WCbsF3PhNhZlFkd+GUuOp5A7KsojwAmISXdHd/EgWZErIT+5zc6tsmafZKAH3McIKeVb8F
	FBYqs5tcBsRjs8z67AQzpDKol2fch2E=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DA1F4634C99;
	Fri, 31 Mar 2023 15:21:34 +0300 (EEST)
Date: Fri, 31 Mar 2023 15:21:34 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Message-ID: <ZCbQTjL+Gy+Poeu/@valkosipuli.retiisi.eu>
References: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>

Hejssan,

On Sat, Feb 11, 2023 at 03:46:14PM +0100, Niklas Söderlund wrote:
> Add basic support for outputting the test patterns on a 3-lane CSI-2
> C-PHY bus. As the driver only can output frames form its internal test
> pattern generator, enabling C-PHY output is as simple as setting the
> output mode to C-PHY instead of D-PHY.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 99b333b68198..d93dd985fb27 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -30,6 +30,7 @@ struct max96712_priv {
>  	struct regmap *regmap;
>  	struct gpio_desc *gpiod_pwdn;
>  
> +	bool cphy;
>  	struct v4l2_mbus_config_mipi_csi2 mipi;
>  
>  	struct v4l2_subdev sd;
> @@ -127,10 +128,18 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
>  	/* Select 2x4 mode. */
>  	max96712_write(priv, 0x8a0, 0x04);
>  
> -	/* Configure a 4-lane DPHY using PHY0 and PHY1. */
>  	/* TODO: Add support for 2-lane and 1-lane configurations. */
> -	/* TODO: Add support CPHY mode. */
> -	max96712_write(priv, 0x94a, 0xc0);
> +	if (priv->cphy) {
> +		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
> +		max96712_write(priv, 0x94a, 0xa0);
> +
> +		/* Configure C-PHY timings. */
> +		max96712_write(priv, 0x8ad, 0x3f);
> +		max96712_write(priv, 0x8ae, 0x7d);
> +	} else {
> +		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
> +		max96712_write(priv, 0x94a, 0xc0);
> +	}
>  
>  	/* Configure lane mapping for PHY0 and PHY1. */
>  	/* TODO: Add support for lane swapping. */
> @@ -332,8 +341,9 @@ static int max96712_parse_dt(struct max96712_priv *priv)
>  {
>  	struct fwnode_handle *ep;
>  	struct v4l2_fwnode_endpoint v4l2_ep = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY
> +		.bus_type = V4L2_MBUS_UNKNOWN,

The bindings don't require setting bus-type. Please change the bindings as
well. And assume D-PHY in the driver if bus-type isn't set.

>  	};
> +	unsigned int supported_lanes;
>  	int ret;
>  
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
> @@ -350,8 +360,22 @@ static int max96712_parse_dt(struct max96712_priv *priv)
>  		return -EINVAL;
>  	}
>  
> -	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != 4) {
> -		dev_err(&priv->client->dev, "Only 4 data lanes supported\n");
> +	switch (v4l2_ep.bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
> +		supported_lanes = 4;
> +		priv->cphy = false;
> +		break;
> +	case V4L2_MBUS_CSI2_CPHY:
> +		supported_lanes = 3;
> +		priv->cphy = true;
> +		break;
> +	default:
> +		dev_err(&priv->client->dev, "Unsupported bus-type %u\n", v4l2_ep.bus_type);
> +		return -EINVAL;
> +	}
> +
> +	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != supported_lanes) {
> +		dev_err(&priv->client->dev, "Only %u data lanes supported\n", supported_lanes);
>  		return -EINVAL;
>  	}
>  

-- 
Hälsningar,

Sakari Ailus
