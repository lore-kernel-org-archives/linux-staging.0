Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F4D2ED
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 23:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HbLXaHTQ"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 053B083F;
	Mon, 30 Oct 2023 00:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698623060;
	bh=5kHJo1bcTjk4PEua+5BhlwYXe0nsOaz88S+sHX3FDaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbLXaHTQiMSf3+V1gVIeK+6/L+wnmPf5yQX8ShKh9UvIho00PtcVql+5iioPSSkoP
	 NLTitB4Llu0oMCD9VpXbU7xsQUH32YVtv+8Se9b6Zg1WZPDtYOCOPZ0kWMCRUBDTjI
	 gCu25P0dK9B5zhX5kJTNlPUk6jAZCM8FrjepwixM=
Date: Mon, 30 Oct 2023 01:44:41 +0200
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
Subject: Re: [PATCH V2 1/3] staging: vchiq_core: Make
 vchiq_dump_service_state static
Message-ID: <20231029234441.GH12144@pendragon.ideasonboard.com>
References: <20231029124837.119832-1-wahrenst@gmx.net>
 <20231029124837.119832-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231029124837.119832-2-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Sun, Oct 29, 2023 at 01:48:35PM +0100, Stefan Wahren wrote:
> The function vchiq_dump_service_state() is only used by vchiq_dump_state()
> within vchiq_core.c. So move the definition of vchiq_dump_state() below
> vchiq_dump_service_state() in order to make it static.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

