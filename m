Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2425F2101AD
	for <linux-staging@lists.linux.dev>; Thu, 30 May 2024 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051212; cv=none; b=pVAsv4mQsWyvCEG9rJLqAgwp/5owhv3/03KFaSEoB2zeC1cY6as4/O0nuFylpw3cRGHkYuaPOLbKnSwd3dlARCvrg5iPyXS08EzbgdLfpHMU7ApNg7aV5+h1H3QVhOTVmjvU+zUpX2grpeO4BuOIIHSW6UpilMTAwi7k+Y5i2JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051212; c=relaxed/simple;
	bh=ylScWtRnNsvzxfLN7SlSXfogkUEyR/tv1L2cL+EG+QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuqYVZQOAFF20zS+ZqHLii8u0DE4bpS5M5nrRHQaeYMaFyEjK7nATe8J1dCgb1HiNz5rCnzC5fHmXc4FlspmBT1U9oOVDmjBOL2GvtSAHj52hp/5vu8MiyjIS4JacxoMnKtXXvQ5d8CS3M14H7kO1MlRUM1l1oxfVruNFHsLUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXCelhkP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXCelhkP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-578626375ffso498077a12.3
        for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717051209; x=1717656009; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbYS8lpXExj7GV7sixwHtaV70JUaIYUrLKDua6V9Rwg=;
        b=jXCelhkPbyqicZi5TAlLpemmfD096p7oUi5qMwfA81e04eFY62qYFi+riU4/Pip64o
         j1DHKRAm81OEIDflVwmHurI7whU/fN0QVS9XoMOSSZ9zBnvWg5tgvRq2moscGy6sLQdU
         Qq204Uq7zmhk+hN2gpT0JETqGLDlF9+gyqps1YyfsVbrBHbxh4bqQixCMGuH4eSkGr0o
         2GyeKHV8gr7IRd9xFTXOH6QAvbjnwGO0fLcEFVqiGt6X4gLpBqlLZKNNVnBkek7Q0TWK
         yPi/9fOheblT9tXnrasCcoE+xVXiuajLd+ttkbzxiwS6kEiUFWm1Aqyry6XLS9FjPY00
         DAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051209; x=1717656009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbYS8lpXExj7GV7sixwHtaV70JUaIYUrLKDua6V9Rwg=;
        b=MMBUM6tGGUPgjvEKrJ1Vtk5L3EeHflq+WqvW/Y3ycNtRH7fYRsGaRWNXa6wXZRJv97
         xiMLBEemzA3y77Ts8oTO1V8DIamFlHWQGeuDYmA8EhW08Wfa/jV4x8Cjv9G7bjW4qYUs
         opSAfzbiYtyxviTk/Qy6CfRSRhC9zkIu9b7ZIhCaXxiy2V2nlqKeLHC2XjMeeZuhsa0g
         O69Fop9bAAzB98mNa0XCzW8riChQ/YgvUkFB+h4L4tbAE6zRMb/xtfrTz9G6ZKHzt/c4
         X2nhiYA8qbupFEVrAkLTAEgyEsm+hIKoTGKTWEzeN1ANgGCmAZHNHjF1+J1Ex6B6bArg
         RL+w==
X-Forwarded-Encrypted: i=1; AJvYcCWK54FDYnBxw60mgXcrTmTtx8OA7YhRxfEmGmvEx5fFwLRSd4s+qL6Ad/RbhcdAXp1xvw0rcs4pV/A8BkmEiCSb8RA3bnoH42vxSF9FyA==
X-Gm-Message-State: AOJu0YwCg7afJHfM/Zlmo7PXbZNPOuRBI1GYmgADu/Y+cSdOvJ0cL55d
	Wb743uoNDWZb9h0q4RGW2wyILCYYpddBmz9NAh6yI6lApFv1069H7cnkCIl2/fQ=
X-Google-Smtp-Source: AGHT+IE6/VTwKZTsEcVkjHDXiwR4jbhWUjQNX+Zpjmyoqeke5OVHzCiHycLfInR8VWcYgsER/P3wXg==
X-Received: by 2002:a50:9316:0:b0:579:c2fe:886 with SMTP id 4fb4d7f45d1cf-57a177b15b9mr645619a12.14.1717051209214;
        Wed, 29 May 2024 23:40:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d69b49basm4770207a12.88.2024.05.29.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:40:08 -0700 (PDT)
Date: Thu, 30 May 2024 09:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
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
Subject: Re: [PATCH v3 7/9] staging: media: atmel: use
 for_each_endpoint_of_node()
Message-ID: <f0f1b989-2166-44ad-ba70-caf56a4d93c4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>

On Thu, May 30, 2024 at 02:06:22AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../staging/media/deprecated/atmel/atmel-sama5d2-isc.c    | 8 ++------
>  .../staging/media/deprecated/atmel/atmel-sama7g5-isc.c    | 8 ++------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index 31b2b48085c59..3b28a232418a9 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -333,20 +333,16 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
>  static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  {
>  	struct device_node *np = dev->of_node;
> -	struct device_node *epn = NULL;
> +	struct device_node *epn;
>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> -
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {

This introduces a Smatch warning because now "ret" is uninitialized if
the for_each_endpoint_of_node() list is empty.  Is that something which
is possible?

I've been meaning to make a list of loops which always iterate at least
one time.  for_each_cpu() etc.

regards,
dan carpenter

