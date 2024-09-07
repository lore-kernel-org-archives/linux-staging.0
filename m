Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8632C8E
	for <linux-staging@lists.linux.dev>; Sat,  7 Sep 2024 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687241; cv=none; b=grhkIFTCpfWGGGTY3hIi9URJIBBBVr2NLpnUOszzUrFu7bsvwZamsdxey3M1qdYCVRWl5o3VYTnbcyezhEwV8MKs4rEGypBsNsvh390dXhxus/7X9PvCGR4gSZyLB3josrletTKgFDm80Ub87QMzKTRUpfCfQAMp5Ps9vkbK+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687241; c=relaxed/simple;
	bh=kfcyOE4DpTjdjTKab5fkXSY8DHJBo8VRu2aq+jREYf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sY/MuxQq3lghfAf3DltpYLubn6sDxcEQPczBDstR7n5ZtaCkQq3usMKZ20YA8MGPCiVWhsWu08nffXb9q99Y3IGeF1m0DOaOMbb6JB/HmX9R3IPXxSN8mdISjF3rRNYmilAqKdiKv8j/D0GhkZ/lkzAkCLwlUnTt/z0aXvn16jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlbaLvX8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlbaLvX8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d24f98215so21938866b.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 22:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725687238; x=1726292038; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DjXA/8GrhI1BNWvWDz88P6fjRKdiu2Q/jSNXR3agbs=;
        b=XlbaLvX82niV9EPS8FZ6IFoNsqYrVoYltkHhy6ceadHgprezQRzj5jD27lqfqK34ky
         z6YG6ITU4DdFO2yq6qtvzYOFqo2X7xrhQEdEk//OCgWBPMbZnkOphl4ygChfaypic0el
         RKom224KwaKul2v0N2o2942oKvf1UDiywTegEFFKUuE7TRR7F7R4kO/p9uke6t6UyFOl
         gHVHYV62osqonWHwX0jnFUnWrTAmS5stu+HpEhnfpnrqnLyBY2uK6Uyxxryycp0Z+d8i
         jDmPyNW8HvE9GaWUGO0cqfbjRzFWiX4/9vMdQFhU5K58Ve1jKR01rKsKA0sQaKkCFGzI
         eE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725687238; x=1726292038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DjXA/8GrhI1BNWvWDz88P6fjRKdiu2Q/jSNXR3agbs=;
        b=wS0v+HbKnZZpt2e3R2ht8wq+UdV8R4iXlfSFKm5gctui3Pd+g7NsYG3H8YZdSwJoXb
         G/4/2ccCUTEkHiz5jh9yYihCc/rhzuCmK0YTMjJlaW2JlLQWFkX9GThlS6SRG7lGZgYd
         BbWf1p1QUi8v+cTfCwFXJaXxnFjej1JZWVhBFw90/0UX6Jo/9XpzAwfEAsYlUam91CHe
         BZe3JVOC+wb0cKTsP734xKJz5T0Rucam7Nu0ppU8qEQWkp1K1HP2VDSghsoi1MvzvfdJ
         UJ6PeXA+Jfx57IDz7CX0Ai8yMeRAlHAxs8VvqQbr2tRQkS/QXomh0A+uCGtZhB84Ekca
         q2TA==
X-Gm-Message-State: AOJu0YybZLFBF27qA+/IbPdVvHfKOHv6L/NxRNKSudAeaBqncuMt+0D+
	w4S1qC+Uiw/tUaXC43PezRyotJAcgaLjZAArX7Mrmg1g2zqpOa2S
X-Google-Smtp-Source: AGHT+IGHDYjOxcDr2zqVtQOZwyIIisn33mp9gJRdPX39U5JX3dvGPaknm1wyYBsds6xszZJNNwvuIQ==
X-Received: by 2002:a17:907:eab:b0:a8d:1545:f48a with SMTP id a640c23a62f3a-a8d2494c101mr43805666b.61.1725687238365;
        Fri, 06 Sep 2024 22:33:58 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8554:83ef:b48b:9bd4:f165? (p200300c78f2a855483efb48b9bd4f165.dip0.t-ipconnect.de. [2003:c7:8f2a:8554:83ef:b48b:9bd4:f165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced18csm29710666b.161.2024.09.06.22.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 22:33:58 -0700 (PDT)
Message-ID: <1d480b00-de7c-490e-8042-2d2c865ddbf0@gmail.com>
Date: Sat, 7 Sep 2024 07:33:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in
 rtw_mlme.h
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240906141134.10118-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240906141134.10118-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 16:11, Roshan Khatri wrote:
> This patch fixes spelling mistake to increase code readability
> and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> index e103c4a15d1a..e665479babc2 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> @@ -131,7 +131,7 @@ struct mlme_priv {
>   	u8 roam_rssi_diff_th; /* rssi difference threshold for active scan candidate selection */
>   	u32 roam_scan_int_ms; /* scan interval for active roam */
>   	u32 roam_scanr_exp_ms; /* scan result expire time in ms  for roam */
> -	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to speicific target without other consideration */
> +	u8 roam_tgt_addr[ETH_ALEN]; /* request to roam to specific target without other consideration */
>   
>   	u8 *nic_hdl;
>   

Hi Roshan,

please make a patch series out of this 4 emails. This makes handling 
easier for the maintainer and the reviewers.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
