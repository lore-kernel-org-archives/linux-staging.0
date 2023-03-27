Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644EC79C8;
	Mon, 27 Mar 2023 20:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679950152; x=1711486152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Em2RGeXOQa0NDkGV9KidPzTIBoL6pOq5V0VfTCZJxi4=;
  b=Y4zHtAD7UK398vzYnUqeNdh62fD9FLdRnT/Nb3snR9ubsKtNw9x3BgSE
   GYvcRJ0r/eSFUy951MIjtHzZPNcMsQojsPcvpKrJHMPF0sqWenW1HbqB5
   OBj5FpZ96Si3THwyEK5pYtAuj6znGeXXPcfDnKIweJoDFBpsWxNmpbVnm
   SOW7hPP1MutVInsSio0UvaDM+Dq74cF8JoK0NZPbeiWnKI1V7IP077UeL
   IxUrzmSlZrqXhdi0k1jaz2eZC3H9L1zQC8TvzbxuHEY7rpD2r6vXe8+UG
   wootcqavCInNWa7BJVtsABjzcJkKcCUANPIZa3Iny3oUDhwr4CgXmt0NA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324271168"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="324271168"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="929604200"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="929604200"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.255.229.96])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:49:10 -0700
Date: Mon, 27 Mar 2023 13:49:08 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq()
 function
Message-ID: <ZCIBRGDHysqdNDEQ@aschofie-mobl2>
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>

On Tue, Mar 28, 2023 at 01:18:53AM +0500, Khadija Kamran wrote:
> Refactor function by adding goto statement. This reduces the
> indentation and fixes the issue reported by checkpatch.pl script.

It seems our emails may have crossed on this issue.

See: https://lore.kernel.org/outreachy/ZBrFqtyY%2FHydnBdT@kroah.com/T/#m5ac406a1ebef0ee5c013b6db75ce1368e292c179

Alison

> 
> "CHECK: line length of 101 exceeds 100 columns"
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..c7d3b6f7368f 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 */
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> -							       flags);
> -					return IRQ_WAKE_THREAD;
> +					goto out;
>  				}
>  			}
>  		}
> @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>  
>  	return IRQ_HANDLED;
> +
> +out:
> +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> +	return IRQ_WAKE_THREAD;
>  }
>  
>  /*
> -- 
> 2.34.1
> 
> 
