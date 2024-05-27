Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3B516079A
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838125; cv=none; b=mjOzHUOGCBn+q1bWZftPUr2o/EjHa1dknARkRGcIKXds+EGIbR2MIek6jUQsMoGe/iTtdxhf6WB9J43tkNS4LeYrcI+2/f5TLcYYVx3vj3wIK9U/JPSbWRzhn9mMGszn9Ga1QbgDpIfJo7x2MlTQBxWW1Lq7Qbl/K/vEpLsNZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838125; c=relaxed/simple;
	bh=oUfOHq9Rlb0a7D4l3Lqx6FtCvm34YuPLn0oskocY6Bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcFEVh8kkazgO703E+A4t7F3+qDVqc34PMtB2jbk5VQxi+D4eJZqKFqSCqVxmRVXKQGbK/YYCoYZOLWVFRKuS7j35raffiDmU8mayRMVRs5wOvuT2GD1fTupieixy3rpok+Vkv/+656a4bHjPqX0RQwFe/+UnMcunL+KInn+EBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mey2LcAg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mey2LcAg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a626f0be662so1485666b.3
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716838122; x=1717442922; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcDYDHXFbJ6D+vBSxtRFYbaH4Amc09bTylRzwYEhBfs=;
        b=Mey2LcAgCLx1a8kmpjsoi0KecWw+k/3ZLcpkKeZyhFd5j8I7+3dXq2LwxHfPPDXyBo
         DCvMuKPU6R+/Lntq3S1ruMVKZNQnEO5w93dCgkWGLTxDQbL9S7bH1zukPgJX2AunDsP9
         3woKRRKSqRx7ToECzB3J1I5XOrSA178GzChQVspHQ7MDnvgvpWFKHjVA/MiukYRGNGrA
         20qj6pe1WoIDbifV8zF27jQ3bMO/zH3vkHyBng7eq9j0MAstZ6s/gPxjA3Sf22xoPV+C
         37HMjTpl5wgmJ43AOEje3MoIqqYby1dI1w1AcdgnU2yKKFlCjDsvIeK4p1OA9r3GExGq
         8Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716838122; x=1717442922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcDYDHXFbJ6D+vBSxtRFYbaH4Amc09bTylRzwYEhBfs=;
        b=dn0xA4DzgjC9x6Wzmwsd91KVlZlVrcoPWPGVDZbZ/qgRQFtwpttHnPnyD4vMDA9laN
         8b4F1/VPSEbvMWadkhZoWMhotBXlaVWfX9CrsW6BH0RS5W8zetgi/ShwYVEqz0bxXpFT
         Sgw1LSkK16t8a7j16B5yav8Xh/zD7nKOVp8S7PWHZsIwBrWprVeO9X+hZWM+55k8i0o3
         +sbWWFXKwjFgAFUyTar/qfN8bvzRDr+nafsTd9IBkmWwG6jocEbMaUW4uJV2OYHQTMNs
         hZ1AExHATBDtmubPfbcpK07uxba8KOJH/eF6W5HEbMqrPcC3/3Akxdq2G2GRtRYmdW0D
         xJmQ==
X-Gm-Message-State: AOJu0YwBI5vcJCUpF7JeSMMOLR/fijf8jYFqusLMkGiRGHnIW4JL4u3P
	c+Ej5Y/Dd8dwdecUvaWpKTPhCv6MM366lbm4jg7ZF009em5rNhnV
X-Google-Smtp-Source: AGHT+IEO5J9zAQ03jtP8nl1KN6YZvtcvzBWdNgZZ17Xg+gIBBgIGTqclMf1CStrUOqVQCRc0hmbJFw==
X-Received: by 2002:a50:d718:0:b0:578:6263:727f with SMTP id 4fb4d7f45d1cf-5786263763fmr5664377a12.4.1716838122044;
        Mon, 27 May 2024 12:28:42 -0700 (PDT)
Received: from [192.168.8.103] (dynamic-176-005-137-056.176.5.pool.telefonica.de. [176.5.137.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852495de0sm6047812a12.61.2024.05.27.12.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 12:28:41 -0700 (PDT)
Message-ID: <f1e18696-8602-40ff-be90-d232c58693ca@gmail.com>
Date: Mon, 27 May 2024 21:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in
 rtl8723b_cmd.c
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org,
 colin.i.king@gmail.com, ruanjinjie@huawei.com, hi@atinb.me,
 bragathemanick0908@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240527045856.72996-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240527045856.72996-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.05.24 06:58, Roshan Khatri wrote:
> This patch fixes misspelled words to increase code readability and
> searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index a59ae622f05e..d1ac2f44939c 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -700,7 +700,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
>   		rtw_write8(padapter, REG_BCN_CTRL, val8);
>   
>   		/*  To make sure that if there exists an adapter which would like to send beacon. */
> -		/*  If exists, the origianl value of 0x422[6] will be 1, we should check this to */
> +		/*  If exists, the original value of 0x422[6] will be 1, we should check this to */
>   		/*  prevent from setting 0x422[6] to 0 after download reserved page, or it will cause */
>   		/*  the beacon cannot be sent by HW. */
>   		/*  2010.06.23. Added by tynli. */
> @@ -964,7 +964,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
>   	rtw_write8(padapter, REG_BCN_CTRL, val8);
>   
>   	/*  To make sure that if there exists an adapter which would like to send beacon. */
> -	/*  If exists, the origianl value of 0x422[6] will be 1, we should check this to */
> +	/*  If exists, the original value of 0x422[6] will be 1, we should check this to */
>   	/*  prevent from setting 0x422[6] to 0 after download reserved page, or it will cause */
>   	/*  the beacon cannot be sent by HW. */
>   	/*  2010.06.23. Added by tynli. */

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
