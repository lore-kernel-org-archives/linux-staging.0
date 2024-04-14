Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2B57308
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713110885; cv=none; b=auRe8uqbabbu13Y+17Sl/ojPOgIBtIn/nc381Dlf2lOWiLI7m0ce80QcNXA00jZDoFYcSq5q5JSveeRbmEy80grZfLtuNfdPyzDktnbCao1KeHZgY5zNNA8IVCv1HWmFVSmx4rrNNpw3V2biAhyhEZv0m6XNCQOFhAlBNr4P82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713110885; c=relaxed/simple;
	bh=/Iiikww/7WxXdJGuopWlHvBLvcjxKF/C+xh/Jeuz054=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgIQrpLAMC4WViRunFYETlvs6mlcYM4AU8u512ZGQom9VBADwcURz+JKX6+C/ske1dHh3IXEnRdxPvpGEeTbqHzOB31nZNVWZhb5Yam2iRlZSu924f/M28LxWE6JHJ1dKjuEGM3lrkm/GirUBNEyT1jImgqdW99wsDK9XXonHnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M1ZUqaoh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M1ZUqaoh"
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AB957E4;
	Sun, 14 Apr 2024 18:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713110836;
	bh=/Iiikww/7WxXdJGuopWlHvBLvcjxKF/C+xh/Jeuz054=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1ZUqaohyBKMXPgXwN4nGQ7MqwgKF/2sQLgUyDzfpHl1K2ezOwcBtRo/kD0hIPq5y
	 UfFHqvTUn5y18TKC/OmLhWX68Wk9LO5eSSs7A7d84YLls/4AOvrn6daSwE7UO6q7OD
	 XOy+SPe5uf/Es6naMT9/C174fdHKRC/tgcm+BrDY=
Date: Sun, 14 Apr 2024 19:07:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: vchiq: Reformat Kconfig help texts
Message-ID: <20240414160753.GA4758@pendragon.ideasonboard.com>
References: <20240414144515.14738-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240414144515.14738-1-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Sun, Apr 14, 2024 at 04:45:15PM +0200, Stefan Wahren wrote:
> The lines in the VCHIQ Kconfig help texts are too long, which makes
> it hard to read the menuconfig. So shorten them to restore the
> readability.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/staging/vc04_services/Kconfig | 33 +++++++++++++++------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> index 31e58c9d1a11..982445dd317b 100644
> --- a/drivers/staging/vc04_services/Kconfig
> +++ b/drivers/staging/vc04_services/Kconfig
> @@ -16,27 +16,30 @@ config BCM2835_VCHIQ
>  	depends on HAS_DMA
>  	imply VCHIQ_CDEV
>  	help
> -		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore. This config
> -		enables the VCHIQ driver, which implements a messaging interface between
> -		the kernel and the firmware running on VideoCore. Other drivers use this
> -		interface to communicate to the VPU. More specifically, the VCHIQ driver is
> -		used by audio/video and camera drivers as well as for implementing MMAL
> -		API, which is in turn used by several multimedia services on the BCM2835
> -		family of SoCs.
> -		Defaults to Y when the Broadcom Videocore services are included in
> -		the build, N otherwise.
> +		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore.
> +		This config enables the VCHIQ driver, which implements a
> +		messaging interface between the kernel and the firmware running
> +		on VideoCore. Other drivers use this interface to communicate to
> +		the VPU. More specifically, the VCHIQ driver is used by
> +		audio/video and camera drivers as well as for implementing MMAL
> +		API, which is in turn used by several multimedia services on the
> +		BCM2835 family of SoCs.

If you want two paragraphs, you should add a blank line here. Otherwise,
you should remove the line break. Same below.

> +		Defaults to Y when the Broadcom Videocore services are included
> +		in the build, N otherwise.
> 
>  if BCM2835_VCHIQ
> 
>  config VCHIQ_CDEV
>  	bool "VCHIQ Character Driver"
>  	help
> -		Enable the creation of VCHIQ character driver. The cdev exposes ioctls used
> -		by userspace libraries and testing tools to interact with VideoCore, via
> -		the VCHIQ core driver (Check BCM2835_VCHIQ for more info).
> -		This can be set to 'N' if the VideoCore communication is not needed by
> -		userspace but only by other kernel modules (like bcm2835-audio).  If not
> -		sure, set this to 'Y'.
> +		Enable the creation of VCHIQ character driver. The cdev exposes
> +		ioctls used by userspace libraries and testing tools to interact
> +		with VideoCore, via the VCHIQ core driver (Check BCM2835_VCHIQ
> +		for more info).
> +		This can be set to 'N' if the VideoCore communication is not
> +		needed by userspace but only by other kernel modules
> +		(like bcm2835-audio).
> +		If not sure, set this to 'Y'.

This should be paired with a "default y", although I think it would be
better to disable it by default. That's unrelated to this patch though,
so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  endif
> 

-- 
Regards,

Laurent Pinchart
