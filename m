Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EFFBA34
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 21:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718141153; cv=none; b=cycMGt9LseGP4LSrfH9l+nsoc8s9DpAnhK3ZCkOtso3ir7Cg5l/dcxivAi09J4SmTaQiTlETU/JAOeUoqOAQZqtLX4DQzcdY+pPc1cHWnh1EFNnIccqLcUhVlaZqwD9Vr62MyDWfADh2ccYc4hg+eW6dk1mrz5gWDwxiQuvSbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718141153; c=relaxed/simple;
	bh=PJx9c38KWj7AAwOnRB6KVIEEYvCT18jAmmiFIEns1EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP1IGApkfHyWcK4Af0PfpbmrHAnvIVq2nJ+EwF+O9Ux1v28/FMRNNeB0hBI+qewKNgFWdzwwW7xB19+sp81uYGVSITZWUcK2MLUQKfsDWYIvD8kDYAXsaQmi6Po+Bvi1CX1sq8mFq7ZZBZdp/afhL6xTiLuoTX4bsDFtsNdADxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aRALIufb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aRALIufb"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1A49512;
	Tue, 11 Jun 2024 23:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718141137;
	bh=PJx9c38KWj7AAwOnRB6KVIEEYvCT18jAmmiFIEns1EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRALIufb0KpSwRKk962z4w71QI7/qZiEjOOKWPfZUN7DUwTVJa71B28CMQbM+lNbF
	 RrmRazb1mwIzGFNVsbDUpc6ZkmORHVCKfPKW6jLrMcP3ELosdSlFINF3KdeOXYn9kD
	 fWfWwx198dScWwlTpccCUZpngxQGoB3lIe06SV+E=
Date: Wed, 12 Jun 2024 00:25:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 09/10] staging: vchiq_arm: Don't cast scatter-gather
 elements
Message-ID: <20240611212530.GH10397@pendragon.ideasonboard.com>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-10-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610210220.95524-10-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:02:19PM +0200, Stefan Wahren wrote:
> The kernel uses different types for DMA length & address,
> so better use them.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 706bfc7a0b90..02392073c4aa 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -162,7 +162,7 @@ cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info
>  }
> 
>  static inline bool
> -is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
> +is_adjacent_block(u32 *addrs, dma_addr_t addr, unsigned int k)
>  {
>  	u32 tmp;
> 
> @@ -377,8 +377,8 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
>  	/* Combine adjacent blocks for performance */
>  	k = 0;
>  	for_each_sg(scatterlist, sg, dma_buffers, i) {
> -		u32 len = sg_dma_len(sg);
> -		u32 addr = sg_dma_address(sg);
> +		unsigned int len = sg_dma_len(sg);
> +		dma_addr_t addr = sg_dma_address(sg);
> 
>  		/* Note: addrs is the address + page_count - 1
>  		 * The firmware expects blocks after the first to be page-

-- 
Regards,

Laurent Pinchart
