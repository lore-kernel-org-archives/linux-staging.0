Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106B972
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 10:23:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05E3361159;
	Fri, 18 Jun 2021 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1624011802;
	bh=1ZxM0FCMwZiZghnpuKtTVnbmtQtc1YYDd9NZGwlFpFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1W6vyZoSBAzSTkWS0wOYbBIg/Im0WwpOf6bKl5rB8OP6GFC9KMgPkw/eeMzF/ciJb
	 fF46LcniH39Hh22MSaVob/xpHsnZrUeph+8WYIeIys6v9Gju4c69MzPCJHLIyLy9JL
	 UgHb0ADE67tnbQGdyKbMb6FKLCojIH4s9i1BNaxw=
Date: Fri, 18 Jun 2021 12:23:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: liuhailong <liuhailong@oppo.com>
Cc: arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
	surenb@google.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: android: ashmem: add size field in procfs fdinfo
Message-ID: <YMx0GIRQmpRC7pdQ@kroah.com>
References: <20210618095035.32410-1-liuhailong@oppo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618095035.32410-1-liuhailong@oppo.com>

On Fri, Jun 18, 2021 at 05:50:35PM +0800, liuhailong wrote:
> add this information to help user to find ashmem problem.
> 
> ashmem leak scenario:
> -000|fd = ashmem_create_region
> -001|mmap and pagefault
> -002|munmap
> -003|forget close(fd) <---- which lead to ashmem leak
> 
> Signed-off-by: liuhailong <liuhailong@oppo.com>
> ---
>  drivers/staging/android/ashmem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index d66a64e42273..ee2fd75111d8 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -894,6 +894,8 @@ static void ashmem_show_fdinfo(struct seq_file *m, struct file *file)
>  		seq_printf(m, "name:\t%s\n",
>  			   asma->name + ASHMEM_NAME_PREFIX_LEN);
>  
> +	seq_printf(m, "size:\t%zu\n", asma->size);
> +
>  	mutex_unlock(&ashmem_mutex);
>  }
>  #endif
> -- 
> 2.30.2
> 
> 

As you are changing a user-facing proc file, what tools will break now
that you have added a new line?

What tools do you use to look at this file and what has been modified to
handle the change?

thanks,

greg k-h
