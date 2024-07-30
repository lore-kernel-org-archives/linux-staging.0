Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1554318DF92
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722365727; cv=none; b=JMOzHBYxJbGjqqtATjEdzoXAqDjrgfLaQzfGlu+eFLcJ/y4yUxJOXtIZyHbIMj5LZ9lF8JhATKZy7oPK4RNYfzMhRHBh22uw3gyNSysu6HMLnuzLojbHxaxOiRszI0P6UcNIp+zh4RafJuyRDho3ymKJtylKVdWGgB9w22LNT4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722365727; c=relaxed/simple;
	bh=ytLFwU5W9RoxWln8v2ZX/zIXkeL6cGK2uuWkaCil1VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmqwcX7qE0nLPHlX3yxq7jrki6NRXMHdyGHMRKCRkDqvHf0+Ha1KiMAUQahDBnvlLzGaMNN1sK1JYRS+oWZBK+cNnCThrJNCDGjfXXIltkxQ3ZRvPtJaafjOYI177JgdSN7Csi3d/UwK5KHbkmgb+cfWoZ6LIL81XdFuDe25iSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3HRi05y; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3HRi05y"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a9f831d47so49867166b.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 11:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722365724; x=1722970524; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXefQtP22X5XOJj1KBluJ3kHyMBxuAX9s4JgXdRwuF4=;
        b=X3HRi05ykTsR27jUC3vjJL929D+9x9CSun222cc4Bq/5MYpRZNjZ5IVo26WlgfVf6v
         Ca/T3xbJEldZLwo2Pv4/xUmkt24mCOxh/g0ngymvnzXpRsSygkyVKdSpicnP4d1IBLCS
         RzIZhYKzNQsXiTSQUeCTkS41mLKu6f1gqxtEOhGAXviLoIbdNIQ3JLmNDOssabA533n7
         hbHymlnn7eMtfpjJ8Ob6hZ8vCOfo0hMMU95w85XYaB/qFHM4qF0PcAAsy874tf52d8np
         5v0WFQwGwqQEQR3MBTL31KPbiDXL5IKudg/tN8PfeOVKXGUQwijvUWYXL8jvTAZ7K+Os
         +U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722365724; x=1722970524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXefQtP22X5XOJj1KBluJ3kHyMBxuAX9s4JgXdRwuF4=;
        b=V8i3WpVUGHHdBVAIQHJtUYxNCp5oReBXDAKfIaRUtALuYiqjIN9GqanzRBpudRl1rU
         H4jkgozW6zgVfoNi+r7ORBC46AnMrdExc4M9i4h8OkUbwboDhSnQameSJkbO0VRdDiVD
         tUHLhP43rc3VgmnIKPuTvU37vpchuNXVEt0vi7o03EoziZ5vMhi5IVPuBuzMlPzl3HI1
         bfOk/CB/QqwPJffDNM2sknzAa64lGsq18VN3Noei5qQBXiq8rsdPiN6kFftW+5v1yNZI
         3oI/HRc8hPkfqtjN9KbNAYkOlNzKgRcsofiYQI7qPYJr5ni3fyYKwGoJhzv6WvYs7pM6
         hCtQ==
X-Gm-Message-State: AOJu0YwFb9qG1olWbpDyMcezH7DUAE8JOMetx0vdmwMwOuUgVQTMlbt8
	gvgmCXJFdCbMu2W3+ewpSrq/p8+s50bEyb3R9cyKfVKJcHnAZ6ecyqOJBg==
X-Google-Smtp-Source: AGHT+IHHqeJ2PT13d4BRk5orAhekOZklxnTzS4pVLy2itB3AyI24Xcdas+iLqsgimifwTN0sQP+Kbg==
X-Received: by 2002:a17:907:970a:b0:a7a:ab8a:38d with SMTP id a640c23a62f3a-a7ac58c4a2amr863457966b.4.1722365724008;
        Tue, 30 Jul 2024 11:55:24 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8552:f0f5:c00a:214:55c4? (p200300c78f2a8552f0f5c00a021455c4.dip0.t-ipconnect.de. [2003:c7:8f2a:8552:f0f5:c00a:214:55c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab231fdsm673446066b.41.2024.07.30.11.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 11:55:23 -0700 (PDT)
Message-ID: <0812112f-a06d-4ef1-8ca2-468973191ca7@gmail.com>
Date: Tue, 30 Jul 2024 20:55:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Improve MAR register definition and usage for rtl8723
To: Manjae Cho <manjae.cho@samsung.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CGME20240730155255epcas1p4ab3b5e88d400e2221aa1cf5cf234ea19@epcas1p4.samsung.com>
 <20240730155054.411059-1-manjae.cho@samsung.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240730155054.411059-1-manjae.cho@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/24 17:50, Manjae Cho wrote:
> This patch improves the usage of the MAR register by updating the
> relevant
> macro definitions and ensuring consistent usage across the codebase.
> 
> Signed-off-by: Manjae Cho <manjae.cho@samsung.com>
> 
> ---
>   drivers/staging/rtl8723bs/hal/sdio_halinit.c    | 4 ++--
>   drivers/staging/rtl8723bs/include/hal_com_reg.h | 3 +++
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index c9cd6578f7f8..9493562c1619 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -380,8 +380,8 @@ static void _InitWMACSetting(struct adapter *padapter)
>   	rtw_write32(padapter, REG_RCR, pHalData->ReceiveConfig);
>   
>   	/*  Accept all multicast address */
> -	rtw_write32(padapter, REG_MAR, 0xFFFFFFFF);
> -	rtw_write32(padapter, REG_MAR + 4, 0xFFFFFFFF);
> +	rtw_write32(padapter, MAR0, 0xFFFFFFFF);
> +	rtw_write32(padapter, MAR4, 0xFFFFFFFF);
>   
>   	/*  Accept all data frames */
>   	value16 = 0xFFFF;
> diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> index 9a02ae69d7a4..baf326d53a46 100644
> --- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
> +++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> @@ -151,6 +151,9 @@
>   #define REG_BSSID						0x0618
>   #define REG_MAR							0x0620
>   
> +#define MAR0						REG_MAR		/* Multicast Address Register, Offset 0x0620-0x0623 */
> +#define MAR4						(REG_MAR + 4)	/* Multicast Address Register, Offset 0x0624-0x0627 */
> +
>   #define REG_MAC_SPEC_SIFS				0x063A
>   /*  20100719 Joseph: Hardware register definition change. (HW datasheet v54) */
>   #define REG_RESP_SIFS_CCK				0x063C	/*  [15:8]SIFS_R2T_OFDM, [7:0]SIFS_R2T_CCK */


Hi Manjae,

please start your Subject according to the expected standard:
staging: rtl8723bs:

The description seems to have a line break that should not be there.

please use checkpatch for your patches:
File Nr: 0    Patch: ../../../Downloads/20240730-[PATCH] Improve MAR 
register definition and usage -17243.txt
WARNING: line length of 126 exceeds 100 columns
#41: FILE: drivers/staging/rtl8723bs/include/hal_com_reg.h:154:
+#define MAR0						REG_MAR		/* Multicast Address Register, Offset 
0x0620-0x0623 */

WARNING: line length of 126 exceeds 100 columns
#42: FILE: drivers/staging/rtl8723bs/include/hal_com_reg.h:155:
+#define MAR4						(REG_MAR + 4)	/* Multicast Address Register, Offset 
0x0624-0x0627 */


If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

In case of questions feel free to contact me directly.

Thanks for your support.

Bye Philipp
