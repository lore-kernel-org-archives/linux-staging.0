Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A34B2F25
	for <linux-staging@lists.linux.dev>; Fri, 17 Jun 2022 09:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925A7C3411B;
	Fri, 17 Jun 2022 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655459610;
	bh=cUiHKQNlCgY+BQSZHof8X01yx5BXsQD0YVh2ujqS/+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZjpC8zAq45HR1sQftYIsWGYp/fCn4s+u+cA1LWqlXA9ALTWxoehhEPorewt9jy/h
	 NXKd7w5QQpNQZcyy6Ukt2IefEaaoGJAO30VRuJ0CcgROKmPCv6KGvnZyfdY+WYkgNi
	 EkDnA/MUJMTvR8Z/Sw62h/vReT943Zf+6Uz6CwLE=
Date: Fri, 17 Jun 2022 11:53:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrien Thierry <athierry@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vchiq_arm: check vchiq_instance for NULL before
 dereferencing
Message-ID: <YqxPGOJIzkd466HM@kroah.com>
References: <20220614182544.690630-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614182544.690630-1-athierry@redhat.com>

On Tue, Jun 14, 2022 at 02:25:44PM -0400, Adrien Thierry wrote:
> In service_callback(), the vchiq_instance is checked for NULL after
> dereferencing it. Switch the order of those operations.
> 
> This was reported by https://lore.kernel.org/all/Yqc+Oavmh0zMRVPQ@kili/
> 
> I moved the NULL check before the call to rcu_read_lock() since access
> to the vchiq_instance is not RCU-protected (the RCU is only used to
> access the vchiq_service).
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 3bcb893d14a1..ba1f86799b7f 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1058,6 +1058,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>  
>  	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  
> +	if (!instance || instance->closing)
> +		return VCHIQ_SUCCESS;
> +

How can instance ever be NULL?

And closing needs to be checked under a lock, right?

thanks,

greg k-h
