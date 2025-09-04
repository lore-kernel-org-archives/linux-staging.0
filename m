Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CC2A1D1
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756973082; cv=none; b=cB1D9JGf001L5ZqW3YE4zOAYK83acfhGqBtBkiv2XfI3q4tY/nrvklJVPo70q1WM9nji+inThn30BvC1NEQfSd7xaeoH/ffAVymP78jd2yAUNo6KPGkpO/m5tSZ8bMJFSI4fixWqzc1Dp0Kp0ykTaJFlcohgEElrWee/wPLM5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756973082; c=relaxed/simple;
	bh=R0F4LxX8JeRbwSchRubd0jiTtwG2dsiQbgH91N64AuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiyEAmTngQ/3hXQZmOD+WNWsYEJif/QEZ6RYzrAkwCYy2OGnP/KvF0ObemsRlN6DD1sbjIzDdxcuquFklvTiLUIMhCylkl8JnS4BsB3MGqIxlxcVy7WFHzGC+Sh7D2IWii/R+elPdXM7T6gpJX1NzoddNUUXiSsFiY+JdjSSI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYFHChyp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYFHChyp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so420594f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Sep 2025 01:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756973078; x=1757577878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMQgTSi+TMSWhdqJbfwjnB9XNjiX9Q7epetailYd/f0=;
        b=fYFHChypgIogwyJSAHkI0/8D4//LkC9ABHDZ9T4kNiqqTm4kS99eqnbTNnqGbWAUpn
         8bC0gdjgsK5aLO7zXLnEMU2IL7YvMUFwJ3zGNhDurKeK/amomo2DPoqw3Uu7lQ/eQzyw
         clrvLbNhAFI+1npvI9aUxxq9s7vxHWWyVtYiYzK8gsGrPjb0C8qu92LeGbUPqadulfC3
         12X/jxBTIYEyehTvwXaPS0YtS0/comAcKNJCnfdvPSqra5JHQZ/GFxkIIOm4FBt7NG4S
         VCO3cJOW/9XH561pJVBVxi0xBnmeOkYp0k4w+vSRKYxbxG3rGU5mmg+93Mcar+D8Hrrd
         M72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756973078; x=1757577878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMQgTSi+TMSWhdqJbfwjnB9XNjiX9Q7epetailYd/f0=;
        b=B0pOPqjwYZPuU2o1AsI4U/ueOrvk6LRo5tkQ1Nxv6xwZ5xzUrCTmUjGRJag/nkmb32
         79jybnUndfGQBjDdIU7TCGfixfQIiJi3/xWtpWI/yZDuLxtHV1qNnp2OM1Hi6YyBZahi
         0cC1xP5rZmTidD21SOJRR+XakveEkNQpCuXr40m7Tu1gyX6RRPIKtPhVpxjYnSpAeCI9
         1nQ8ODfS3tGMxD6J+UllkYupBl58FpLazkmiwDcEr9l8OjjSDP3WpKjj8tzuAfcUozLa
         T+ZVaGJQrkN1NMFI8QHWt60GV+kWZuiqWrUuxZQHjSn5P5XthNeelNrGTlHK5XjyOyca
         q/ew==
X-Forwarded-Encrypted: i=1; AJvYcCXRu0n2gIyWwX0IcEnyreAjWF3NgzsEuYedxRa3RnYgPwHC21Y+C4OWvHSqAus57CE3cBTzDCtAWSzI3vza@lists.linux.dev
X-Gm-Message-State: AOJu0Yy21gDurBcDxawdYe6D2o3D73y1YrotzGvOg7WoNViyE8Vq8lZj
	E3PTNWbfiAq10qTxxzMMzVI2FJghCUJ787QJrOwz3cvIAeUctNMUwl5uKXxmzaGYDs8=
X-Gm-Gg: ASbGncvvcU800kUjcwdmevhuCyOrA8ZrQUeARxQg4mGnZuXnF7LO6XnbTFd7avdRGt+
	rssseEkYJHk8qIod3/4K9F1XkSHC/rur8x+LwhhoW6Oi5msrG2E7zo1HBCG/VM7XLMwovqZatAY
	/n5wZjQ+VCJRRHareBFM57G6AQti2soSVN0PxDILdl6PZ2VPvZedUfTY5r1DjkJ/HG/upE2Zm+z
	h0LE7E1U1fU9tvshuXuC5OYLW1kTD1zOsePJ/SaofzsOV9GJDppGSSlrvjNH0Yoh84onFQgOhE1
	kts+ldCRLq1MnBkbLrF8SJ+PrXL4VAaHjae1xKv2niBX9PLjcDZNUFqtFmhFCHJ8FntgPLp0muN
	46wUKIo9PYwFyY1ptluaMl196loU=
X-Google-Smtp-Source: AGHT+IGCbRet6mDjv8hEUzW+n1WN7HfErihvQ0mwTKDBWlJ8UG8XGONqSLDPD72SdxeMgb9oxxEkRA==
X-Received: by 2002:a5d:5d02:0:b0:3d5:55c9:f218 with SMTP id ffacd0b85a97d-3d555c9f834mr9936116f8f.2.1756973077662;
        Thu, 04 Sep 2025 01:04:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d6cf485eb7sm16503365f8f.3.2025.09.04.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:04:37 -0700 (PDT)
Date: Thu, 4 Sep 2025 11:04:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/16] staging: rtl8723bs: fix excessive indentation
 in nested if statement
Message-ID: <aLlIEspZ2wLRnCru@stanley.mountain>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
 <20250904021448.216461-10-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904021448.216461-10-vivek.balachandhar@gmail.com>

On Thu, Sep 04, 2025 at 02:14:41AM +0000, Vivek BalachandharTN wrote:
> Adjust indentation in a nested if-statement to match kernel coding
> style and improve readability.
> 
> No functional changes.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index d05ff073af2d..a2b1e34765ac 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  
>  					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
>  					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
> -						if (ptarget_wlan)
> -							ptarget_wlan->fixed = true;
> +					    if (ptarget_wlan)
> +						ptarget_wlan->fixed = true;

Wait, what?  We're moving from tabs to 4 space indents?

regards,
dan carpenter

