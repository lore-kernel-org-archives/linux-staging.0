Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA77B
	for <linux-staging@lists.linux.dev>; Thu, 28 Apr 2022 05:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEBFC385A0;
	Thu, 28 Apr 2022 05:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651124192;
	bh=W+skY9yUEL0OAM6VVty2lXt20EE+p8SAZWb/wne2n0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9nZNRRl8vxn7YgCBDCJHGnRdTbnqpR4CB/do+AaJxDjlDC4sjXEuxslQkfYI0YOH
	 +8IHoT9BX4tuGFHbCI0BTRacyvc0/oPRmwlHGHhzzdS8qmlyfM4mir6fpFcEPQ+3DE
	 8LH5Lq6C6fySHgPG+rsRPCYO4DcmpG+1vjaTXCkI=
Date: Thu, 28 Apr 2022 07:36:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrien Thierry <athierry@redhat.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: use standard print helpers
Message-ID: <Ymon2OgJhbwaH2H8@kroah.com>
References: <20220427182439.424963-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427182439.424963-1-athierry@redhat.com>

On Wed, Apr 27, 2022 at 02:24:37PM -0400, Adrien Thierry wrote:
> Replace the custom debug print macros with the standard dev_err() and
> friends.
> 
> This handles TODO item "Cleanup logging mechanism".
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 158 +++---
>  .../interface/vchiq_arm/vchiq_connected.c     |   7 +-
>  .../interface/vchiq_arm/vchiq_connected.h     |   4 +-
>  .../interface/vchiq_arm/vchiq_core.c          | 495 ++++++++----------
>  .../interface/vchiq_arm/vchiq_core.h          |  43 +-
>  .../interface/vchiq_arm/vchiq_debugfs.c       | 105 ----
>  .../interface/vchiq_arm/vchiq_dev.c           |  88 ++--
>  7 files changed, 344 insertions(+), 556 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 0596ac61e286..664940e6d9e9 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -58,10 +58,6 @@
>  #define KEEPALIVE_VER 1
>  #define KEEPALIVE_VER_MIN KEEPALIVE_VER
>  
> -/* Run time control of log level, based on KERN_XXX level. */
> -int vchiq_arm_log_level = VCHIQ_LOG_DEFAULT;
> -int vchiq_susp_log_level = VCHIQ_LOG_ERROR;
> -
>  DEFINE_SPINLOCK(msg_queue_spinlock);
>  struct vchiq_state g_state;
>  
> @@ -253,7 +249,7 @@ create_pagelist(char *buf, char __user *ubuf,
>  	pagelist = dma_alloc_coherent(g_dev, pagelist_size, &dma_addr,
>  				      GFP_KERNEL);
>  
> -	vchiq_log_trace(vchiq_arm_log_level, "%s - %pK", __func__, pagelist);
> +	dev_dbg(g_dev, "%s - %pK", __func__, pagelist);

As dev_dbg() provides the output of the function name, there's no need
to keep it in here when you convert to using it.  Can you fix this up
and resend?

thanks,

greg k-h