I don't remember suggesting this, but that's fine, it looks like a good
change :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_core.c          | 169 +++++++++---------
>  .../interface/vchiq_arm/vchiq_core.h          |   3 -
>  2 files changed, 85 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 39b857da2d42..94073f92651a 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -3428,90 +3428,8 @@ vchiq_dump_shared_state(void *dump_context, struct vchiq_state *state,
>  	return 0;
>  }
> 
> -int vchiq_dump_state(void *dump_context, struct vchiq_state *state)
> -{
> -	char buf[80];
> -	int len;
> -	int i;
> -	int err;
> -
> -	len = scnprintf(buf, sizeof(buf), "State %d: %s", state->id,
> -			conn_state_names[state->conn_state]);
> -	err = vchiq_dump(dump_context, buf, len + 1);
> -	if (err)
> -		return err;
> -
> -	len = scnprintf(buf, sizeof(buf), "  tx_pos=%x(@%pK), rx_pos=%x(@%pK)",
> -			state->local->tx_pos,
> -			state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
> -			state->rx_pos,
> -			state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
> -	err = vchiq_dump(dump_context, buf, len + 1);
> -	if (err)
> -		return err;
> -
> -	len = scnprintf(buf, sizeof(buf), "  Version: %d (min %d)",
> -			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
> -	err = vchiq_dump(dump_context, buf, len + 1);
> -	if (err)
> -		return err;
> -
> -	if (VCHIQ_ENABLE_STATS) {
> -		len = scnprintf(buf, sizeof(buf),
> -				"  Stats: ctrl_tx_count=%d, ctrl_rx_count=%d, error_count=%d",
> -				state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
> -				state->stats.error_count);
> -		err = vchiq_dump(dump_context, buf, len + 1);
> -		if (err)
> -			return err;
> -	}
> -
> -	len = scnprintf(buf, sizeof(buf),
> -			"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
> -			((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
> -			state->local_tx_pos) / VCHIQ_SLOT_SIZE,
> -			state->data_quota - state->data_use_count,
> -			state->local->slot_queue_recycle - state->slot_queue_available,
> -			state->stats.slot_stalls, state->stats.data_stalls);
> -	err = vchiq_dump(dump_context, buf, len + 1);
> -	if (err)
> -		return err;
> -
> -	err = vchiq_dump_platform_state(dump_context);
> -	if (err)
> -		return err;
> -
> -	err = vchiq_dump_shared_state(dump_context,
> -				      state,
> -				      state->local,
> -				      "Local");
> -	if (err)
> -		return err;
> -	err = vchiq_dump_shared_state(dump_context,
> -				      state,
> -				      state->remote,
> -				      "Remote");
> -	if (err)
> -		return err;
> -
> -	err = vchiq_dump_platform_instances(dump_context);
> -	if (err)
> -		return err;
> -
> -	for (i = 0; i < state->unused_service; i++) {
> -		struct vchiq_service *service = find_service_by_port(state, i);
> -
> -		if (service) {
> -			err = vchiq_dump_service_state(dump_context, service);
> -			vchiq_service_put(service);
> -			if (err)
> -				return err;
> -		}
> -	}
> -	return 0;
> -}
> -
> -int vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
> +static int
> +vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
>  {
>  	char buf[80];
>  	int len;
> @@ -3606,6 +3524,89 @@ int vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
>  	return err;
>  }
> 
> +int vchiq_dump_state(void *dump_context, struct vchiq_state *state)
> +{
> +	char buf[80];
> +	int len;
> +	int i;
> +	int err;
> +
> +	len = scnprintf(buf, sizeof(buf), "State %d: %s", state->id,
> +			conn_state_names[state->conn_state]);
> +	err = vchiq_dump(dump_context, buf, len + 1);
> +	if (err)
> +		return err;
> +
> +	len = scnprintf(buf, sizeof(buf), "  tx_pos=%x(@%pK), rx_pos=%x(@%pK)",
> +			state->local->tx_pos,
> +			state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
> +			state->rx_pos,
> +			state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
> +	err = vchiq_dump(dump_context, buf, len + 1);
> +	if (err)
> +		return err;
> +
> +	len = scnprintf(buf, sizeof(buf), "  Version: %d (min %d)",
> +			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
> +	err = vchiq_dump(dump_context, buf, len + 1);
> +	if (err)
> +		return err;
> +
> +	if (VCHIQ_ENABLE_STATS) {
> +		len = scnprintf(buf, sizeof(buf),
> +				"  Stats: ctrl_tx_count=%d, ctrl_rx_count=%d, error_count=%d",
> +				state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
> +				state->stats.error_count);
> +		err = vchiq_dump(dump_context, buf, len + 1);
> +		if (err)
> +			return err;
> +	}
> +
> +	len = scnprintf(buf, sizeof(buf),
> +			"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
> +			((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
> +			state->local_tx_pos) / VCHIQ_SLOT_SIZE,
> +			state->data_quota - state->data_use_count,
> +			state->local->slot_queue_recycle - state->slot_queue_available,
> +			state->stats.slot_stalls, state->stats.data_stalls);
> +	err = vchiq_dump(dump_context, buf, len + 1);
> +	if (err)
> +		return err;
> +
> +	err = vchiq_dump_platform_state(dump_context);
> +	if (err)
> +		return err;
> +
> +	err = vchiq_dump_shared_state(dump_context,
> +				      state,
> +				      state->local,
> +				      "Local");
> +	if (err)
> +		return err;
> +	err = vchiq_dump_shared_state(dump_context,
> +				      state,
> +				      state->remote,
> +				      "Remote");
> +	if (err)
> +		return err;
> +
> +	err = vchiq_dump_platform_instances(dump_context);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < state->unused_service; i++) {
> +		struct vchiq_service *service = find_service_by_port(state, i);
> +
> +		if (service) {
> +			err = vchiq_dump_service_state(dump_context, service);
> +			vchiq_service_put(service);
> +			if (err)
> +				return err;
> +		}
> +	}
> +	return 0;
> +}
> +
>  int vchiq_send_remote_use(struct vchiq_state *state)
>  {
>  	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 161358db457c..ea8d58844775 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -507,9 +507,6 @@ vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *
>  extern int
>  vchiq_dump_state(void *dump_context, struct vchiq_state *state);
> 
> -extern int
> -vchiq_dump_service_state(void *dump_context, struct vchiq_service *service);
> -
>  extern void
>  vchiq_loud_error_header(void);
> 

-- 
Regards,

Laurent Pinchart
