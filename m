Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73715AC0
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 23:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d72nfp+n"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAA7B83F;
	Mon, 30 Oct 2023 00:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698623154;
	bh=tud3zNbH7C5LrMzJvG7ZKK47ATz69dzd2aK3sf4w30M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d72nfp+nAP8csoZO/gAwzz5IugtKdPaV9Y2Bk5dsGWo+u0tju5C08qwLc6VWp84v8
	 PHhUYdR59Z4CdCEK/jYSuwIyQEesKVBrHvVNp6TRCiMy5fsR/e7OapBR0mhsmK/YxG
	 xb2NbTk4BF9ktB4D91SwWsl5sSo6joO3QqBrVmkQ=
Date: Mon, 30 Oct 2023 01:46:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH V2 2/3] staging: vchiq_core: Shorten bulk TX/RX pending
 dump
Message-ID: <20231029234615.GI12144@pendragon.ideasonboard.com>
References: <20231029124837.119832-1-wahrenst@gmx.net>
 <20231029124837.119832-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231029124837.119832-3-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Sun, Oct 29, 2023 at 01:48:36PM +0100, Stefan Wahren wrote:
> The calculation for the bulk TX/RX pending is complex and
> reaches 99 chars per line. So move the size determination
> below the pending calculation and get the rid of the
> ternary operator.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_core.c          | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 94073f92651a..36c742a2f3b2 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -3447,7 +3447,7 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
>  		struct vchiq_service_quota *quota =
>  			&service->state->service_quotas[service->localport];
>  		int fourcc = service->base.fourcc;
> -		int tx_pending, rx_pending;
> +		int tx_pending, rx_pending, tx_size = 0, rx_size = 0;
> 
>  		if (service->remoteport != VCHIQ_PORT_FREE) {
>  			int len2 = scnprintf(remoteport, sizeof(remoteport),
> @@ -3472,18 +3472,23 @@ vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
> 
>  		tx_pending = service->bulk_tx.local_insert -
>  			service->bulk_tx.remote_insert;
> +		if (tx_pending) {
> +			unsigned int i = BULK_INDEX(service->bulk_tx.remove);
> +
> +			tx_size = service->bulk_tx.bulks[i].size;
> +		}
> 
>  		rx_pending = service->bulk_rx.local_insert -
>  			service->bulk_rx.remote_insert;
> +		if (rx_pending) {
> +			unsigned int i = BULK_INDEX(service->bulk_rx.remove);
> +
> +			rx_size = service->bulk_rx.bulks[i].size;
> +		}
> 
>  		len = scnprintf(buf, sizeof(buf),
>  				"  Bulk: tx_pending=%d (size %d), rx_pending=%d (size %d)",
> -				tx_pending,
> -				tx_pending ?
> -				service->bulk_tx.bulks[BULK_INDEX(service->bulk_tx.remove)].size :
> -				0, rx_pending, rx_pending ?
> -				service->bulk_rx.bulks[BULK_INDEX(service->bulk_rx.remove)].size :
> -				0);
> +				tx_pending, tx_size, rx_pending, rx_size);
> 
>  		if (VCHIQ_ENABLE_STATS) {
>  			err = vchiq_dump(dump_context, buf, len + 1);

-- 
Regards,

Laurent Pinchart
