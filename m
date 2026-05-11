Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B703BB9F8;
	Mon, 11 May 2026 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487482; cv=none; b=M10C470m0bpIAR+MrFk4d7ZIPky3tBgv7FItHj9frh98kj0ZcgLXymsCZO1y0tioxJ/hfWTakrrJGYUAZqNEpAPU4TO0Z9Upw2BBAmjHWzWoo4eAtLWjketwn9A60r3+gWb1riI7g0Hj9Kz5Ggyw+xNerBBpz0jxI1Ywb7q3x1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487482; c=relaxed/simple;
	bh=XirO1Dr5aocypH19VbupoG4E8saf6JkpoUqnGqRauwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW48g7aZzSHmQDatzzD8Lqm7HyEPvbDez6rviwKKyUQceEaQ+t+CDF3agMS1epphJlrNh+44cxpiEU1wvza2maKl9nyAHWDfOz7Q09CcGvihMpqj6tD9QZ3qsetFUp0Hwy3UW+JPobOXHbHOqpSn5dRWeEWDmyDeY72UfEjZYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EwKMnTK2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EwKMnTK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DE2C2BCF5;
	Mon, 11 May 2026 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778487481;
	bh=XirO1Dr5aocypH19VbupoG4E8saf6JkpoUqnGqRauwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwKMnTK2ITK2Q0oE8iBcQYiI0vfR2S5P1HFfsKSJSjJmVCgXGwthDhGcG2z5Jd3ja
	 2rOI+0w8MvxxrVGDY0e2w3w+sjVyEDQkO7I0/vtwIR+29NvFtHHDQWstk4EvVGXt40
	 jLB1vZYLFOlbfg0FBaai6dg1jHJWiJHwjDwkoCmw=
Date: Mon, 11 May 2026 10:17:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix line exceeding 80 characters in
 vme_user.c
Message-ID: <2026051123-popular-peddling-e67d@gregkh>
References: <20260511080815.3521-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511080815.3521-1-shawharshit116@gmail.com>

On Mon, May 11, 2026 at 08:08:15AM +0000, Harshit Shaw wrote:
> Wrap the vme_user_vm_mapped() function signature that
> exceeded the 80 character line limit as reported by
> checkpatch.pl.

You get a full 72 characters here.

> No functional change.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
>  drivers/staging/vme_user/vme_user.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
> index 11e25c2f6b0a..f5e29933ba68 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -446,8 +446,9 @@ static void vme_user_vm_close(struct vm_area_struct *vma)
>  	kfree(vma_priv);
>  }
>  
> -static int vme_user_vm_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> -			      const struct file *file, void **vm_private_data)
> +static int vme_user_vm_mapped(unsigned long start, unsigned long end,
> +			      pgoff_t pgoff, const struct file *file,
> +			      void **vm_private_data)

100 is an ok line length to stay at, the original code is just fine.

thanks,

greg k-h
