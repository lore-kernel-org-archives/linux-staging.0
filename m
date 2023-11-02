Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF391B274
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cs+pJMCX"
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BDCD8C1;
	Thu,  2 Nov 2023 15:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698936924;
	bh=rXfEvh5nSr6U891GXJKcDjrkDgnjLsjVT9M6OziGS48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cs+pJMCX0wUvva8pWbLz1gR2aD+BiJ5yIzUwgNgLSVoobUb9ksmuXPU8SVpAxe/43
	 qklVgY+qe8srVlTSLNPa/gKMEJTRRcUX6T32qu5odxP6qqYmMncU2JLqIb9zDaton5
	 4ZHs6UUPPPrnTHIEHPRKX4mImhuCRI/i2pGxaCqU=
Date: Thu, 2 Nov 2023 15:55:39 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, lvc-project@linuxtesting.org
Subject: Re: [PATCH 2/4] Remove redundant return value check
Message-ID: <g4btjscnffrzhip2lys7wezk5acebho44g6kawc5fc5p47pqxs@4lch6fjqesec>
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

Hi Alexandra

On Thu, Nov 02, 2023 at 05:11:33PM +0300, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant

I do also see

          if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
                                       MEDIA_PAD_FL_SOURCE)) != 1) {
                  ret = -EINVAL;
                  break;
          }

as a possible failure in in media_entity_pads_init().

>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")

And this does not really qualify as a fix imho

In general, being defensive and check for return errors in not a bad
thing. I would keep the check in place, it really doesn't hurt.

Same for the other patches in the series.

Thanks
  j

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
> --
> 2.30.2
>
