Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830043B8BC0;
	Mon, 11 May 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487769; cv=none; b=c1tcJWh36+uArugrTd6TUIqbX1k+H7G3mGTLbPBcQsbfTRtfZOX8NU8fFlNpzZUe8srPa4INgpcGEfdMx5Q392RLOUmWHbcrKA0FALFHZeLCZ8dS63ZYxCAGLBO5mokB/ZlT5Q4I1R64M6XTVtI+jhKbokkk5YJSSNydKwgdw4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487769; c=relaxed/simple;
	bh=2IU0/LERLAlimk/tKnWWmXlvWUqVfpNC0kfCC1niTek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSm4e/bec4azYkySDL7RHtcCd2Il98b5gThyD0M/j6/jtZykPYxJIv9JusMZ3u798JijkV3VmQ0gcOf5Ae6MrjYm+5jxIg1gwF14ZdjPzpkpV9mQKfjsPQai1bgkWxjvpF8sEsbfdqNzdyQD6DWnpyhbhdbwG/tVewzsBeSe8FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fVE1em/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fVE1em/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825B5C2BCB0;
	Mon, 11 May 2026 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778487768;
	bh=2IU0/LERLAlimk/tKnWWmXlvWUqVfpNC0kfCC1niTek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVE1em/0Qs6mQ/IffF9mem/0Rh10cLuaTp1lqlnjpKv0oYDRozKOZ3sAnUYIJTd7j
	 BmjRcoPZqUMZ9LQTYLsGlZdi5C0EZJVBU/qWPgjRqYcALH2fGRhSc9N6IjBfyGlDqh
	 e2s3nHGM6f4Y3oIsb+sRWfMWdIdSB90stMhulWvk=
Date: Mon, 11 May 2026 10:22:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix line exceeding 80 characters in
 vme_user.c
Message-ID: <2026051135-overturn-boozy-9504@gregkh>
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
> 
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
>  {
>  	const unsigned int minor = iminor(file_inode(file));
>  	struct vme_user_vma_priv *vma_priv;
> -- 
> 2.53.0
> 
> 

Didn't my bot ask for these all as a patch series?

{sigh}
