Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CFC23A0
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 14:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5884EC340ED;
	Tue, 15 Mar 2022 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647354097;
	bh=npWjB+bqC/Nu3wEdgF/Jo34oYz1o2X5lA+B8iC7SLiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKuSpamlCYrChmMa54G2EM5uPOi16qMzHDLb1+odUyAq6U9rkNFEDwhOM+pmhxhqM
	 1o5r2evCGn8RijzBOvK2TE2LWMiztrfJp4WXpyQgkge0URFpCM52zjSnHtgQThykQk
	 0OHEa0WP8Bytj8/snToyT/wT/ZfoTHi16W7cAX1w=
Date: Tue, 15 Mar 2022 15:21:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: nsaenz@kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: mmal-vchiq: add a check for the return of
 vmalloc()
Message-ID: <YjCg6oQcNiGKEH3x@kroah.com>
References: <tencent_410AFB702E25A27F689010E6A1DC308E7807@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_410AFB702E25A27F689010E6A1DC308E7807@qq.com>

On Fri, Mar 04, 2022 at 04:17:41PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> vmalloc() is a memory allocation API which can return NULL when some
> internal memory errors happen. So it is better to check the return
> value of it to catch the error in time.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 76d3f03..1bbd301 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -1909,6 +1909,11 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
>  	mutex_init(&instance->vchiq_mutex);
>  
>  	instance->bulk_scratch = vmalloc(PAGE_SIZE);
> +	if (!instance->bulk_scratch) {
> +		err = -ENOMEM;
> +		kfree(instance);

This is called in the error section, please just jump to the proper
location and then this line will not be needed.

thanks,

greg k-h
