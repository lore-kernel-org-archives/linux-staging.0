Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A606A15A5;
	Thu, 14 Apr 2022 06:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE67C385A1;
	Thu, 14 Apr 2022 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649919368;
	bh=L3VxJLQfY/9eR+JhGO0WIlQi1E6rxQ4qx/tOGaaSC+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=we/GEdyoQ4CZb289hfvJOB4Md6rQAIJjJAAdHpUoKD5+8dA0dpEQO/XY0LXtC7Fhl
	 l1xSyeHxOXtX+BqpvcIEXcfalPdngi3mZfirMdvGaf5t/sA8gQWHMQzYRsYacIJmpz
	 GqECmXze3ubfjt1oBT6uQIj1yOLytsBnctEMB2r8=
Date: Thu, 14 Apr 2022 08:56:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aliya Rahmani <aliyarahmani786@gmail.com>
Cc: sudipm.mukherjee@gmail.com, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: Remove volatile
Message-ID: <YlfFhZ0o/FSzxOvE@kroah.com>
References: <20220413203914.59533-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413203914.59533-1-aliyarahmani786@gmail.com>

On Thu, Apr 14, 2022 at 02:09:15AM +0530, Aliya Rahmani wrote:
> Remove volatile to fix checkpatch.pl warning.
> 
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index aff69661c8e6..7a11f8593596 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -52,7 +52,7 @@ struct lynx_accel {
>  	/* base virtual address of DPR registers */
>  	volatile unsigned char __iomem *dprBase;
>  	/* base virtual address of de data port */
> -	volatile unsigned char __iomem *dpPortBase;
> +	unsigned char __iomem *dpPortBase;

So you have properly determined that this code is now fixed and does not
require this volatile marking?  :)

Please don't blindly follow checkpatch suggestions without understanding
what they do.  While the use of volatile is probably wrong here, you
need to ensure that you can successfully remove this so you need to
prove it in the changelog text that all is still ok.

Also, why did you only remove one?

thanks,

greg k-h
