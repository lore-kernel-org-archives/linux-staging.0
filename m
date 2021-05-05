Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD570
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 16:21:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C46A2610EA;
	Wed,  5 May 2021 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620231698;
	bh=iUs9aQzvjk97+EzOnm9O6b///njeOHG8EK0O6Pu/QNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ysnvVskGothBkZ8w1wqNXqWLXTjyBFTEPmFWyZu3IDyEQZPgOBdH3O2apSw6BL0RX
	 Fz/B4VO+Atj5ITbe9Rlyt0XB3UMbkhYFfFFVQzHKrg3XddUR3xhXNQl+sYX4VZ5XpF
	 psaao1xyLGQfZDhvyLgyvNStuYpo2PDGBIb/Llh8=
Date: Wed, 5 May 2021 18:21:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Vorwerk <alec@vc-celle.de>
Cc: arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
	surenb@google.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: android: make file_operations struct const
Message-ID: <YJLGEFi1pENXIpk5@kroah.com>
References: <20210505161015.10278-1-alec@vc-celle.de>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505161015.10278-1-alec@vc-celle.de>

On Wed, May 05, 2021 at 06:10:15PM +0200, Alexander Vorwerk wrote:
> Fix the following type of checkpatch warning:
> "WARNING: struct file_operations should normally be const"
> 
> Signed-off-by: Alexander Vorwerk <alec@vc-celle.de>
> ---
>  drivers/staging/android/ashmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index 8ee4320a5dc6..8ff2794b08e3 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
>  
>  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -	static struct file_operations vmfile_fops;
> +	static const struct file_operations vmfile_fops;
>  	struct ashmem_area *asma = file->private_data;
>  	int ret = 0;
>  
> -- 
> 2.17.1
> 
> 

Always test build your patches before sending them out.  Any specific
reason why you didn't do that here?

thanks,

greg k-h
