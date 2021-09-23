Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE53FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 05:20:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75A3661131;
	Thu, 23 Sep 2021 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632374402;
	bh=8QhBmcAYkwKnbZALoCVXITIZbxDQBwHjZfWw0diAJpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pShjpiwWB2yGoGkYnKVMCWHAM/f+8nnvcClkQsXaEqgczdjNgsECtaFu02hJ6Uz2B
	 C/1/vwql0cdS0U5pC+K71M7IGtbTkcfqOM0/5Ae1sjxhoaeduEYMzHQBmDLVMOpz7p
	 IiPsyGrZ+97jMcg7Or7xt+ilcDwfRD205nRAjUoM=
Date: Thu, 23 Sep 2021 07:19:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Cc: nsaenz@kernel.org, peterz@infradead.org, maz@kernel.org,
	bsegall@google.com, rdunlap@infradead.org, airlied@redhat.com,
	kan.liang@linux.intel.com, odin@uged.al,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchip_arm: Fix misuse of %x
Message-ID: <YUwOZjr06RV2BUi6@kroah.com>
References: <20210923035554.669434-1-qtxuning1999@sjtu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923035554.669434-1-qtxuning1999@sjtu.edu.cn>

On Thu, Sep 23, 2021 at 11:55:54AM +0800, Guo Zhi wrote:
> Pointers should be printed with %p or %px rather than
> cast to (unsigned long) and printed with %lx.
> Change %lx to %pK to print the pointers.
> 
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index b5aac862a29..408e5fe710b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -591,11 +591,11 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
>  		return VCHIQ_SUCCESS;
>  
>  	vchiq_log_trace(vchiq_arm_log_level,
> -		"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx",
> -		__func__, (unsigned long)user_service,
> +		"%s - service %pK(%d,%p), reason %d, header %pK, instance %pK, bulk_userdata %pK",
> +		__func__, user_service,
>  		service->localport, user_service->userdata,
> -		reason, (unsigned long)header,
> -		(unsigned long)instance, (unsigned long)bulk_userdata);
> +		reason, header,
> +		instance, bulk_userdata);

Why print this out at all?  What uses this?  Can it just be deleted?

thanks,

greg k-h
