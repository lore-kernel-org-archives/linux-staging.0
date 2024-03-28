Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F71BC31
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666994; cv=none; b=D1ZFei4CK3tYVm0fPQm3lyJ/FroujKSypliPSNsmI/G+nGqrvMf93VHh2DrxLhJ1KTaNmBRc0s15UKIVySzEwB8FrotUyo9qtOjIzf8tCfLDIY/p3gAclo2q0ORl8yoodAl2Y/kE80BaTaq5aNz62CuowV045TtISC6O4nUg+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666994; c=relaxed/simple;
	bh=tFpDQ42UeWPW1S6sVNWAVeCh92rIh75c4irLwAmzcgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjkRYYKMMwHnKQYgbSkJ/ra7hZ6977V3d4UQZBoJ8Ewid1i0gE09yQFoy4jgVepTM8xG5zxRObdVRnA8hZsLujf6MXCDrKH5gTijmtcNb56LYN7rpU3dHRzKqfVP3dAOmN0fUJr1yL6ZZEXsdxwQt+mNcZlt5MjXdMalkZ30UZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=birCHw4T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="birCHw4T"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41C27669;
	Fri, 29 Mar 2024 00:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711666958;
	bh=tFpDQ42UeWPW1S6sVNWAVeCh92rIh75c4irLwAmzcgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=birCHw4TI2BI2qvNfORUs/aB1SfaMWhv/fU7eykx5Yz/yvXgv/lsZTsYbzu+fiG/f
	 2ZVRiTs8FjhaA4YPSeLYeTDr4UePELdfDoJ2uFBWERkcG0GxPlZj5ntXMMqLXLZRBr
	 qumqVU4MhZEw+zETB80235JEWEFqV1pyVdiXrw4Q=
Date: Fri, 29 Mar 2024 01:03:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 09/11] staging: vc04_services: vchiq_mmal: Rename
 service_callback()
Message-ID: <20240328230301.GM11463@pendragon.ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
 <20240328181134.1548799-10-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328181134.1548799-10-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 28, 2024 at 11:41:31PM +0530, Umang Jain wrote:
> Rename the service_callback static function to mmal_service_callback()
> since the function signature conflicts with:
> 
> extern int
> service_callback(struct vchiq_instance *vchiq_instance, enum vchiq_reason reason,
>                  struct vchiq_header *header, unsigned int handle, void *bulk_userdata);
> 
> in vc04_services/interface/vchiq_arm/vchiq_arm.h

I would rename this function too. It can be done in a separate patch.

> 
> In a subsequent patch, we will include vchiq_arm.h header to
> mmal-vchiq.c, which will then complain of this conflict. Hence,
> this patch is meant to handle the conflict beforehand.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 258aa0e37f55..e9cac8f3f744 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -548,9 +548,9 @@ static void bulk_abort_cb(struct vchiq_mmal_instance *instance,
>  }
>  
>  /* incoming event service callback */
> -static int service_callback(struct vchiq_instance *vchiq_instance,
> -			    enum vchiq_reason reason, struct vchiq_header *header,
> -			    unsigned int handle, void *bulk_ctx)
> +static int mmal_service_callback(struct vchiq_instance *vchiq_instance,
> +				 enum vchiq_reason reason, struct vchiq_header *header,
> +				 unsigned int handle, void *bulk_ctx)
>  {
>  	struct vchiq_mmal_instance *instance = vchiq_get_service_userdata(vchiq_instance, handle);
>  	u32 msg_len;
> @@ -1861,7 +1861,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
>  		.version		= VC_MMAL_VER,
>  		.version_min		= VC_MMAL_MIN_VER,
>  		.fourcc			= VCHIQ_MAKE_FOURCC('m', 'm', 'a', 'l'),
> -		.callback		= service_callback,
> +		.callback		= mmal_service_callback,
>  		.userdata		= NULL,
>  	};
>  

-- 
Regards,

Laurent Pinchart
