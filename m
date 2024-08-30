Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9D1BD50E
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725045119; cv=none; b=ZDhkjR4znZIyFj/F0NiMweNPSAoj1sbAaTbfcxn2OUzZVO/ykh0MOcYtUGg3e081P2+GY52by1ffBX8pzH2/eJ+zs7h6awr50hd5CJsOCcNVEJ7e5deHT4/MwjZq5Jjg513/SZxo/L0zKBCkI6RbVgJEYYeT1863yU/hrKuMgMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725045119; c=relaxed/simple;
	bh=pB8CcaoFrh3B3HWYNqo0+lxlPHhtXzp/yBqGI7bLBv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQggwFMJiod9kIlTUdUkAaVDhVUYjqOP39P8+QZIW6lYzsNUShMggRHqzKRD+VLrsZXG/GLbUOp7d8CFC25kc4meQFdHkv6fNrofU19pKPCzVVDDJm4LLWJ5E8urPds4en6+8hQuNKDdXm7H+PVnCV565GgkZHlsIQrldsXH5pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZiGV3Gn; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZiGV3Gn"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f505118fso25379261fa.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725045116; x=1725649916; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTbqm50ORZHDE0s9qtVidpp8vg7AYyeaBahTmM04iSE=;
        b=MZiGV3GnGzZSvFjzbuHiIwQZuRjmkSuL1oOIWL4UoW4LHrujyeiDQyUEbwxJR9Fvx6
         zFmpsixViumaDRFrr6L+huQ/iFdapIjaF9Yijz3BP3qOp3pvjty/PULP6+bzQs+GZa7S
         a+yEwVZvikozVGCeCybRVcCKiNgopyK8SrIfigi6jmTU7tE8vLmYuZtX4NRzFgKNQce/
         LXM8YSC+x6om6IBfHPCGH/gHav2fSBH30ou94eF/O7H/gApPKCe69tkxqLy1c3tYRUm6
         XXnCKuHOFJlUCh+7DL57+bh+/MA6cwALkrZi3wPKnyC+12M5aK32NWrNYyLYXFFVY3O0
         2deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725045116; x=1725649916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTbqm50ORZHDE0s9qtVidpp8vg7AYyeaBahTmM04iSE=;
        b=FjBysssaHXH1ipDYJZoUW20mTTWF0cUcpXrwqVJJDrpC6dE0DiLmDjxsH6nNdzPbzS
         89SjD5K+5bAM7shgDtCwtNzTC2BrO3kzaTmslZM2LuXSkOV9Nsqon1BvdCjek6J2TtHJ
         mW0t41haLLQQn9c28/aGTs94+l90WUsb2njRuic+6rKrKDR4nMYLRmfmcfUXSyPxkoj8
         bu/BKiC1/jcktiZSMiFANguO9H13V9ozheQAyAuWzXm9Ahem6OeofIPrxYjGre6E0fqW
         Nk8DtEyMz1C4PVz8GJLxhlcEYBuQMlDsbhAN1sONuiXMrWExwKszqp431C+ER3irSMfY
         +oSQ==
X-Gm-Message-State: AOJu0YzNm5NQ8kJw0EMrG1NRzG07YGafljj7BmNmcNqzo5mdl19xQ5eh
	luJhGM6+5zSOUT4NblghIFvmtFGOJIp//xPEOVgUc8CIeQdcd2MB
X-Google-Smtp-Source: AGHT+IHPRfGnVJHiWKKlE2S/jXH6csPJ6/DSHhs7i1c+lIFxiuK5y1paSORrNoHhq8Ny4pvVchAIMQ==
X-Received: by 2002:a05:651c:1991:b0:2f1:922f:874a with SMTP id 38308e7fff4ca-2f626564f62mr3601851fa.14.1725045116010;
        Fri, 30 Aug 2024 12:11:56 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24435fcacsm79301a12.53.2024.08.30.12.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 12:11:55 -0700 (PDT)
Message-ID: <6885753f-d663-4e00-9007-60f8d659804f@gmail.com>
Date: Fri, 30 Aug 2024 21:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Staging: rtl8192e: Rename variable bHwError
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240830020508.532945-1-tdavies@darkphysics.net>
 <20240830020508.532945-3-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240830020508.532945-3-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 04:05, Tree Davies wrote:
> Rename variable bHwError to hw_error
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 8 ++++----
>   drivers/staging/rtl8192e/rtllib.h              | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index 519cad9e1106..15fda2d87da9 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -1506,7 +1506,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
>   				  (fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
>   				  (fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
>   				  hdr->addr3) &&
> -		 (!pstats->bHwError) && (!pstats->bCRC) && (!pstats->bICV));
> +		 (!pstats->hw_error) && (!pstats->bCRC) && (!pstats->bICV));
>   	bpacket_toself = bpacket_match_bssid &&		/* check this */
>   			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
>   	if (ieee80211_is_beacon(hdr->frame_control))
> @@ -1630,13 +1630,13 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
>   
>   	stats->bICV = pdesc->ICV;
>   	stats->bCRC = pdesc->CRC32;
> -	stats->bHwError = pdesc->CRC32 | pdesc->ICV;
> +	stats->hw_error = pdesc->CRC32 | pdesc->ICV;
>   
>   	stats->Length = pdesc->Length;
>   	if (stats->Length < 24)
> -		stats->bHwError |= 1;
> +		stats->hw_error |= 1;
>   
> -	if (stats->bHwError)
> +	if (stats->hw_error)
>   		return false;
>   
>   	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 82fef04e5784..76f53b797644 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -467,7 +467,7 @@ struct rtllib_rx_stats {
>   	u8  SignalQuality;
>   	s32 RecvSignalPower;
>   	u8  SignalStrength;
> -	u16 bHwError:1;
> +	u16 hw_error:1;
>   	u16 bCRC:1;
>   	u16 bICV:1;
>   	u16 decrypted:1;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
