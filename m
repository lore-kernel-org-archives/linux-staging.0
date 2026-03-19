Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909A3B7773
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911491; cv=none; b=VOYCQA1WhSbwBvUfhYMYYPhlvD6zrzJyJzzQDrE0rAMDx/RlR+sGcvWnQ+wRAff+esGWIf0uV86ebYe/LAp5YwBcaGFnsBxHiX6IZrGGizWzPzPrhvRaZqaCiW82m1MQ9rYk/G4zBnFgvUQQHHm7ams5uThyrhsqk9lm2OrE0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911491; c=relaxed/simple;
	bh=VlMFGqFNa6qHJXYwlaOw0p65lxbN+ZKNFr8Tvj0r90Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiOHrkius3gqSIBXVPzrJYYgssKb1auMag5eYcaYa0JV33Y1q5qPQ7RrYAMEq/DYia1elcUbDfBBxTLbmxKU3BVtSAdpr1Xl4AZFZLgUWiwKy49bVLEsgbTCJ7eBrlfZq6QComzxhVFffJIs/CiFfXDuoDxGVBfJvMnnnBdZ5mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mn0DhRM3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mn0DhRM3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso5475355e9.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773911488; x=1774516288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KMsuMASLWqV4kBldHiypQUMWM2QEM26nQoK9tIBKiA=;
        b=Mn0DhRM3YHnAdSQj70iAfCYOM5GSiSEuKqYAs4YS4WdnyRUJKEEiCMa2WY9L21Rot1
         uBd+WLm2Hh5ZX8Ar/+GYy2ucisl6gTESvxPOWbUpF1roR/+0sDIEiq8eROceV9WuXg/q
         lIHglSNhw6/JfGQdsuqWvzbkVn5iijJ/Vzu6XtABBzH1pzlTLuu9DG0aZ3guPtFl1AJS
         ZbvoxiVOncjF2jxnEhczfyADvludN9IfWMFQ35RGj0QEs2vEU2+TAQFdplLT29Am+Dv3
         cEPUukzZMC8V98F1heBBgqNEBe3bsuuo2IRtC2JbUtGW2Nb++DWoUPQ+idM7b14yULEP
         b2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911488; x=1774516288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KMsuMASLWqV4kBldHiypQUMWM2QEM26nQoK9tIBKiA=;
        b=LG320AmvxF55XBtDCOBKQLt2ptk1bnmhFrxVg20FU7/SiSlEL9Jz1LtFeZ8KrBIz8l
         RHZz9NHgsuD9hD3MIqhx3Uy7PfwJc7VISrka54q5ud932FcS4RT7fkrQFZIV0TObCVWS
         kazd8Uy5mioJVGqz/1Jr0onhYo+Q+32fA8L09EtxKxLjZwvsYwi81wVzMjRhulshwy2Q
         cLldGxeSAOtJIBXjDr+S+Lzyy/oS6khgZKGgnxRRxqsaMarW/yX162J7+06xdNO5byKb
         z/qLFVdLmTgo4y9q6qnJuc+DoG9nKvYhiy+9Hc6Gra8WhJePYyiJD9qejBADoEAHKsN/
         rzbg==
X-Forwarded-Encrypted: i=1; AJvYcCWSK05z1qRO9KI14Bbt/uDOjm5mJ4DpJVQ/N+g0GJvj066yLnmVubxPjWdxwMSoa3FbISWtQA0/Rro2G9fE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3MSHkfaL7ShtnedB6LhRZyoCobjNE6YpwXDkKZL2zMGnko7LB
	fSUTmcaHRU1HY8OqUS7j8PzX85fXiF4WgxflPD+WApiiR9pHtAAbe3CfdDGw93arrWA=
X-Gm-Gg: ATEYQzwInRTtM40qv+DoCDv8FCcfUv6WmD62xrLzUrlGtkm/CXn/yeDYC0R81NyaV7Z
	+QCePa0FnFcpsKzSg9yURzIfMhMgD49HTKRBaV7fb+e5GTv4mHE/opT6gQ6FfAnT630c9Efzb47
	2bZwPqJt1fJdSHWelbLgJKlne5iKbD9aLNGhdXwlEeL8axlrOYfX/KGui/ZVOOBGyQhLME4DlXP
	0tJXmaKivmWo9YCfkiexFTlCUh8r5zohBi2FDjDp0SlyhhKup+Hz8tAm8yNXLx3+w6eoU27g8rn
	Ia7BR5G8pbmwKvMYZSXc+M47RWJ0mzjmfzsoqqmdRHmFa1awiX/DxY4wwMWDd0Gnlw8jClR9QCb
	7W/UDfDoM6JhzLpM4YRwu95eqAYzm8b12YKgnraepjRxvULNrvDOcSBYo9X7BDcQhq0C9NnG1iW
	KxFtJu+neG0MPW5aP0fOi3+vDsFXku
X-Received: by 2002:a05:600c:b8d:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-486f421ef58mr97208055e9.0.1773911488270;
        Thu, 19 Mar 2026 02:11:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e48ad5sm167617435e9.1.2026.03.19.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:11:27 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:11:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces in
 single statement blocks
Message-ID: <abu9vH0uNUkGFNB7@stanley.mountain>
References: <20260318214117.10285-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318214117.10285-1-rayfraytech@gmail.com>

On Wed, Mar 18, 2026 at 10:41:17PM +0100, Oskar Ray-Frayssinet wrote:
> @@ -403,10 +385,8 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
>  				pBtLinkInfo->bPanExist &&
>  				pBtLinkInfo->bA2dpExist
>  			) {
> -				if (bBtHsOn) {
> -				} else {
> +				if (bBtHsOn)
>  					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
> -				}

The patch introduces a bug here.

> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index af6cdda8238d..f4b2854bada7 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -25,9 +25,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
>  
>  	do {
>  		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
> -		if (0 == valid) {
> +		if (valid == 0)

Don't do unrelated changes.

>  			read_down = true;
> -		}
>  	} while ((!read_down) && (retry_cnts--));
>  

regards,
dan carpenter

