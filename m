Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE1190488
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717570394; cv=none; b=hWbdj39/DE7oUtLq7WrOMBjE7bAsTL7QCF3twSAVkDiPwE08zOae9JKjUkDWMxWL2XV+eUsw4K4D7B+BD+yKBTr0pMyW/09/jTVjYCFkvHLlwbR4Xx0A0Tc7jmYfhIcWMJVNJ4YxIlmrRQ69B8cGTciVC4CUlKrD13bN97rEDgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717570394; c=relaxed/simple;
	bh=mwryQMj9zZer12GOO+D0qdHkKPN+qd4eU1TTGFQz3d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUqvL7W+8V7MJlY/qV9xvbRCBgqXba9T5KQvl6SXsxEdSOoGCP6u/5tjRPH/S0KB1pccwYEfNQxOQ6H8YxS3sMx/iBBSwVPZOCXo7Ucv0REXUrhrl5AuWF4jBtIctBnEFjbpzzG0pZge2vgOQQCSOBO8kx6jwjw7U5ZMU3wQ3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iU7CEiOn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iU7CEiOn"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B978C16D4;
	Wed,  5 Jun 2024 08:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717570382;
	bh=mwryQMj9zZer12GOO+D0qdHkKPN+qd4eU1TTGFQz3d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iU7CEiOnAT9/X+Tp7rXiJ41QPVKcThle+EiJzgaT3nTjFsDhj4o1w2CBCbgK6lyHU
	 MxdgyFbPFl1WvfJZpsCaUCrdwbAQzPbriC2dhwyh25WCVd5iaAWpUmpuS0wL7yZXBI
	 7EHJtPKp3YidEtH1pZZQBBXSC6LWEpF5Cr9uZK/k=
Date: Wed, 5 Jun 2024 09:52:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] staging: vchiq_arm: Drop obsolete comment
Message-ID: <20240605065253.GD879@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-3-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:28:55PM +0200, Stefan Wahren wrote:
> The BUG_ON has been replaced with WARN_ON. So we can drop the
> comment.

Note https://lwn.net/Articles/969923/ :-)

This being said, I think the comment can be dropped, regardless of
whether or not we drop the WARN_ON() later.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index e2f4aa00cb70..515cdcba043d 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1451,7 +1451,6 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
> 
>  	write_lock_bh(&arm_state->susp_res_lock);
>  	if (!arm_state->videocore_use_count || !(*entity_uc)) {
> -		/* Don't use BUG_ON - don't allow user thread to crash kernel */
>  		WARN_ON(!arm_state->videocore_use_count);
>  		WARN_ON(!(*entity_uc));
>  		ret = -EINVAL;

-- 
Regards,

Laurent Pinchart
