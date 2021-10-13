Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443E72
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 12:26:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2138A610C8;
	Wed, 13 Oct 2021 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634127993;
	bh=2fq6zyYLD+W6dU0Wn2WXwU+KmGA4y3AuDF93YE5DFww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R45cB/hxFwHK2zjDvx34BSH21obPkrwh03BP8PwhTvV2f0onhVE2O3vSb3/OJvrS/
	 YY0wf2ueBt0keXWnXy/ryyQtN+ZEVBptuucVVwLgL4TZ5cuOsnOo3IZUVEKKHVRbVn
	 D0oKfVxyiVBxzx3z9vhUjZ7l1z6z3dxzcfnTyjzg=
Date: Wed, 13 Oct 2021 14:26:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
Message-ID: <YWbQd51r8R3BprMi@kroah.com>
References: <20211011152941.12847-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011152941.12847-1-vegard.nossum@oracle.com>

On Mon, Oct 11, 2021 at 05:29:41PM +0200, Vegard Nossum wrote:
> Fix the following build/link errors:
> 
>   ld: drivers/staging/ks7010/ks_hostif.o: in function `michael_mic.constprop.0':
>   ks_hostif.c:(.text+0x95b): undefined reference to `crypto_alloc_shash'
>   ld: ks_hostif.c:(.text+0x97a): undefined reference to `crypto_shash_setkey'
>   ld: ks_hostif.c:(.text+0xa13): undefined reference to `crypto_shash_update'
>   ld: ks_hostif.c:(.text+0xa28): undefined reference to `crypto_shash_update'
>   ld: ks_hostif.c:(.text+0xa48): undefined reference to `crypto_shash_finup'
>   ld: ks_hostif.c:(.text+0xa6d): undefined reference to `crypto_destroy_tfm'
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  drivers/staging/ks7010/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/ks7010/Kconfig b/drivers/staging/ks7010/Kconfig
> index 0987fdc2f70db..8ea6c09286798 100644
> --- a/drivers/staging/ks7010/Kconfig
> +++ b/drivers/staging/ks7010/Kconfig
> @@ -5,6 +5,9 @@ config KS7010
>  	select WIRELESS_EXT
>  	select WEXT_PRIV
>  	select FW_LOADER
> +	select CRYPTO
> +	select CRYPTO_HASH
> +	select CRYPTO_MICHAEL_MIC

Let's try to rely on 'depend' and not 'select' please.

thanks,

greg k-h
