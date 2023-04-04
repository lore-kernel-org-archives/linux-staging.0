Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697F7C
	for <linux-staging@lists.linux.dev>; Tue,  4 Apr 2023 02:30:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CECD7F8;
	Tue,  4 Apr 2023 04:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1680575137;
	bh=i9klPCWMa8/2rFc4/MSCGVBV7ZJdrrxvQYjM9CpoxKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCN+0G6GlL5pcWmwq0HzLpI+zrqBCdBCIwul27p7cX8yeUamNafK3g2iQSt80pWg5
	 I9lMjCivTk04VKcuFrweOg4a1VqP2a/5FmEU3/Rpx36mxJM5ASM1gfj64gQ20WlcLj
	 OgLF2l4BiMnKRRQ8hHIzQ7YWKfGFqgxlYMJXQzAw=
Date: Tue, 4 Apr 2023 05:25:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: Re: [PATCH 13/24] staging: media: omap4iss: Convert to platform
 remove callback returning void
Message-ID: <20230404022545.GB16648@pendragon.ideasonboard.com>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-14-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403154014.2564054-14-u.kleine-koenig@pengutronix.de>

Hi Uwe,

Thank you for the patch.

On Mon, Apr 03, 2023 at 05:40:03PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/omap4iss/iss.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index fa2a36d829d3..0c4283bb48ad 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -1323,15 +1323,13 @@ static int iss_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int iss_remove(struct platform_device *pdev)
> +static void iss_remove(struct platform_device *pdev)
>  {
>  	struct iss_device *iss = platform_get_drvdata(pdev);
>  
>  	iss_unregister_entities(iss);
>  	media_entity_enum_cleanup(&iss->crashed);
>  	iss_cleanup_modules(iss);
> -
> -	return 0;
>  }
>  
>  static const struct platform_device_id omap4iss_id_table[] = {
> @@ -1342,7 +1340,7 @@ MODULE_DEVICE_TABLE(platform, omap4iss_id_table);
>  
>  static struct platform_driver iss_driver = {
>  	.probe		= iss_probe,
> -	.remove		= iss_remove,
> +	.remove_new	= iss_remove,
>  	.id_table	= omap4iss_id_table,
>  	.driver = {
>  		.name	= "omap4iss",

-- 
Regards,

Laurent Pinchart
