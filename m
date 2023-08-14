Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02238CA4B
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 20:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23229C433C8;
	Mon, 14 Aug 2023 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692044234;
	bh=4HokLIG+fBcRWEGaR+eUHTaxkyTQTysIMRMz3aX8OIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wA+spL7MBqAkDRlJ/6m6TgWBJr8lvHpM+JCdn8XA4Tbydw+6haJPmQCFkCiIMYuQP
	 b68jjbXVSziueeG+tRFVRHbvN0U14deph0MtLZQSHUyjV0BECxVZ0fmtC7h4CogvXa
	 KKYlCYNhxIAwGohoVVMFCloLu9upXSr2MUp6temg=
Date: Mon, 14 Aug 2023 22:17:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check blank lines not necessary
Message-ID: <2023081448-sustainer-prelaw-25a2@gregkh>
References: <ZNqBd/08H/Y5UEOm@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNqBd/08H/Y5UEOm@alolivei-thinkpadt480s.gru.csb>

On Mon, Aug 14, 2023 at 04:33:11PM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Blank lines aren't necessary after an open brace '{'
> and CHECK: Blank lines aren't necessary before a close brace '}'
> as reported by checkpatch to adhere to the Linux kernel
> coding-style guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 5eb0d780c77f..c7c50406c199 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -308,7 +308,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
>  		if (((slave_image->address_attr & address) == address) &&
>  		    ((slave_image->cycle_attr & cycle) == cycle) &&
>  		    (slave_image->locked == 0)) {
> -
>  			slave_image->locked = 1;
>  			mutex_unlock(&slave_image->mtx);
>  			allocated_image = slave_image;
> @@ -510,7 +509,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
>  		    ((master_image->cycle_attr & cycle) == cycle) &&
>  		    ((master_image->width_attr & dwidth) == dwidth) &&
>  		    (master_image->locked == 0)) {
> -
>  			master_image->locked = 1;
>  			spin_unlock(&master_image->lock);
>  			allocated_image = master_image;
> @@ -682,10 +680,8 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
>  		count = length - offset;
>  
>  	return bridge->master_read(image, buf, count, offset);
> -
>  }
>  EXPORT_SYMBOL(vme_master_read);
> -

This line needs to be there, checkpatch should not have complained about
it.

thanks,

greg k-h
