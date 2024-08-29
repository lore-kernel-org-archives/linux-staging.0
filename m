Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454191B5ED5
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724955764; cv=none; b=L4gSJjlmN3LuqnLeddzCnv5lucNgh6lT4IWr+hg5cywG6IaV2VHF4kgh4nce20MUw/ZrphOYKG3umz5llwG9lsxdzZckJPlLkmAFtmP/y83EmcTHMEUuYwDC5V6xcmr1Xp/m5DiYJ6QHaFW1Wn0r+IF+OyQgCHfQL9dtK55kTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724955764; c=relaxed/simple;
	bh=EdRezSjvoAtG58LxdU0dSUr18k/NbN9lOQ5debIepA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=R7WWgvGm+a/kWRpqjF5CZhtsaUzVvatRLcenIicZGeaWTVhboAgJdw/1V73twyxnYEVrlCWJo+MwaO9NsC3ij1Ti7cy+Ko+JZ36Q8yoSxsxNL2bUbmW1CnAt2cuysF5K3uTwLDLc2r80capRBiOLqgY1BQuWfEu10kJyL9Gttog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjtKStSF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjtKStSF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a867a564911so121100066b.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724955762; x=1725560562; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M5+cpBem0eisErPmZiRKMOQLcSQZBq+r0irTvKnUIhU=;
        b=PjtKStSFXGNhh8lOP08ONCOsjKCs+mRqhznUIUcZl/AxbuV3uo0TJVdzpxOXh2u3ds
         Ufgdz+qUDqAwZGbmAMls4kFraO5xUtGkMaSo2tB+rNIup5Xu4740j1I7LmSP/gG8qxhe
         FL7VrzbC47QWuxrEMd/iioHYCHVVfyaOrRAFLl/Qr+SXdAF5MMH3MiLOLDjD+Yx2J1GJ
         oBB22XhaN8xCoM+GJb93y0ECSQrWx6qrlnn/hkmrA2Jd4WJULCmRft4oA6dHkogWKUTy
         CyS8LnCSiPMvXf7XI2+Wwm/Oq+ozbMpfJ/jN4WfwyeEn/bg3hImRat18Z/TecR37nvN5
         qkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724955762; x=1725560562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5+cpBem0eisErPmZiRKMOQLcSQZBq+r0irTvKnUIhU=;
        b=l41sJk8NuRfJ7XWMTmHAHPdjtnl8KwuHSOFPR4q8gJ35IFSYDVzQUNdsRexo6xcc2c
         Y0E9N1V1taiWdoEAxjcPin1+N75B+glSZaHk6Y4SL8yaa50wsDw3UMk6OQ6g5Pv0d1dW
         TrcVssHpEULUwbolafN6/DrPfBL3vu8Cxlt9yVaQXeuLMulOP8j7bG6oa9ot4yme4i6P
         VCKwVqGHsRnNTjSfO/zsvLhfHTOePNhodssrMcSvIoXQgfqo6jIsvZDJAQJ2wQjRjIUo
         UouRtzCHzBx4XeUlrpBrA428gYwkX3NDwxzH4qRemrvb5uWSSPiQTpsDUwppPxgGSA7B
         Ee6A==
X-Forwarded-Encrypted: i=1; AJvYcCUJjZyHXKX4E4TYwxL85vFxCbzxyIFCMCzOcz37SwLNbTrp2XPi66eBWiopux4PdeieERveR13QoTyJwZqp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw60h2XkMRAWsdHe9SPJjpj+diz8RjM3enWVgFo0ro14RprfJjO
	SualYvbLR0JGRSCY+M+dJsqKpJhSAqHYiSFABkmkHnKJoKOrgMOW
X-Google-Smtp-Source: AGHT+IFbY9vzwDNgQhEOwDhJKdStZC58QmdTc4mRGUxHrxcpQTg9GSjmUTPlBm+qE6BKB0nNEPkPnw==
X-Received: by 2002:a17:907:3ea2:b0:a75:23bb:6087 with SMTP id a640c23a62f3a-a897f8bce19mr339988066b.29.1724955761281;
        Thu, 29 Aug 2024 11:22:41 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8508:ea23:888c:e220:647c? (p200300c78f2a8508ea23888ce220647c.dip0.t-ipconnect.de. [2003:c7:8f2a:8508:ea23:888c:e220:647c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892225dcsm105961066b.208.2024.08.29.11.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 11:22:41 -0700 (PDT)
Message-ID: <486ebba1-751d-403b-a686-e5cfa31e132d@gmail.com>
Date: Thu, 29 Aug 2024 20:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8192e: Fix Assignment operator '=' in
 rtl_wx.c
To: Alien Wesley <alienwesley51@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240829123251.83574-1-alienwesley51@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240829123251.83574-1-alienwesley51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 14:32, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: Assignment operator '=' should be on the previous line.
> 
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
> v2: Line number removed from subject
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index 47f1adf30ab4..2d42e7a5bcdb 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -677,8 +677,8 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>   
>   		if ((encoding->flags & IW_ENCODE_DISABLED) ||
>   		    ext->alg == IW_ENCODE_ALG_NONE) {
> -			ieee->pairwise_key_type = ieee->group_key_type
> -						= KEY_TYPE_NA;
> +			ieee->pairwise_key_type = KEY_TYPE_NA;
> +			ieee->group_key_type = KEY_TYPE_NA;
>   			rtl92e_cam_reset(dev);
>   			memset(priv->rtllib->swcamtable, 0,
>   			       sizeof(struct sw_cam_table) * 32);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
