Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577526E
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 07:53:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40D2660238;
	Mon, 22 Mar 2021 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616399606;
	bh=44p/Ueld9vCVM5Ylo7zNfq3Lvw0y7S7unPop8elIUvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWwsuVJjhfSVheX4h3l8MaLd/ilqA+MacNTjsVkrRk7FruD8bHUITkJFSb6Fu+Teq
	 +pNHLLWaOuTX2EbQ5a2n7R8tzMmMkBvRA191B8FM9pcdlGGkOQ1mMpLBSJ+ivs7Lxf
	 X7L6uy8y+Dnu0rRh7vcVtt4GW3ATp5lb6pbZlNqs=
Date: Mon, 22 Mar 2021 08:53:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: dev.dragon@bk.ru
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: wimax: i2400m: fixed a space coding style issue.
Message-ID: <YFhM9BA3fiBNaQbr@kroah.com>
References: <20210321182602.13793-1-dev.dragon@bk.ru>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321182602.13793-1-dev.dragon@bk.ru>

On Sun, Mar 21, 2021 at 09:26:02PM +0300, dev.dragon@bk.ru wrote:
> From: Dmitrii Wolf <dev.dragon@bk.ru>
> 
> Fixed a coding style.
> 
> Signed-off-by: Dmitrii Wolf <dev.dragon@bk.ru>
> ---
>  drivers/staging/wimax/i2400m/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wimax/i2400m/debugfs.c b/drivers/staging/wimax/i2400m/debugfs.c
> index 1c640b41ea4c..4e6e1e3f015e 100644
> --- a/drivers/staging/wimax/i2400m/debugfs.c
> +++ b/drivers/staging/wimax/i2400m/debugfs.c
> @@ -170,7 +170,7 @@ int debugfs_i2400m_reset_set(void *data, u64 val)
>  	int result;
>  	struct i2400m *i2400m = data;
>  	enum i2400m_reset_type rt = val;
> -	switch(rt) {
> +	switch (rt) {
>  	case I2400M_RT_WARM:
>  	case I2400M_RT_COLD:
>  	case I2400M_RT_BUS:
> -- 
> 2.25.1
> 

Sorry, but this file is now gone from my tree and from linux-next:
	    https://lore.kernel.org/r/20210318093315.694404-1-gregkh@linuxfoundation.org

greg k-h
