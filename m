Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2F21362
	for <linux-staging@lists.linux.dev>; Sat,  1 Jun 2024 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717245347; cv=none; b=n0L9aZkKU1CBW/zN+qUmxkrksRicDTwndon8TMumADdHogJXujZMxSZu7sdUIFB1YobksCtZKCdsft1W4X2RpvBe1J3sz0pXrTwngkZ8cQdEYa0ZwGQsu08MQIHPH4unREFOqrmVKYwnr/4CoTpQ9gfl0rnVD4ky0MNtwk5cnag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717245347; c=relaxed/simple;
	bh=l+w0MWiDm6oJtqFXx9Re3XnVhUTLF3ybfCko7EdhCnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFjSzTOOoTlTJ7aoAlt13ycq+cGAAqUXg/cU4TqYQULiC2hqq3tylRdnSFFKyUf2SljLXH4m8mPObBJ19/Oi+2TtesvAFd1jhAJKsMEGCTpGd6AkJfSvbnlrxpI2cWdjmfts1uFrWSXEyTWYhzDMmR2VyPd+WxtaIpu2sPKosVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgaBCNPM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgaBCNPM"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a62bc9fa182so31555566b.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Jun 2024 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717245344; x=1717850144; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BT5mj85tlRfrnhVxRHRVZyHIGnWChMArh0mXdC5TaDU=;
        b=PgaBCNPMBSFE5NTYLAylSrCY3YSgm8IyHsZ4HdFojypY+n6k9b0zPwUSpNLbWmmOjI
         zzTXV6WEVo+MTb5te5JcUVuq3WC/C4ktgOfzICJlNIhdgydJwo0EGgjb83mYqF4vb6AT
         f4eqw+fsgQKdvLdcnQSiMINzhCWY+FnYRtKBjDMXfUPmCFIs4l7FIDBIFXewMTmogxvk
         JgVxOqgae4RUAjVApai1QbgkC7+shBpwmh+MTlzDFiDxIi9qKFSKqd7jSnuTkh9xUYgf
         Ioi5fEadD3ziuNdCOjKRWBJz1PHS5fIIPMQZH19inCHE7N7xdDsA7G7/FOjKWUthTU+6
         Z8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717245344; x=1717850144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BT5mj85tlRfrnhVxRHRVZyHIGnWChMArh0mXdC5TaDU=;
        b=wP2pIN0kTqylPG9Qg9CA6UIijlMyeqHTeI+oIsFtHTbARL2UDOOh8P0p37TpEkHxYm
         DnrSh3Rx2UXVzzu3HxDmR5xwSS1aniakh/2/BVJ99eO55iq3mNrQ7iPvTc2nFHD0Fd2F
         RgW+rafBilGthSN1jrJDh5H7hN4PHCwr0vk//8L0NdT9woxa346f90Qgg4xqnfbtxxZ6
         3CmyoPsJyfI5tZaw0UJziEJHyx1QzICBuRFAXBDlWzqzsKoubauk3NE1OBZafu9zj7xu
         x6TJ00YWgOpKvIXmuNeuFmtx5R7KsoBJD558fuZ1Z4FzVuxlQTvfeyzReuGjPzQsCdcm
         hbog==
X-Gm-Message-State: AOJu0Yzuqx65YIlohC/eLb442D1lJ8kKmtwqhqEQ5VdolJUhsl1PX2ii
	wPrwsveHp4dDH2LiX19TVFfWiPRAAIxoNUkQruPb5N+IV6ewvP4V
X-Google-Smtp-Source: AGHT+IEpUvav2aw6H/1mjoliu/c1vSBEjWM0BfAwWeYkytbnsKtDu98JWv9RmyZFoyI6uPe7gIoimg==
X-Received: by 2002:a50:c354:0:b0:57a:2f92:2955 with SMTP id 4fb4d7f45d1cf-57a361cf32dmr2922617a12.0.1717245343633;
        Sat, 01 Jun 2024 05:35:43 -0700 (PDT)
Received: from [192.168.0.102] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a49deff15sm787593a12.94.2024.06.01.05.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 05:35:43 -0700 (PDT)
Message-ID: <c0f4d6ef-78e8-49a0-9544-7399a9eec9cb@gmail.com>
Date: Sat, 1 Jun 2024 14:35:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in odm.h
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org,
 ruanjinjie@huawei.com, bragathemanick0908@gmail.com, colin.i.king@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240601083153.96242-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240601083153.96242-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/24 10:31, Roshan Khatri wrote:
> This patch fixes misspelled words to increase code readability and
> searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8723bs/hal/odm.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
> index f5c804a1b9d5..010274ba8079 100644
> --- a/drivers/staging/rtl8723bs/hal/odm.h
> +++ b/drivers/staging/rtl8723bs/hal/odm.h
> @@ -76,7 +76,7 @@
>   
>   /* Remove DIG by Yuchen */
>   
> -/* Remoce BB power saving by Yuchn */
> +/* Remove BB power saving by Yuchn */
>   
>   /* Remove DIG by yuchen */
>   
> @@ -878,7 +878,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
>   	struct odm_mac_status_info *pMacInfo;
>   	/* MAC_INFO_88E		MacInfo; */
>   
> -	/*  Different Team independt structure?? */
> +	/*  Different Team independent structure?? */
>   
>   	/*  */
>   	/* TX_RTP_CMN		TX_retrpo; */

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
