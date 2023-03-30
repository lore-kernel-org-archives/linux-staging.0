Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40210E7
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 20:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCAEC4339B;
	Thu, 30 Mar 2023 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680209579;
	bh=M3Gwz8bg9RQOf786ZiVKLz+aclgydGf92Mqzbu8XHcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8YQkpaV/iD350A2mNdyNvAiwzQQzx98i/ZPveWmVZeAWtcU1nbHhi45CTXpqgw9h
	 PfdO27N6TrB/AKqntWVKZ0sVwfGlrkhtO8X7kkbagkYGVlp5djUJAnFC8Oiz0gdZ4t
	 zwKg9yDmEymYHpl1rM3xjto2jjTSbExJrgIxsfas=
Date: Thu, 30 Mar 2023 22:52:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danila Chernetsov <listdansp@mail.ru>
Cc: stable@vger.kernel.org, Dinghao Liu <dinghao.liu@zju.edu.cn>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 1/1] staging: rtl8192u: Add null check in
 rtl8192_usb_initendpoints
Message-ID: <ZCX2qLN1g6bmeKS7@kroah.com>
References: <20230330201107.17647-1-listdansp@mail.ru>
 <20230330201107.17647-2-listdansp@mail.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330201107.17647-2-listdansp@mail.ru>

On Thu, Mar 30, 2023 at 08:11:07PM +0000, Danila Chernetsov wrote:
> From: Dinghao Liu <dinghao.liu@zju.edu.cn>
> 
> commit 4d5f81506835f7c1e5c71787bed84984faf05884 upstream.
> 
> There is an allocation for priv->rx_urb[16] has no null check,
> which may lead to a null pointer dereference.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> Link: https://lore.kernel.org/r/20201226080258.6576-1-dinghao.liu@zju.edu.cn
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 7f90af8a7c7c..e0fec7d172da 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -1608,6 +1608,8 @@ static short rtl8192_usb_initendpoints(struct net_device *dev)
>  		void *oldaddr, *newaddr;
>  
>  		priv->rx_urb[16] = usb_alloc_urb(0, GFP_KERNEL);
> +		if (!priv->rx_urb[16])
> +			return -ENOMEM;

This was not marked for stable as it's impossible to hit in real-life.
So absent that, it's not needed in any stable kernel tree, unless you
can prove otherwise?

thanks,

greg k-h
