Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E8816
	for <linux-staging@lists.linux.dev>; Sun, 13 Mar 2022 08:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E293FC340E8;
	Sun, 13 Mar 2022 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647158474;
	bh=cgcCx0n8DKjuEbew5xm+3e+26hrc7E75i+AjpzDvtJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ex1K05HVnDl8hEp6EDWKJGvulLCxLSssYBFar4W8n5y6sziLNKGbq4VF4jv0OI+zL
	 B8Nq1hPZtzgGfLfVQW5QvEubOIPnY50oH38xZyBqLnGqSG2D/89ePgbNrJdh+ccaUt
	 raMj9bGwUQGxu+VPZv2jto74lJmx6316GwIzF8ic=
Date: Sun, 13 Mar 2022 09:01:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: shaikh kamal <shaikhkamal2012@gmail.com>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH]  staging: android: ashmem: Declared file operation with
 const keyword Warning found by checkpatch.pl script.
Message-ID: <Yi2kwvSdONyTstsx@kroah.com>
References: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220312204128.3942-1-shaikhkamal2012@gmail.com>

On Sun, Mar 13, 2022 at 02:11:27AM +0530, shaikh kamal wrote:
> Signed-off-by: shaikh kamal <shaikhkamal2012@gmail.com>
> ---
>  drivers/staging/android/ashmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index ddbde3f8430e..4c6b420fbf4d 100644
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch breaks the build.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
