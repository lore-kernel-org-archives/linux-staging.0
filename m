Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C5F19ABC3
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 21:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706575; cv=none; b=LG0ZoEsJolUiMTgbaOrLG89vfTekJ+87aC9GpwMNyxsGXkr/B08JHTq4NjxPh7IipN1R2BGj+OBZWGbqs+2KhE/LWmc48M3I4dgmgECAbvzApFOQIK6MO6JJGLPzEozvuGDJsso8up+IuxsApBdGXaFeJBsTnhl0ooUmlCgvNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706575; c=relaxed/simple;
	bh=vAw0jhnjl/TBb3fjv71HUyK8CMWWWW9nwcU1zAgdAQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BN+CTm0gMkKJBh0M0KDF65Aoz6ptEBeCdOiFkRrZbcYRuP5lKJyWV2gw8yFh05LUKhsIKDo+8toGQq7dHi9s48MEcSPcBhZy/lgdp2J8PrTaC6S0SrMp7XOQEzLIWNxvdbf2AI8+RedVidMVbTQltVCR6c6RJb0zhzP7b20owkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak4pkzlH; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak4pkzlH"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so4586254a12.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 14:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724706573; x=1725311373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maYmRQ8BUA18ToixsUnE3Tx/VOkcQJLLFkI/iV7swC4=;
        b=ak4pkzlH/z17F7ff6yvAjDQgOwKugPIR7Nzar3HDgVxrntzLW1GLxl0E+hH/r7JixV
         6XlFeYi3taaJmi8VB1h7aXBBwx1RPUOCVx2iRJpR3UP+xkLbkD0brrpCMBoRvanSjLGQ
         +vprV2ZJNuA3Wlh7/Fpt4uVEXVR/2LqhfYj1byL+ZXCQhu0B2+od+AvTWc9aPjI0SAWW
         mK13I6Abuj2qgwEchmcL2Mm1TvfsZQaCU0Qwax6bX/T1VcbkQwHXghRjCM9YOhzBLUHn
         /Vd9IrtaU+pb4T2o3Rs90f/m8koCfjhFwrKxXZ+6h75isctPhgiV2SNadap1nrodMBJz
         UzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724706573; x=1725311373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maYmRQ8BUA18ToixsUnE3Tx/VOkcQJLLFkI/iV7swC4=;
        b=U2S+f0UIlPPHTNnbXm74nZFkQnazIg2DFIkklnV3AEZ7kaY/vT6mL7laVESp1PAXZ3
         wZIjbWXwHAhFavksoUtXRt2m6h4fnNJgDn/h6MK5YXh+59YZyxcynyvqAI1wPsur/mxo
         PCNhuSbRjRncpY9mgdjLzD0fjkHivl/WQWL56gnqhUjoiH65ynUyNWHTU87X0PTwt9qr
         7KdxXcvqFvvtV3MqjpkV3aQwBxDr+8sDMY/ufDVb7iIrl950Xdq7NWyvvqQdMGlzPDcO
         yGrqkMPfKSZhEI277yj1r1s311y9GXoqqE2EsU/9l6AzWMDDDNctDgabKXRlTQgRfFMp
         reDw==
X-Forwarded-Encrypted: i=1; AJvYcCV7J5sVr7Ja91ouT1CF/W19XMosDyVopDJvnxVVoii2p1vWjY6jooVMcYh+gI4rj1ey2BRMCeisI6SsbK+Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxgQUGjOcZiEpnc22xFnfSzZO23C8NeOe80MgGXNoYdNdhuqRmT
	eQQ7DQ//ys9pz7v2xc0jWx+0tVDt5UN5OPipHvMeKl6ktKFhsvdr
X-Google-Smtp-Source: AGHT+IG+7yLIOwVvVVsGb2VMIvAi7E4PP/ggkMHJBEXY9FiKZ7RaG6OiSVf44W72QVjbLF6feq6mkw==
X-Received: by 2002:a05:6402:524f:b0:5c0:ab6f:652a with SMTP id 4fb4d7f45d1cf-5c0ab6f6697mr2751761a12.3.1724706572335;
        Mon, 26 Aug 2024 14:09:32 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8502:42e6:b0b2:a0bb:dc32? (p200300c78f2a850242e6b0b2a0bbdc32.dip0.t-ipconnect.de. [2003:c7:8f2a:8502:42e6:b0b2:a0bb:dc32])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb21399bsm195339a12.50.2024.08.26.14.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 14:09:32 -0700 (PDT)
Message-ID: <16df34b2-4d9e-43d4-9176-dea31d58ce2d@gmail.com>
Date: Mon, 26 Aug 2024 23:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8192e: Fix parenthesis alignment in
 rtl_core.c:325
To: Gabriel Tassinari <gabrieldtassinari@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ~lkcamp/patches@lists.sr.ht
References: <20240826195915.8494-1-gabrieldtassinari@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240826195915.8494-1-gabrieldtassinari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/24 21:58, Gabriel Tassinari wrote:
> fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
> silence checkpatch warning:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
> ---
> v2: Include the modified file in commit message
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index ad21263e725f..18739583f579 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
>   
>   	if (network->flags & NETWORK_HAS_QOS_MASK) {
>   		if (active_network &&
> -				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
> +		   (network->flags & NETWORK_HAS_QOS_PARAMETERS))
>   			network->qos_data.active = network->qos_data.supported;
>   
>   		if ((network->qos_data.active == 1) && (active_network == 1) &&

Hi Gabriel,

I would do the indentation one space deeper to show that it is included 
in the if (
-                  (network->flags & NETWORK_HAS_QOS_PARAMETERS))
+                   (network->flags & NETWORK_HAS_QOS_PARAMETERS))

You can ask the question why I did not tell you earlier... sorry I 
missed that and I wonder why checkpatch did not catch that.

Thanks for your support.

Bye Philipp
