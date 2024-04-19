Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547D8562A
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713537895; cv=none; b=f4117FRtfRrcj68dHo6kL5qieRLjL9L3KhQBd2RkoYIijP7U2hBOoQd4lSNxFEdaodRder40XPLiMsQRxF1cFiG11W7gaLZLLF5zmlDMg5P7F66mD0/P1GzXexR58hPc6E8CrKNTcNKZ5x4y95HecRi+aPr6EgVC/wbcpK2CseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713537895; c=relaxed/simple;
	bh=EvZgC+kP98rW3CFhweIZhPbSFstr2g2WGPhQ9gha744=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOVoJ4gCXrWP5Wm0O+15d3OfCEf0mqrYLKQrVXRMzSbPie7k8C3HN6IuvwBNZV1ks2sWsYxxMjnsIlwQifjfEHjxhu5c31eFA1DSW3hgYC4oKoDPTXvxiT8xTbyp2Zo0SDImNEprKRAbJNOaIPVODWdkD+Obn5w+5ef8hNVcWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CNHh/HaC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CNHh/HaC"
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A5B38D0;
	Fri, 19 Apr 2024 16:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713537842;
	bh=EvZgC+kP98rW3CFhweIZhPbSFstr2g2WGPhQ9gha744=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNHh/HaCZOpw4PkYAJerVNqCkFC/Kt8bJN/OZSLCN3a+7Bg44Ume2PLjo7L4Qucig
	 glHpo392utqZ2fcDqj6S68dpRprrqNCL6Ri98xsBTtrwXfbZdWMArzD59P/EXQfgBl
	 54WwV79aRsNw+2RoaoAOx3USx95wWFELJSEw4ATU=
Date: Fri, 19 Apr 2024 17:44:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: vc04_services: vchiq_arm: Fix NULL ptr
 dereferences
Message-ID: <20240419144442.GA6414@pendragon.ideasonboard.com>
References: <20240419142650.206583-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240419142650.206583-1-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Fri, Apr 19, 2024 at 04:26:50PM +0200, Stefan Wahren wrote:
> The commit 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop
> g_cache_line_size") introduced NULL pointer dereferences by
> messing up usage of device driver data. But the real issue here
> is the mixed usage of platform and device driver data. So fix
> this by switching completely to device driver data.
> 
> Fixes: 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop g_cache_line_size")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 502ddc0f6e46..3b032d987f0c 100644
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
> @@ -497,7 +497,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>  static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct vchiq_drv_mgmt *drv_mgmt = platform_get_drvdata(pdev);
> +	struct vchiq_drv_mgmt *drv_mgmt = dev_get_drvdata(dev);

This hunk and the next one seem to be no-ops. Did you intend to make
cosmetic changes here, or was something overlooked ?

>  	struct rpi_firmware *fw = drv_mgmt->fw;
>  	struct vchiq_slot_zero *vchiq_slot_zero;
>  	void *slot_mem;
> @@ -1753,7 +1753,7 @@ static int vchiq_probe(struct platform_device *pdev)
>  		return -EPROBE_DEFER;
> 
>  	mgmt->info = info;
> -	platform_set_drvdata(pdev, mgmt);
> +	dev_set_drvdata(&pdev->dev, mgmt);
> 
>  	err = vchiq_platform_init(pdev, &mgmt->state);
>  	if (err)

-- 
Regards,

Laurent Pinchart
