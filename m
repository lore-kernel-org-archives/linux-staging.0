Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C69A15E88
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610473; cv=none; b=O0AW/k9XG6+jWAtrBHTI+DgaDVBrmPpBdvr/Rf1udNs/z9CoUpkrS5Y3zfd9xdSG3w34FIajv2i5V7HGhG82HkBBR70cFaTj/pa8PUiD+M23Xa4fy9mGDx81Mmnr0WZ0WGw25PEPHoPwZ7zNgd5bqu3ofPuxwwO2ec2atXwU0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610473; c=relaxed/simple;
	bh=oOOjWnG8y8qjRys3yjCEii5n6nxTX+J51/N+FQTnwfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBB0GFmDi4jR6q89nN3otg4wRaXEnPI7WTD8+WGVB7m2GhmjHTnP1CW6F8RKfHyOzSk7WtnPOEIq7k6LvC1s0FQFSC7h0o0rWD1jTY2HAoZENHAv9eNOvyvUbE/BOqfv4WcZ3ljQgpnOKFslGtWvmEvHFobxsHKJ4t926v4bJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OXsCBWAg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OXsCBWAg"
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F81F1A2;
	Sat, 20 Apr 2024 12:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713610420;
	bh=oOOjWnG8y8qjRys3yjCEii5n6nxTX+J51/N+FQTnwfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXsCBWAg+5xLe3UZNmSUijKujjQgcdKsdcj+GvTyPgj/etsTrFuFjpzSMkFRRWj+3
	 9uJOrKLzzTu6xPbLILf4YDy6Q2HS3wihF4LyUYy+Ajor0pKd2hqGs1ncc2nXwzQzyL
	 2M+siWUj4/MKyGzQ+dhArhZQFw5EqHyamrdRRazA=
Date: Sat, 20 Apr 2024 13:54:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] staging: vc04_services: vchiq_arm: Fix NULL ptr
 dereferences
Message-ID: <20240420105420.GF6414@pendragon.ideasonboard.com>
References: <20240420091240.9552-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240420091240.9552-1-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Sat, Apr 20, 2024 at 11:12:40AM +0200, Stefan Wahren wrote:
> The commit 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop
> g_cache_line_size") introduced NULL pointer dereferences by
> using the wrong device.
> 
> Fixes: 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop g_cache_line_size")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in V2:
> - drop cosmetic changes as noticed by Laurent
> 
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 502ddc0f6e46..c06232fcb0fb 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -257,7 +257,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
>  	if (count >= INT_MAX - PAGE_SIZE)
>  		return NULL;
> 
> -	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
> +	drv_mgmt = dev_get_drvdata(instance->state->dev);
> 
>  	if (buf)
>  		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
> @@ -436,7 +436,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> 
>  	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
> 
> -	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
> +	drv_mgmt = dev_get_drvdata(instance->state->dev);
> 
>  	/*
>  	 * NOTE: dma_unmap_sg must be called before the

-- 
Regards,

Laurent Pinchart
