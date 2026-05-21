Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51F3A6F05;
	Thu, 21 May 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360127; cv=none; b=D+2ZV1jSmDEYRy7lqeSHmnqqvDUhuIqxdZxhyY2PwCDNugKVbgCs/VKseaSyGpRM4EucOT0DhQ3Ry4BnZznuUlNhgcQaPcKfoYsHibzssC5H/3L2Z6yl6/oizf7YYR7d1Lh8mWfYEOS7laotIa9qjpsRAMwU7rOQag8k7Eql3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360127; c=relaxed/simple;
	bh=uLngnlAsglHRzm9Wg1HQ4y/sg+EEynIi7vRNf1TSH1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpgCHS/u94hc224L+o+7ZE4NgfUxKSUCkRPCc5In/2aymU4WRTQLGL8/EIamubwuTC6X154YwBjaCeLXNCWXTXE/4xOVxIFOxb+q1v3D0O2EE6oEAjEBPDeiqmp2OAfwF/49/tYzi5vHCkYOfyjvOEyDh5+2sn9WSPoBqU2VFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XLjnXaX1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XLjnXaX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4161F000E9;
	Thu, 21 May 2026 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779360125;
	bh=fMio8TauSQXf7NrQmSw8MAWyDD9SaOVWSIlDVzAHp0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XLjnXaX1rSo7J56iQIKoEXc4Ejd7B+o4UKLVfwSqqEm3JUSAtUz0+F2NPgbyj5bWE
	 6oWA4lhxvq3vYZNyf5J0FOBz1JcW5FlqRB1BxJtEYKsH51ckJaBqGod4Fi89V1C117
	 X0VXg9ZZC6t3aJEJ5c8MRcK/DB4Ji1NFhlh+Z6is=
Date: Thu, 21 May 2026 12:42:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: hal: Remove unnecessary blank lines
 in hal_com.c
Message-ID: <2026052155-bottom-synergy-e6fc@gregkh>
References: <20260517171537.17787-1-praveen.pattar2022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517171537.17787-1-praveen.pattar2022@gmail.com>

On Sun, May 17, 2026 at 10:45:37PM +0530, Praveen Jayaprakash Pattar wrote:
> Remove multiple consecutive blank lines that violate kernel coding style.
> Detected by checkpatch.pl with --strict flag.
> 
> Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 728a2171f..de1fe8a98 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -30,7 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
>  	}
>  }
>  
> -
>  void dump_chip_info(struct hal_version	chip_version)
>  {
>  	char buf[128];
> @@ -71,7 +70,6 @@ void dump_chip_info(struct hal_version	chip_version)
>  	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", chip_version.ROMVer);
>  }
>  
> -
>  #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
>  
>  /*
> @@ -378,7 +376,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  
>  	} else { /* typical setting */
>  
> -
>  		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
>  		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
>  		/* 0:ep_0 num, 1:ep_1 num */
> @@ -419,7 +416,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  
>  	} else { /* typical setting */
>  
> -
>  		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
>  		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
>  		/* 0:H, 1:N, 2:L */
> @@ -751,7 +747,6 @@ void SetHalODMVar(
>  	}
>  }
>  
> -
>  bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
>  {
>  	u16 i = 0;
> -- 
> 2.54.0
> 
>

Someone else sent this same change right before you did, sorry.
