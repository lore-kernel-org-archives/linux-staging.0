Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14706366DD6;
	Thu, 19 Mar 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913381; cv=none; b=Qu+aKdrWN6c/jhm90vKLKiV+GMGfnU2/72KHnKMdkFYNcHvdIT8Tr/YE7zppvpEu6zx767Qu93wwiXnO35o1wFCXeTgyqkwAJF70xGdbi6DWUWcehGC9kFcXMw9wbhJNCTTS/Hvmd8eyKZtt5ox9uoBlLZNU34Fw/MYRxEYXRHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913381; c=relaxed/simple;
	bh=1Phv88mh2XOhv7Tis0XNOCaFqkTWCs1ytEEsZUbgE1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhMhzsXL25MRIPeExFtEZub9I6YPzBsy8c5BthLDcC8QC6EoDSdO+MWh5UBOp3QmoyHf7NMWmL+9dKHyYnuGCeetyBfRHndun4ivl3ZYI8JSCNSFN0qWvH6vf7dyY/9hXm+rFYqnDNBtK92Zv6VG14TwC0XtKdDyEq5XgYqgu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=riarxanF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="riarxanF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD04C2BC87;
	Thu, 19 Mar 2026 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773913380;
	bh=1Phv88mh2XOhv7Tis0XNOCaFqkTWCs1ytEEsZUbgE1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riarxanFdP/7dPLJNwBOnzXEefqDoTvSMEfHft0/kZRnIZo5GL7etXMtFgUjWUY0p
	 2x3Oxmjaq4SnU0FQUQMD4MVZhhgKiX8t3lHcgrmNoczC6o1ZifRRwJxPGU42tAAllY
	 fB0SjsKin5GVAF+4XKcTupgoEtBMOPmWKHG+06UU=
Date: Thu, 19 Mar 2026 10:42:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: hmm: remove unnecessary casts
Message-ID: <2026031933-juggle-decimeter-3547@gregkh>
References: <20260319093625.3225-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319093625.3225-1-xiongzile99@gmail.com>

On Thu, Mar 19, 2026 at 05:36:25PM +0800, Zile Xiong wrote:
> Drop unnecessary casts when accessing vma->vm_private_data.
> 
> No functional change.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 856561e951a5..68116edda591 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -975,9 +975,7 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
>  
>  static void hmm_bo_vm_open(struct vm_area_struct *vma)
>  {
> -	struct hmm_buffer_object *bo =
> -	    (struct hmm_buffer_object *)vma->vm_private_data;
> -
> +	struct hmm_buffer_object *bo = vma->vm_private_data;
>  	check_bo_null_return_void(bo);
>  
>  	hmm_bo_ref(bo);

Why did you delete the extra blank line that checkpatch is just going to
ask you to add back again in a future change?  :)

thanks,

greg k-h
