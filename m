Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8486200112
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314421; cv=none; b=VX/kdpWcYD3EqFb1vGsa4sJXCnlUGOo399X5Bs3M1VRmlTax3TzC8VpkJp7LF9fw8LtnBpc2hdvTJdIhh64egQX+m0dABI4c813BRg6M/0U7wZSMlFpWR78JKOOcVBNK954Ozq7OGaFiJLAKEJK9WzX8PtFDUj0lDZueEFNc8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314421; c=relaxed/simple;
	bh=Rz5c9iymJ89RgH7VupYvYE77SNzmWUAZJfYVmptlxFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ983FpfISYmEq/XnA6U4Pj2eM+1tDxEZ5YP8EFQxewQQ3k5MWI7uOiY49VX0m/jMDnJubRzqyoyV3pc2sj4LEleYZ5FPTMrmfEhWnv0UE0S8ENl2L7RJXzlECSau8+WnuGF+czaDWFnsjZFQq03jg+h6I2oqVx1Pk+fqrWRrrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMBNzyO8; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMBNzyO8"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c172f1de1so1371572a34.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751314419; x=1751919219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Pw9uo4PLqW445+ML/2nj2YC9JrDhcP48EMZJgbllM0=;
        b=RMBNzyO8daGi5f1mZ6zREbYtF91n1dLyx5XhB0sfHZF4ayngK34uyZO8wGJIiknsUm
         XsJWb3g8I0cID2MO5xMa9cawTrW1qX3QBkrFG3D/ssLfu0IuMg1tSEJjN9wUbXWN9PI/
         Mm16PnkZUZ4Gc+7R9or0+q/yUx230EcsQgsAg10nIiELu26OoHedDx++Lls0BWM/sHDz
         kmVvbNBuXR0ISZfQKwB3vuUKCxAVu/01ggooEtHyOHIIWR4hAQ5AHDhTVbqn0aOyg8OB
         K1eng2UTX3Lvb3j0XfdA28AHHxZULPH3qGQkep1VK4zkyGsrqSccBcEwhsDuPLHRKsNf
         tveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314419; x=1751919219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pw9uo4PLqW445+ML/2nj2YC9JrDhcP48EMZJgbllM0=;
        b=JErKPdsN+DrMCsvhIuSq7mYjyJIrd4MaXGMHQXkYNShCpMueQdh1sS7s0hvQyzzzo0
         5wSxWrtp3uJaVOsV4ei7+jktwXPchb1mhbTOZo+mNCH+MM3Iv3mraBpAaFzrttZuPqQc
         4vJtTN5G/UWVUK5R1+GkkQJ74x4LwnV4+DUPccAHGsA5DI0PJKgCFVvV/mb6HkRMQClD
         o5zWGdrdP/MoQTaZiNhO0Xbh7kSJGCoO0tXHou3V05cWeGyfduzL6KHT9Kjm8iGqc5y4
         VIeMqPsbWRZhS7k96r21Rv6ZQBYIqaKVf9XHZMAzD8V7Yn7rhsbBxm2nSbGkdZeB6UEE
         WE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjY8autV0PNfPq+oiVp10kMVrh5tHN2udUD5AFakd5MNoU5QIU5yj7nor1X3As4DcGCDo9k+H07Hdm32ze@lists.linux.dev
X-Gm-Message-State: AOJu0YwkqL9mKHB60fuHTECuJpTh70YaWiLWY2e9muCYg1Hx25pJ/gUI
	oD1NG7YkPKK3FE5gQFy0Kuk9m/k8dMO3XjsL7kzV4ZM2bMmIJcmGXFGPGDjctwzS8j0=
