Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58AEDB
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 13:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847D4C433EF;
	Sat, 13 May 2023 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683983198;
	bh=RqrorkStnEUza0YLB55UcVWTCooGYXX4gY6AuTBQ5DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjPvvX1wLeN/T/uEyDbNNG5IGY6Bgmh3bjjv+ip8l4YIDBvqmXx30gQ44GwzYe2MN
	 aKMo99EGMfjNkJzO2gIaQ7eF2jt6mRQks23PTVxT3HsL8uzWFApnPy0qMYYYL0c35t
	 y/W+oFG27CEXlwxwU2iPWdJCzZQ4lTl7I+7ar5oY=
Date: Sat, 13 May 2023 21:58:37 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Atin Bainada <hi@atinb.me>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: add whitespace before operator
Message-ID: <2023051346-pruning-porous-9570@gregkh>
References: <20230513120950.66944-1-hi@atinb.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230513120950.66944-1-hi@atinb.me>

On Sat, May 13, 2023 at 12:10:16PM +0000, Atin Bainada wrote:
> fix the following post-commit hook checkpatch error:

We have no default "post-commit hooks" :)

You can run checkpatch.pl on a file, perhaps that is what you did here?

> spaces required around that '?' (ctx:VxW)
> 2278: FILE: rtl8723b_hal_init.c:2278:
> +                       pHalData->ant_path = (tempval & BIT(6))? RF_PATH_B : RF_PATH_A;
>                                                                ^
> 
> Signed-off-by: Atin Bainada <hi@atinb.me>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index c3c1b49674d3..abfaf1eebf5b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -2275,7 +2275,7 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
>  			pHalData->EEPROMBluetoothAntNum = tempval & BIT(0);
>  			/*  EFUSE_0xC3[6] == 0, S1(Main)-RF_PATH_A; */
>  			/*  EFUSE_0xC3[6] == 1, S0(Aux)-RF_PATH_B */
> -			pHalData->ant_path = (tempval & BIT(6))? RF_PATH_B : RF_PATH_A;
> +			pHalData->ant_path = (tempval & BIT(6)) ? RF_PATH_B : RF_PATH_A;

Why not rewrite this as a real if () statement to make it more
understandable?

thanks,

greg k-h
