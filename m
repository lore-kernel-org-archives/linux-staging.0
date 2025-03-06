Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012225CC85
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288048; cv=none; b=TnY74W17ex9NpKh8YoXdnfjgXsyFnOxLnvg0REoYvLGPFU2F9IZiZwLlhIEFLiemg7v7EJU98VgSt8JVAajio1GxvGEe8sHm1krcfLEfqiC4VvKVbnJXzfCyWzDcjKL1iFKfdZwmjyIDGgCpj+P8y4hR4BJtJZeqZrcl04dLL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288048; c=relaxed/simple;
	bh=NuM0/4Z7CHDs8YxtoXcHEdVgcIA8PHCLZ43FdsDlooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW8nkRXgNOiStMtO25E5vyO8mj73uOfDbFjZruf9hCFCgYWdUpoespKpP0+l69Wgwe3Xt2OszXsP03XLCeZaQomYbAjA9nX7ORJr0xf+K0Js+BhEG0gy9/jZvMnvfqNANo5EG3XPrPe4uo8rkQvatXuEa8c7Y2kcMc5qgAbUY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fb462/mD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fb462/mD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso6817015e9.3
        for <linux-staging@lists.linux.dev>; Thu, 06 Mar 2025 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741288044; x=1741892844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=;
        b=Fb462/mD/bYof5TLtAzqBKr5NX9Pfj4MFY0XWulPOm4C2dEB4trUR/rWcLheLncyFz
         fAj963hTrny7SG3MxQi0SQjiKzc3v1YZlZw3obAh6WanIS66oT7fhK0Ut64rXqMNA6bP
         dOGxZQ3QvMOY4tBHXNfFwSul7uaZsZDHF87yfNkLscVjJo5SdqmZmI44ioBCHflizWfT
         mTtE/afSI8j9tsniAg2P0KEc8yMij1r9CtAx4+XRVJZ+l9YTp/XB3lnJBjv8euzPeRdi
         W1YucfMunPqUN0vzVOOcenCe9vwCM+uw/9oaZeB5ETAUjaNwocj68dsTUdEjG4aPV81c
         wAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288044; x=1741892844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=;
        b=BAK2hLalU8Tz6thxTIWXe+FyVFJNsHQtGZXuFbZ5GxmFKtAJrUf0eZPmVDNx7nDpyP
         w9kmr6BVMsag7LWMzqqQxZzXMJj1TpLUQlJGBxa2x/zPKkSr2Etr/SUCB8kqFuLbJ7L5
         cvGe7bUXcNuAOLLtezPZNkJdjL+kVrauNBdkCyHqYWJxbas6mN71IfYxFgW+X6x/1w+e
         tCAtl+KbS/fINJTIhi4AdGWbQCLtkuusk6KYm+DSfxlljNhWzyF3csAey1HJRaoibvDm
         MnGJrL/KswEXRrTdrdiLbJsvZblecvcOHC4GmW55vQF1KCzvT28OJSTCGhdAVOb3ek9H
         Tr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUV3R+mlIP8aJNloVv+TcRaSyCUuOo+NKfXpCAJhBYYzoDvNFcrz6zl0SX0UhWtsGdC0P2y9oVMdofZwo1+@lists.linux.dev
X-Gm-Message-State: AOJu0YwnP/yri8yBCK7wT9wNLpHgM2QR3Z9r9oE6VrPTrI4IEQXk19EO
	DDSOuQcsrIjPYMt80YCLor8RE9j5MbTwBWzdUvO+rMpiCWrrfQsq0qI43WSP0xk=
X-Gm-Gg: ASbGncsKL0D1TXUC7M5+lTOyo70KMNVDo+Oz9POb16yyTH/tiFT+eR1Rvtv+LBgrK7Y
	rChu5QQZqAN2jJEwQ/rrZd9XSJEiMPLVFMC7SX4pI69nw+afubXemmstYFQhoaQek1YTo+rmTEX
	TfJdKE9V/SkDZv4JVCHZyCyvrZHHz/2q2/eMI2kO+L8LFlMrjQugfL5tNDmEdjN50ETuRSM4rQc
	RfiqGjwWMNU2ihDBzu792fn1VSrKR6YqXgK01nXUgCyWArlbZ3o7hNLEm8ewFb7BFC5iUmRKVom
	RqSG9Lcd1T2id3P6twCRweakoUCy4XxTyQR7uo5yVNYx5KqNcA==
