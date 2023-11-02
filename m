Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF379F0
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qYDmT76N"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7CA8C2;
	Thu,  2 Nov 2023 16:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698939460;
	bh=DT6KLFROME6gQwGlCCzP0AGObJaawrMfnQVmIvWpWNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYDmT76NHBPJgjme5FiNiLXeOAQot69NwrxIEc26GkBDLZkpjpCWqAPLVoBPV5kGx
	 EHB58asAICMbrWB0pzaoMtfgEjGuyLAwi9OQhNFJlLdrKqTouq3D8OLkvbut4Jbyp+
	 2Qex6Zc4DIF485SjXLJcjU6ZGWcEFzMc8fKr2F40=
Date: Thu, 2 Nov 2023 17:38:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 2/4] Remove redundant return value check
Message-ID: <20231102153804.GA7129@pendragon.ideasonboard.com>
References: <20231102141135.369-1-adiupina@astralinux.ru>
 <20231102141135.369-2-adiupina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231102141135.369-2-adiupina@astralinux.ru>

On Thu, Nov 02, 2023 at 05:11:33PM +0300, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant

That may be the case today, but may not be true tomorrow if the function
is extended to perform extra checks. I don't think dropping the error
check in drivers is a good idea.

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/media/i2c/rdacm20.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index f4e2e2f3972a..ed249ade54e0 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -611,9 +611,7 @@ static int rdacm20_probe(struct i2c_client *client)
>  
>  	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret < 0)
> -		goto error_free_ctrls;
> +	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>  
>  	ret = v4l2_async_register_subdev(&dev->sd);
>  	if (ret)

-- 
Regards,

Laurent Pinchart
