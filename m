Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A6C2E5
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 08:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A108C433C7;
	Thu, 27 Jul 2023 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690445002;
	bh=2TyIJyHYASUoeAuNBExQ7Upn2naOgOozjwpfY0cvE/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbos+VHSeeXMtK4cSodDIHutWXua9CUJD7cAoyTRRg/2DxQHGCEC9HLFT56RjVr/2
	 dkPcQgvKsnfI6aFOl8udayaXch9OTD3QFVYauHoB0F8Nmr3RTQ8STxnGkMZqjMFI3V
	 MT4kISx9cznxh8zJ9Bz31hLX5obsJ3fSrzcrIiEs=
Date: Thu, 27 Jul 2023 10:03:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <2023072729-sensitive-spyglass-ec96@gregkh>
References: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>

On Sat, Jul 08, 2023 at 12:55:11AM -0300, Alexon Oliveira wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> 
> #132: FILE: drivers/staging/vme_user/vme_bridge.h:132
> #135: FILE: drivers/staging/vme_user/vme_bridge.h:135
> #139: FILE: drivers/staging/vme_user/vme_bridge.h:139
> #142: FILE: drivers/staging/vme_user/vme_bridge.h:142
> #144: FILE: drivers/staging/vme_user/vme_bridge.h:144
> #146: FILE: drivers/staging/vme_user/vme_bridge.h:146
> #148: FILE: drivers/staging/vme_user/vme_bridge.h:148
> #152: FILE: drivers/staging/vme_user/vme_bridge.h:152
> #163: FILE: drivers/staging/vme_user/vme_bridge.h:163
> #173: FILE: drivers/staging/vme_user/vme_bridge.h:173
> #175: FILE: drivers/staging/vme_user/vme_bridge.h:175

We don't need all of these lines.

>     Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>

Please don't indent your signed-off-by line, that should be to the left.

> 
> diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
> index 11df0a5e7f7b..a0d7a8db239d 100644
> --- a/drivers/staging/vme_user/vme_bridge.h
> +++ b/drivers/staging/vme_user/vme_bridge.h
> @@ -128,28 +128,21 @@ struct vme_bridge {
>  	struct mutex irq_mtx;
> 
>  	/* Slave Functions */
> -	int (*slave_get)(struct vme_slave_resource *, int *,
> -		unsigned long long *, unsigned long long *, dma_addr_t *,
> -		u32 *, u32 *);
> -	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long,
> -		unsigned long long, dma_addr_t, u32, u32);
> +	int (*slave_get)(struct vme_slave_resource *, int *, unsigned long long *,
> +			 unsigned long long *, dma_addr_t *, u32 *, u32 *);
> +	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long, unsigned long long, dma_addr_t, u32, u32);

Did you run your patch through checkpatch.pl after making this change?
I think you just added more warnings...

thanks,

greg k-h
