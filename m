Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2CA13F425
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571330; cv=none; b=uBQCLu3Fb7nUt4CqmQN51bMJtGBvTC4pl1Xb2r/Qh0BiRv+tRIPdnNXD9+GdVQafZvE5lRHjOH8LB4IoP4PhYNx6qfRNFE8s1TguSL3yw045CSOUeGI3KoEsyjKtZELppyFNCej8yfm/FdxA8WEdIL11aoeQ5foyQNDjYDaG/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571330; c=relaxed/simple;
	bh=HWAYXHPhgPpcmgh/5gPuvaPPXgphUbzczsAXDQJ5gLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUuaLNmp2l+HHHgfiGuDZW8iQHg8A3peYzVTf+KDipfqWvsEh+/OXixvuLFFa/dWRllkFS3jWyyG4j0VVHo+EjaFnvQi4qJFUYrqXVH1s7S2LeCcs1iPx4ouU0pz148SZvutFT906QGeLiWb0zTWGnmnGYO24rAyxk+hImYVFGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fbYKg56y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fbYKg56y"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35821BEB;
	Wed,  5 Jun 2024 09:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717571319;
	bh=HWAYXHPhgPpcmgh/5gPuvaPPXgphUbzczsAXDQJ5gLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbYKg56y2FgD5yZSsguM9nFhkKAKom98Zjh2X2e0vUlqbvHupyikWUIr7SRcW19bd
	 wie6P+0o6sjpQyUkliSKUazBwiziwtk6H09ajTeOBQBxPZgbLvYV2FVzUFOUU84u+v
	 dRRlWROs3tL/rKtZpT7+OflmOvft+NfP/3TlVJzk=
Date: Wed, 5 Jun 2024 10:08:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/11] staging: vchiq_arm: Drop vchiq_arm_init_state
Message-ID: <20240605070831.GB3488@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-7-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-7-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:28:59PM +0200, Stefan Wahren wrote:
> After removal of struct vchiq_2835_state, the init of vchiq_arm_state
> can be simplified by doing it directly within vchiq_platform_init_state.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 27 +++++++------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 98a0b2d52af5..45acca670bbd 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -588,23 +588,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>  	return 0;
>  }
> 
> -static void
> -vchiq_arm_init_state(struct vchiq_state *state,
> -		     struct vchiq_arm_state *arm_state)
> -{
> -	if (arm_state) {
> -		rwlock_init(&arm_state->susp_res_lock);
> -
> -		init_completion(&arm_state->ka_evt);
> -		atomic_set(&arm_state->ka_use_count, 0);
> -		atomic_set(&arm_state->ka_use_ack_count, 0);
> -		atomic_set(&arm_state->ka_release_count, 0);
> -
> -		arm_state->state = state;
> -		arm_state->first_connect = 0;
> -	}
> -}
> -
>  int
>  vchiq_platform_init_state(struct vchiq_state *state)
>  {
> @@ -614,7 +597,15 @@ vchiq_platform_init_state(struct vchiq_state *state)
>  	if (!platform_state)
>  		return -ENOMEM;
> 
> -	vchiq_arm_init_state(state, platform_state);
> +	rwlock_init(&platform_state->susp_res_lock);
> +
> +	init_completion(&platform_state->ka_evt);
> +	atomic_set(&platform_state->ka_use_count, 0);
> +	atomic_set(&platform_state->ka_use_ack_count, 0);
> +	atomic_set(&platform_state->ka_release_count, 0);
> +
> +	platform_state->state = state;
> +
>  	state->platform_state = (struct opaque_platform_state *)platform_state;
> 
>  	return 0;

-- 
Regards,

Laurent Pinchart
