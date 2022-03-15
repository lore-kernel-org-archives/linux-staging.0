Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5461F23B5
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 15:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A5EC340E8;
	Tue, 15 Mar 2022 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647358063;
	bh=ntKc+0V/pCo1xdEL+4LSr3fmP+YcSlucBc+b0X8zhMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKY/p9D/m7fo/AZ+uALMMw5azq5ppZgYThkPQFIRF6bAbz4/UXVtmJxcmc9QKRN/R
	 2513m5Lrel/4uYNnDhSv9HlgDmhgiACMnYOruOzTIX11s/WX4nYemsaWNbc4Qu2pY+
	 EGOh6rNjC2zVB5Bv/cdpc8JZ+EnPnWGXIovl7zbg=
Date: Tue, 15 Mar 2022 16:27:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: nsaenz@kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: mmal-vchiq: add a check for the return of
 vmalloc()
Message-ID: <YjCwagaijyA2oO8r@kroah.com>
References: <tencent_7F2A8AAFF05125C6FF159033E69B5C108E07@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_7F2A8AAFF05125C6FF159033E69B5C108E07@qq.com>

On Tue, Mar 15, 2022 at 10:42:07PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> vmalloc() is a memory allocation API which can return NULL when some
> internal memory errors happen. So it is better to check the return
> value of it to catch the error in time.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2  jump to the proper location and remove redundant instruction.
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 76d3f03..ff4b484 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -1909,6 +1909,10 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
>  	mutex_init(&instance->vchiq_mutex);
>  
>  	instance->bulk_scratch = vmalloc(PAGE_SIZE);
> +	if (!instance->bulk_scratch) {
> +		err = -ENOMEM;
> +		goto err_free;
> +	}
>  	instance->vchiq_instance = vchiq_instance;
>  
>  	mutex_init(&instance->context_map_lock);
> -- 

Your change just crashed the kernel :(

Please be more careful.

greg k-h
