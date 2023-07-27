Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC9C2E5
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 07:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C2DC433C8;
	Thu, 27 Jul 2023 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690444768;
	bh=EJxDPwh0/PNszmN4znypIhQGAzTgBhpEPGaM4IrGkBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdV8uUhc0xeL3o0BrqNB09vi9qESykQw7WYos1sk4ys832ySsi9ujNXmP9SEG3sFT
	 BvBI19j4w+gieeavhGjeDEsDXx2zw7vPCciALo6aCoilajQDHIsWF4EitImOCeq58J
	 b5Pw9r+CI7PqVhiTmRWD4TO6kGLLIS5pSyxdKTDk=
Date: Thu, 27 Jul 2023 09:59:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8192e: Rename function IsHTHalfNmodeAPs
 to is_ht_half_nmode_aps
Message-ID: <2023072737-resort-dwelled-8cb9@gregkh>
References: <ZJp93mCd9ogrGZbx@tacos.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJp93mCd9ogrGZbx@tacos.darkphysics>

On Mon, Jun 26, 2023 at 11:12:46PM -0700, Tree Davies wrote:
> Rename function IsHTHalfNmodeAPs to is_ht_half_nmode_aps in order to
> fix checkpatch warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
> v3: Fix email parch as v2 info was placed above the ---
> v2: Rename is_ht_half_nmode_a_ps -> is_ht_half_nmode_aps
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>  drivers/staging/rtl8192e/rtllib.h         | 2 +-
>  drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index f9fa3f2bb728..d09342dde61d 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -139,7 +139,7 @@ u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
>  	return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate & 0xf];
>  }
>  
> -bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
> +bool is_ht_half_nmode_aps(struct rtllib_device *ieee)

As this is a global symbol, can you please prefix it with the driver
name so that the global symbol table looks semi-sane?

Perhaps rtllib_is_ht_half_nmode_aps()?

thanks,

greg k-h
