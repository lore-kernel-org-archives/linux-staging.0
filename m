Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF323A5
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 14:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B85C433C7;
	Sun,  3 Sep 2023 14:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693752209;
	bh=ttlE3ok8BQbOnf1ACAmLjfWl3fHYfC2CoxqqsrbpSQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lL1tLxJM/3DAbT9CjlVRgdjhJ9SnlCFEcJRKougTIVGembhYtWExp62H31GJLmwPC
	 zf2gi2DcflUkjKA5a1FP+hIrVL3GRM+NsOczdSyQIgpfwt1BKmiJCSPwOre1lKvu4X
	 UXiFFhsuDDMXFVKiOHfxGoEy4Xfivw6nAemM0Nn4=
Date: Sun, 3 Sep 2023 16:43:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: Add missing '*' in multiline comments
Message-ID: <2023090301-emission-scarce-8272@gregkh>
References: <20230903140617.567850-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903140617.567850-1-bergh.jonathan@gmail.com>

On Sun, Sep 03, 2023 at 04:06:17PM +0200, Jonathan Bergh wrote:
> This patch resolves a warning reported by checkpatch where multiline
> block comments should use '*' on intermediate lines in order to adhere
> to the Linux kernel coding-style guidelines.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 7c53a8a7b79b..90aaf650524d 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1010,8 +1010,8 @@ static void fake_free_consistent(struct device *parent, size_t size,
>  {
>  	kfree(vaddr);
>  /*
> -	dma_free_coherent(parent, size, vaddr, dma);
> -*/
> + *	dma_free_coherent(parent, size, vaddr, dma);
> + */

As this code isn't being used, why not just delete it instead?

thanks,

greg k-h
