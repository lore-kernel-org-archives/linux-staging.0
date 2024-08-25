Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42B92D60C
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724625802; cv=none; b=j5kzkvRmvJQygS9mebgjEjquchiIgKSBdsRBwa7HhIvackm7CyAHYaI4hftCcRLM1jhwZP9ivdSS4meKYgKm1RVwAGOlkfRNvAZoUTvLg3ULm0Li8sg7WD+WCg7KjBNOmTXZ14Avk+xmmcz/sO+sCvknOz3+t9rO5WrsBMlXkNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724625802; c=relaxed/simple;
	bh=jngaTFMZPFu6vow30Ivlh/fYRC31JZ6x6YVe4xH7/qw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=YbmmRMR4ed+ZW2Emri0wYYxMe8qq/CwrnoCkwYxVHafGKRSCQR+jS05T7RekEHrHVq37PyC8ke6chIu2Ltl3cgfT36ya+ZBY9N1/A7V5F2cUvtqHgaXHAiTgwl2mhbuxzxO67/gc/+EXe84e5s3e2JZNsk1d163PlMXPVW7vtbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7exs0MR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7exs0MR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-714186ce2f2so2767991b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 15:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724625800; x=1725230600; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9clC3OC/WS5+W1S9lzwSe4wn+WbVo8I74kkv+luY9g=;
        b=T7exs0MRFEsQwY09LHoKIQOfCuN6P1g5mclVZBLeQjaLWQiRrdolAzW7Ws7VecJ2xF
         V3FLVcXaOTTF708cuNEKuHgyVmYouQ6wilWNqwaUD6g6v84L6yIE2nt33l6n+cYUuwoi
         b60Ppd0adqE4D2vummNzrdTxqNRPv67KOqnGqOHS0CaHsiU/NV0W+VZOfoTNY01kb76l
         Yf4CTE79L4TTRDH184iscMxUlOZzDk/riNEegYzgH4DcjZ/bRlPranYGYWVe9oBhKQQm
         SFF7yrAaf71fhi3RV59HetiqX8X6ekV4HvV6Ojwx30pFmS8JwnD4lJQQTXg0uK3mmoeg
         LOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724625800; x=1725230600;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9clC3OC/WS5+W1S9lzwSe4wn+WbVo8I74kkv+luY9g=;
        b=ZBJE2pb8i8MSnPE+B3HAG7mWVAMxTiVnMJOQ9czrxHXFVuuKrrZfjjcWiG/XEalGil
         UgUuncAHioRRSJrNBAKtbMeofbd0GWw1xjQ0Lw6rJ49Fg9KEaPVCsGlBF25Ox+Aea7NV
         vgTpQOuLXuFv4x9zjhQgoa9ye/PqAkZJFQmKWIOZFojkPsk7wQpf70Y3EsLX3brGS5QK
         LrRb8PlvHqvy1RjPAjRw1RJArySeNboz0pCqqCMMyUiAP04KNNIdkQgXPfVMsFyXhF0L
         nKolNAr70N+gNvxYALznFMllBtfedbnY8DwHR4ze6crdDF4aGes5a+ZHQyXduEsF2RpR
         5BaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqbc5HkzxZwVXB5doyh/D0ZL8cPOgIJyGOlJnRWo/hL8vXn3f1/pW/ZxdyeKveb2whj/n3Q/wxNymvF8fn@lists.linux.dev
X-Gm-Message-State: AOJu0YwchGaXDhgrkOf2tpE0g+7m0BrkrpxxdDVxjntZfbbtTzUakQ/9
	iWTS6NlXfnOlHO4DONq0WFuSlAGC56r8kmVDtZOEzZP/sab/MhPD
X-Google-Smtp-Source: AGHT+IEh4IwWngx7WZaiCUY9uaLglxb6SYoHnJ7dMB74dC8VqAEV00ht36d3ocYW2SJlQeCM4oNJ8A==
X-Received: by 2002:a05:6a00:9148:b0:714:3153:ab4 with SMTP id d2e1a72fcca58-714458b7d29mr7845008b3a.27.1724625800095;
        Sun, 25 Aug 2024 15:43:20 -0700 (PDT)
Received: from ?IPV6:2804:868:d047:ced3:41fa:c7cf:e733:9f1d? ([2804:868:d047:ced3:41fa:c7cf:e733:9f1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434236aeesm6062201b3a.30.2024.08.25.15.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 15:43:19 -0700 (PDT)
Message-ID: <324c34e3-3471-4cbe-aa6d-b14244ca48eb@gmail.com>
Date: Sun, 25 Aug 2024 19:43:16 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c:529
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht
References: <20240825214612.49254-1-alienwesley51@gmail.com>
Content-Language: en-US, pt-BR
In-Reply-To: <20240825214612.49254-1-alienwesley51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry folks, this was supposed to be a v2.
[PATCH v2] staging: rtl8192e: Fix multiple assignments in rtl_wx.c:529
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
>
> CHECK: multiple assignments should be avoided.
>
> ---
> Changes in v2:
>      - Removed two spaces in front of "=".
>
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index 47f1adf30ab4..67c4793e0fc1 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -526,7 +526,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
>   	mutex_unlock(&priv->wx_mutex);
>   
>   	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
> -		ieee->pairwise_key_type  = KEY_TYPE_NA;
> +		ieee->pairwise_key_type = KEY_TYPE_NA;
>   		ieee->group_key_type = KEY_TYPE_NA;
>   		rtl92e_cam_reset(dev);
>   		memset(priv->rtllib->swcamtable, 0,

