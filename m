Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393918BC20
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726169845; cv=none; b=uovzOAceTx/CK+OjsOGaVGJ5P2uE+NdCckqqy709M14sAYNYb6Q3tLsGEV1dukQcfUADPZxPWay231nc4UWMhlkf5+kEIlT9NJw2ZZwq8jpKzhzxVh8WghQ1nKedsAIPRgcBN3i17EZiEhTLrdbzYHAZD91klQBYFEqPoraI7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726169845; c=relaxed/simple;
	bh=xWQSXs1ZOLZ+4E/deszpoAA/782TXwTXNDMJ/einzp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoqY2Yqe+qq3unw9qTrWFVYOIjlieHLalATetFa30tYubdMl6ZylGNxkaFwVW2MgoN5802Jh0od/bldtGGtPGS1P1hAunttQKsjGpsaHVbixAsC3i1vVEOi5HNvalw8d8thRGVtOftr9/asQfxHFXL8ZaZ6FkgQ4oJv5f65MplU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkW6gWD+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkW6gWD+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374ba78f192so1069065f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726169842; x=1726774642; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uDVigO3nlkqfYUQJbFeCA8m5w5p/bsZsuyFqdDT7dw=;
        b=JkW6gWD+OwuwP6oELZxT5aLFzpM1HdROqe29tv5MfNP9lAB/Uwyk1dgj7Ie7NxDJ4/
         SCs+1nx0R/+KPqg3wtmQSvbLnfLgjGZnzHeqR0uYoejip3AKd5KdfAp4HDYemdq5i5Pw
         ZMMAKFy/6VhGmYOE3Fbc3B85F+3WjW+RH8mP03a0LCAD0HkMnkhZpLUHwzAHNHDgkq9V
         11bEwnbC+vgvULVWWmvDtHvhAilN1qsx3zMUBPhTjLfJj1OJnaJv6ilTqJhRc9XQmqIq
         BDSJVyNH+d4jOpkSa5xBscdOaEmJInFdam/J7Ec3yzjwE2gA3xDKNaug9YfqRKfpjUBg
         emxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726169842; x=1726774642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uDVigO3nlkqfYUQJbFeCA8m5w5p/bsZsuyFqdDT7dw=;
        b=MG7LMiHNseWWqNKtwBBLrr8STL3wgnjbMLSqetSjcvXmJVPWu7Zb9xlpPgeTBTEJjt
         wNuFQSMk3oLrbXQaTxG/bbrfncM6X9+i24Q5RFJMOS5V+zVCWtjFa27xDb9/lJnguOc+
         wHnnV18bjZerFWYuezH6O/D7KnI7kXDTfUaGu3SRCfgRuMA2T8/Tf/5yiwPATrujE/2Y
         Nq13J+x4QLqwn2ibk9Fqm7Y/ljD9GKkb1jaKc4f+O/EmSAaW4WRADuvQJwIDNHM018i/
         yKV2xFc94NvRTX1NU2StMhBOWBIhRqyNhWF8uc+SZfWzOPdPOUVADLuOKU6xNGfZreJl
         DLmw==
X-Gm-Message-State: AOJu0YzIFoaGnhlczB29ISwz1Dqw7iPO475JrOF+ILQT5ftnKomxS3T4
	jpoCabzYxD4dr66Sv4L5ugw3E8MkAlXYcUkNt1B7gtbyrE1rVFvk
X-Google-Smtp-Source: AGHT+IE63JRqRfOKMao9Pu1r29Qu+gc4azMXKcLseMC3NCdjvPUt9P9CVXWY5AakafWezdn2wI3u4w==
X-Received: by 2002:a05:6000:401f:b0:371:7e3f:6cc with SMTP id ffacd0b85a97d-378c2cfec94mr2672463f8f.9.1726169842157;
        Thu, 12 Sep 2024 12:37:22 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8557:476b:8cfa:99ee:514e? (p200300c78f2a8557476b8cfa99ee514e.dip0.t-ipconnect.de. [2003:c7:8f2a:8557:476b:8cfa:99ee:514e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76ee5sm6930549a12.71.2024.09.12.12.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 12:37:21 -0700 (PDT)
Message-ID: <6ca0e9b3-108a-4c1c-bfd6-1307bfe31e24@gmail.com>
Date: Thu, 12 Sep 2024 21:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] staging: fix warning of -Wunused-but-set-variable
 reported by clang
To: Ping-Ke Shih <pkshih@realtek.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
References: <20240912022522.10715-1-pkshih@realtek.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240912022522.10715-1-pkshih@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 04:25, Ping-Ke Shih wrote:
> The build of wireless-next pull-request using clang report warnings [1].
> Fix them accordingly.
> 
> [1] https://lore.kernel.org/linux-wireless/172609384625.1065358.6518424528532813444.git-patchwork-notify@kernel.org/T/#m405a10ad637bfc5f337127bab81336d8569e49cd
> 
> Ping-Ke Shih (4):
>    staging: rtl8712: remove unused drvinfo_sz from
>      update_recvframe_attrib
>    staging: rtl8723bs: remove unused efuseValue from efuse_OneByteWrite()
>    staging: rtl8723bs: remove unused cnt from recv_func()
>    staging: rtl8723bs: remove unused 'poll_cnt' from rtw_set_rpwm()
> 
>   drivers/staging/rtl8712/rtl8712_recv.c       | 4 ----
>   drivers/staging/rtl8723bs/core/rtw_efuse.c   | 9 ---------
>   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
>   drivers/staging/rtl8723bs/core/rtw_recv.c    | 5 +----
>   4 files changed, 1 insertion(+), 19 deletions(-)
> 

Hi Ping-Ke,

I cannot apply your 2nd patch. Please consider to rebase.

Thanks for your support.

Bye Philipp