X-Gm-Gg: ASbGncsjbmQAh04gXFwbuVHci7SrbVU7ZGLC8pD97Ip0k1H3k9zgbF2swygd5zkFUeY
	Xravlnn8/7/AmSkPmmRg4WXdYfbkVBbNOHgPne6rgtpuu6giOhNMGzbMxw/JJTchmnvU9t6Q/J+
	E0nMWP34uVv8wr3RxI/Z+fcNSLiVKnfm8VS+V1Wd7Ky5EDxbKOTvugKYtQZDzTgNO4p5XIpio6b
	NQtOkLkaVoQrBqO0T1crmwsY8hWsUPrdsK1YL2sOe9sxcORQky7vOJFki07XoVvDcUADIhyqp0w
	WJ7qb4Pq9DaC8Sy83n8/w0P7B2sJUHepqRiqHP2/8JZ5wVUaZW/n1fx7u789rd7x7nODpI5+atf
	xwKc=
X-Google-Smtp-Source: AGHT+IF2bHM+w0oqv+2GI5jLOgo08atfHsKBXad89kPavKIYpA3L2mvYlOwrOo1nKxkMGjuZXO2PVQ==
X-Received: by 2002:a05:6830:6501:b0:739:fcb4:db17 with SMTP id 46e09a7af769-73afc57af58mr10984924a34.15.1751314418614;
        Mon, 30 Jun 2025 13:13:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0068e6sm1807151a34.17.2025.06.30.13.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:13:38 -0700 (PDT)
Date: Mon, 30 Jun 2025 23:13:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: replace magic numbers in
 beacon init
Message-ID: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
References: <20250630173339.3828756-1-magazo2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630173339.3828756-1-magazo2005@gmail.com>

On Mon, Jun 30, 2025 at 07:33:39PM +0200, Marcos Garcia wrote:
> Replace hardcoded register values in rtl8723b_InitBeaconParameters()
> with properly named defines documenting their purpose:
> - TBTT_PROHIBIT_DEFAULT_MS (0x6404) for 100ms interval + 4ms margin
> - BCNTCFG_AIFS_LARGEST (0x660F) for maximum AIFS value
> 
> This improves maintainability while preserving the original behavior.
> 
> Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 27 +++++++++----------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 893cab0532ed..cc7886d75a0b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1183,31 +1183,28 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
>  	ReadChipVersion8723B(padapter);
>  }
>  
> +/* Beacon Configuration */
> +#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */

I don't understand the units here.  How is 100 + 4 = 0x6404.
0x6404 is 25604 in decimal...  I don't get it at all.

> +#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */

I don't understand this comment.  This feels like ChatGPT...  It's
got that magical feeling where every word follows the other so smoothly
but when you think about the meaning, it's both really vague and
slightly wrong.  What is "beacon priority"?  What other types of
priority are there?  What type of units is this?

> +
>  void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  {
>  	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
>  	u16 val16;
>  	u8 val8 = DIS_TSF_UDT;
>  
> -
> -	val16 = val8 | (val8 << 8); /*  port0 and port1 */
> -
> -	/*  Enable prot0 beacon function for PSTDMA */
> -	val16 |= EN_BCN_FUNCTION;
> -
> +	val16 = val8 | (val8 << 8); /* port0 and port1 */
> +	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
>  
> -	/*  TODO: Remove these magic number */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
> -	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
> -	/*  so don't set this register on STA mode. */

This comment was clear and useful.  Keep it.

> +	/* Fixed: Replaced magic numbers with defines */
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is kind of information about what you're fixing is supposed to
go in the commit message.  Not the comments.


> +	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
> +
>  	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
> -		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
> -	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */

These comments that explained that DRIVER_EARLY_INT_TIME_8723B was 5ms
and BCN_DMA_ATIME_INT_TIME_8723B is 2ms are kind of crap.  The define
should have been called something like BCN_DMA_ATIME_2MS or something.
But they were at least better than nothing.

> +		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
>  
> -	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
> -	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */

This comment has a typo s/contension/contention/ and it's not clear
if we're trying to avoid contention or if we don't need to worry about
contention.  So it's not perfect, but it does potentially provide some
useful clues about the code so it's better than the new comments in that
sense.  Let's keep it until we can find a better explanation.

regards,
dan carpenter

> -	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
> +	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
> +	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);