X-Google-Smtp-Source: AGHT+IGw/KEJ9CBs+ZmqDYKL+kV1HSN6Zuv++vQFuUB2xUBy6Y//0Fpmd9GzursfaQ4hN9Ki5iMA9Q==
X-Received: by 2002:a5d:6c66:0:b0:390:fceb:72f1 with SMTP id ffacd0b85a97d-39132d7625emr290402f8f.26.1741288044594;
        Thu, 06 Mar 2025 11:07:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e1476sm2880709f8f.70.2025.03.06.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:07:23 -0800 (PST)
Date: Thu, 6 Mar 2025 22:07:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>

On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> Hi Mathis,
> 
> Thanks for the patch.
> 
> On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > The imx-media-csi driver requires upstream camera drivers to implement
> > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > implement this function are not usable on the i.MX6.
> > 
> > The docs for get_mbus_config [1] say:
> > @get_mbus_config: get the media bus configuration of a remote sub-device.
> >             The media bus configuration is usually retrieved from the
> >             firmware interface at sub-device probe time, immediately
> >             applied to the hardware and eventually adjusted by the
> >             driver.
> > 
> > Currently, the imx-media-csi driver is not incorporating the information
> > from the firmware interface and therefore relies on the implementation of
> > get_mbus_config by the camera driver.
> > 
> > To be compatible with camera drivers not implementing get_mbus_config
> > (which is the usual case), use the bus information from the fw interface:
> > 
> > The camera does not necessarily has a direct media bus link to the CSI as
> > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > between them on the media pipeline.
> > The CSI driver already implements the functionality to find the connected
> > camera sub-device to call get_mbus_config on it.
> > 
> > At this point the driver is modified as follows:
> > In the case that get_mbus_config is not implemented by the upstream
> > camera, try to get its endpoint configuration from the firmware interface
> > usign v4l2_fwnode_endpoint_parse.
> > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > configuration.
> > For all other mbus_types, return an error.
> > 
> > Note that parsing the mbus_config from the fw interface is not done during
> > probing because the camera that's connected to the CSI can change based on
> > the selected input of the video-mux at runtime.
> > 
> > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > [1] include/media/v4l2-subdev.h - line 814
> > 
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> >  1 file changed, 32 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > index 3edbc57be2ca..394a9321a10b 100644
> > --- a/drivers/staging/media/imx/imx-media-csi.c
> > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> >  {
> >  	struct v4l2_subdev *sd, *remote_sd;
> >  	struct media_pad *remote_pad;
> > +	struct fwnode_handle *ep_node;
> > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> 
> Are there any defaults in DT bindings (other than 0's)? Also initialising a
> field to zero this way is redundant, just use {}.
> 

I was going to respond in much the same way.  This is equivalen to:

struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };

> >  	int ret;
> >  
> >  	if (!priv->src_sd)
> > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> >  
> >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> >  			       remote_pad->index, mbus_cfg);
> > -	if (ret == -ENOIOCTLCMD)
> > -		v4l2_err(&priv->sd,
> > -			 "entity %s does not implement get_mbus_config()\n",
> > -			 remote_pad->entity->name);
> > +	if (ret == -ENOIOCTLCMD) {
> 
> 	if (!ret)
> 		return 0;
> 
> And you can unindent the rest.

I was going to say this too but then I thought actually this needs to
be:

	if (ret != -ENOIOCTLCMD)
		return ret;

Which is weird.  Better to break all the new code into a separate
helper function.

	if (ret == -ENOIOCTLCMD)
		ret = parse_fw_link_config_stuff();

	return ret;

regards,
dan carpenter


