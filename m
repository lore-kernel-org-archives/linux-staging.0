Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074E2FB3
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 11:01:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECFDC60241;
	Thu, 27 May 2021 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622113291;
	bh=w82Buwz/8VJBRCQ6+DiA09zJU8SzJBV2/yXUWLoIPNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNo5sgQh8W4nwNmlyMXlmg3EVLOOeUMmjYjTnWGTA78pT7GO3cQOr9FMehZHN7Grh
	 A5mrNzTX6w9bYGiMev/+ojShZQYwVISxD46AhkoG94sFRSLepZWQ5RhTj1mSUMRD+z
	 4kNopQpYgv9nK7xvvZrW4xAJsDodnb6PKQvr8hxA=
Date: Thu, 27 May 2021 13:01:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bixuan Cui <cuibixuan@huawei.com>
Cc: dan.carpenter@oracle.com, desmondcheongzx@gmail.com,
	marcocesati@gmail.com, fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] staging: rtl8723bs: HalBtc8723b1Ant.c: Remove
 unused variables
Message-ID: <YK98CL3+Gg5hGH9g@kroah.com>
References: <20210526074537.46259-1-cuibixuan@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526074537.46259-1-cuibixuan@huawei.com>

On Wed, May 26, 2021 at 03:45:37PM +0800, Bixuan Cui wrote:
> Fix the build warning: [-Wunused-but-set-variable]
> 
> drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2710:6: warning: variable ‘u4Tmp’ set but not used
>  2710 |  u32 u4Tmp;
>       |      ^~~~~
> drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2709:13: warning: variable ‘u1Tmpb’ set but not used
>  2709 |  u8 u1Tmpa, u1Tmpb;
>       |             ^~~~~~
> drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2709:5: warning: variable ‘u1Tmpa’ set but not used
>  2709 |  u8 u1Tmpa, u1Tmpb;
>       |     ^~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> index 518d5354bda4..adfdc4f14b08 100644
> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> @@ -2706,9 +2706,6 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
>  	bool bBtCtrlAggBufSize = false;
>  	u8 aggBufSize = 5;
>  
> -	u8 u1Tmpa, u1Tmpb;
> -	u32 u4Tmp;
> -
>  	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
>  		return;
>  
> @@ -2716,9 +2713,9 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
>  		pCoexSta->bWiFiIsHighPriTask = true;
>  
>  		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
> -		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
> -		u1Tmpa = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
> -		u1Tmpb = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
> +		pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
> +		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
> +		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
>  	} else {
>  		pCoexSta->bWiFiIsHighPriTask = false;
>  
> -- 
> 2.17.1
> 
> 

Does not apply to my tree :(
