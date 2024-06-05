Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938721C185
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571799; cv=none; b=OQSrMYY9KgGNAc/R4RmzB0U8s/4/YbJzI2IThhsZ5SfPXe2MDgavMotZ16VyhuBDZadZRJd/+Maahj4eGcNJTlBPHdNJgsqAb55z9uwDX+RnK0JMH/ZGyOCZkuK0bwxxbENsTsMIRPkRL4uVrkfPAVWeQO5HFDT38pqKy8BFzIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571799; c=relaxed/simple;
	bh=1ESLAowMP1JRP9ka+WuhpLYX0ZkJUOoxoJbrwEM2aKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1U7YtbHzqOy/Pa1PqNjdCtw/PKSu4Ij+tfb8o1WpFvq5bZPEPMpjHoHZUDeqWNMy5nT1Fpv+TYumeNDS2ZTjOdTnQAVr9DmOkEbtXFKliDzQcrX3lDlhxrYBQRc2O7mcXOC2lmb7ODKGp4s0fgll/MUEOMv4IuC0/HcDegXams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c1TwfO/G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c1TwfO/G"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29DA2BEB;
	Wed,  5 Jun 2024 09:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717571788;
	bh=1ESLAowMP1JRP9ka+WuhpLYX0ZkJUOoxoJbrwEM2aKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1TwfO/GAax7ct/52TTuN9exPeul25B1Cqi+Od6+JdFO1ijmlejuny4Fm/O7hqlGC
	 Cn9jw2WDFKlDPqZBcx2wyKysk81Wq4jHilK/Y1lf6U+9VDM3SRr+EIrFf2r+H16VPE
	 41xVYv0DRgj/VrevZ3NJ5oED+ahOOHMMwgjr+3Ts=
Date: Wed, 5 Jun 2024 10:16:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/11] staging: vchiq: Move struct vchiq_config to vchiq.h
Message-ID: <20240605071619.GI879@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-10-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-10-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:29:02PM +0200, Stefan Wahren wrote:
> This struct is part of the VCHIQ userspace API, which we
> don't want to break. So move the struct definition to
> vchiq.h, which contains the rest of the userspace API.

Dies it ? vchiq.h contains lots of kernel API elements. Beside, we have
headers such as vc04_services/interface/vchiq_arm/vchiq_ioctl.h that
contain UAPI elements.

Splitting the UAPI to separate headers is a good idea. Could you address
that task as a whole, and create a
drivers/staging/vc04_services/include/uapi/linux/raspberrypi/vchiq.h
file for the whole UAPI ?

> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../vc04_services/include/linux/raspberrypi/vchiq.h  | 12 ++++++++++++
>  .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 ------------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> index 6c40d8c1dde6..2e34c67966c6 100644
> --- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> +++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> @@ -79,6 +79,18 @@ struct vchiq_service_params_kernel {
>  	short version_min;   /* Update for incompatible changes */
>  };
> 
> +struct vchiq_config {
> +	unsigned int max_msg_size;
> +	unsigned int bulk_threshold;	/* The message size above which it
> +					 * is better to use a bulk transfer
> +					 * (<= max_msg_size)
> +					 */
> +	unsigned int max_outstanding_bulks;
> +	unsigned int max_services;
> +	short version;      /* The version of VCHIQ */
> +	short version_min;  /* The minimum compatible version of VCHIQ */
> +};
> +
>  extern int vchiq_initialise(struct vchiq_state *state,
>  			    struct vchiq_instance **pinstance);
>  extern int vchiq_shutdown(struct vchiq_instance *instance);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 3abcd6910f25..a83f9a5d478f 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -423,18 +423,6 @@ struct bulk_waiter {
>  	int actual;
>  };
> 
> -struct vchiq_config {
> -	unsigned int max_msg_size;
> -	unsigned int bulk_threshold;	/* The message size above which it
> -					 * is better to use a bulk transfer
> -					 * (<= max_msg_size)
> -					 */
> -	unsigned int max_outstanding_bulks;
> -	unsigned int max_services;
> -	short version;      /* The version of VCHIQ */
> -	short version_min;  /* The minimum compatible version of VCHIQ */
> -};
> -
>  extern spinlock_t bulk_waiter_spinlock;
> 
>  extern const char *

-- 
Regards,

Laurent Pinchart
