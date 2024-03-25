Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D7157481
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370109; cv=none; b=H2cGwFHufSQe9Q4Ko+VldMtNv51jT4UNQYJy4fjOi9mHEMet312UuyAYI6zFyNC/Nvek1ogqGk6U+H9Tjh7XXMXSMCLCVVD6vbdoTlMB1eqELXg4gYpw/XFk96l7qxQdYSBniQlEu/FKDvEg7qm39TsX/oMolIjm3pknpBfIAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370109; c=relaxed/simple;
	bh=Ihco2VVQ8EM7Jh1F8wrCqICE2zkzbKD5Hk3coKQgtXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsneGqcRNzt/UTn2sFIT3W0syhzFugh/KxIaCDu6VzMPw3zpG7r8s3GIaHZi78YibxevETXH2iV4Gb1oG0Ja/YGTuWBkmTSTEWnSNc4Qd4RBdv1xqUoI7N+bisRGUEWgUtW2pck/1U6IwKDtwvyIsHcy3WDmvNbz6lnh7Ih0p4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbNPCW3s; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbNPCW3s"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56bc5a3aeb9so5561366a12.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711370106; x=1711974906; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWqmr4tJSgMTZuBlY7silaTC/ghGytqv25bJf51WJeA=;
        b=ZbNPCW3sE+zE3FS2tSxCzpj1iLxnSZjdhZXklv83VdCuPLrru5K1JWQmNJFCP26+qD
         s+o8NA3a6vAS1FReexr+Ahj2dz7YQqmJHFyW1bpilQsIwbF5LGz+Ha5NktMd9CCFDz+k
         wQVnu1b3ALXtJWJwLhR6N9sSNIuSCr02U6pBOB1yXD2II40PVuELGeSISrW95uhBMx/M
         Jb3MGiq64g8nAFpK3ACWrtk0xJnl7j6eZcxdtjoVfxooF63vzbPn/fvF3ur5TSuqEwe6
         qQhEejMDHTt23ehsuyRe7OagSXsSYsgW5mEzy9zxzDzHgGfjhFsy/2RvKVePIoPTr7VK
         QckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711370106; x=1711974906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWqmr4tJSgMTZuBlY7silaTC/ghGytqv25bJf51WJeA=;
        b=CQCcSX1ss95TTkRnkRA0QxY4rHXlrESF8jFAIxtmZ82qIpuVQQIrMiTAYtv1n+4I/e
         X16Oz50pD6oE/wQ/TMBvgQMbOptTp6zC04kjJDb5yIH6xgNCf1jF5R3kLGSkmv4CTZUO
         HsklON/cDeX5ESaIQX2uIWqV2w/eyD0XXFqDgHxf3f56d1moV0ARDf0o63n6SROSyIgW
         ZZ/zroDbRarmpyKxEE3k52NZ+T0ZjFj3EvSaiBrwLpT9vky4j5/6IUT+wuI3ynUTK75w
         HTUsq4ZgTxcmtQ1jJ8ym2Yo9z40QlbM6cE4utB1g6r10OMU88HdChq/utz7uDk8KVWwl
         yJCA==
X-Forwarded-Encrypted: i=1; AJvYcCXI0WLGijmKgHUpINNUS1airi+hkL+V4i1hkxTD8C+L1fFxx/wlMflSrOGwQH4p42pCWw0zPWIyYP11gRyt7M3boomC8mV2TFIYMfN0dA==
X-Gm-Message-State: AOJu0YzkARwKiqzoiakLR5E8+VZrV2IkBlEOgqB6taRdXai0DASw0BM4
	GUzHeBahJSEGhWwT33t6NGFZMPY6HUvZfRE5vviPiGAJhCGDsIDRTRI6bd9/gdw=
X-Google-Smtp-Source: AGHT+IH8Cn89ggEfIANbpUmr3OPCf2JNAzSSROYWGxG3Th6G6cN11daoFg65mxm7kIJzyF7KMVoTFg==
X-Received: by 2002:a50:d786:0:b0:567:ff26:4bcb with SMTP id w6-20020a50d786000000b00567ff264bcbmr4510771edi.30.1711370105691;
        Mon, 25 Mar 2024 05:35:05 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s21-20020a056402037500b0056bdc4a5cd6sm2947522edw.62.2024.03.25.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 05:35:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:35:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/8] media: platform: ti: use for_each_endpoint_of_node()
Message-ID: <02d6efba-6d1c-465f-a06d-cf7c02656e21@moroto.mountain>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
 <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>

On Mon, Mar 25, 2024 at 03:05:27AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   |  8 +++-----
>  drivers/media/platform/ti/davinci/vpif_capture.c | 11 +++++------
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 77e12457d149..4f185a0d42b3 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2306,14 +2306,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  	if (!pdata)
>  		return NULL;
>  
> -	for (i = 0; ; i++) {
> +	for_each_endpoint_of_node(dev->of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		sdinfo = &pdata->sub_devs[i];
                                          ^
"i" is uninitialized now.

Also in the initializer it has "struct device_node *endpoint = NULL;"
which is unnecessary now.  And at the end it has:

	of_node_put(endpoint);
	return pdata;

Since endpoint is NULL this was always a pointless no-op but now it's
more obvious, so lets delete that.

regards,
dan carpenter

