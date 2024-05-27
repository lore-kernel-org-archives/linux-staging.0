Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF93B1A2
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 08:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797106; cv=none; b=goOIWb6b8jr5Kisr4pOtcH+5Y+EqpPllyJXC6WvFGTuzpMijUM/ZqIhZ90YTl4PtZmcSDIxNxjsLogwDiYVBvHuikyIL1hDr/R/QuJxWO/D66OdEvaHXETJUkf/Ekk1R9kP+z8c8oLpsGhzrCZi2KgkIJ4OoC0MYCgMNe/W5C80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797106; c=relaxed/simple;
	bh=+VKxq+YHCBlsMb47ofjRCtChcs3IJSVYNcd8K6UMZmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCUAHI+OE0jhTWmf603Da+FnQ51zAMJEI3xANyKVfKAj9gOeNA/ezWu0eVNbfPEmuGaBS7jwEk4n7IJcNNTRzvKvpN10EF5TEXfNxbyb+dEDRMce8eA7bCdcYIvrmzz8g7Z1tQfGB9/46SBtn3RBGli5TvvubZVg5r2Nz+ma2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXqkB+LI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXqkB+LI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4210d426325so2017085e9.2
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716797101; x=1717401901; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oiab9V+mCHP9zn1CnbxeVYdytMkVdLAk3pdibYKTdSw=;
        b=fXqkB+LIq0il+SMcuw0oMjPaagrl//kBmarpkSCy0chKVLA/xMbpAg0u6dgVPEDVbe
         PhXs41L6RSRZMCWqbTl9EsWgO7BgxeQkppYIdduApO8CPfuJDppi42J0pPZh/VVnFyfO
         uSjsY+DEbA0uL+sfKSlLaH1gidwDURr15DIONoVOu5YFTEVnI5v2KoEr2nAAB5ikR4rj
         0afIlDD2vobtRefNXuDRv+UscVZvBo6xgZmON9K9/hagN2n8ORQHdU5FxnrXlYAcerBV
         lNpa4USNokF87q3zzolsG2gZ0MAHxSBe+ZCuMWG4RzsMhr5jR9aXkero55ur8a0mgRyD
         ZcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797101; x=1717401901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oiab9V+mCHP9zn1CnbxeVYdytMkVdLAk3pdibYKTdSw=;
        b=Oe0rvqKjRAHYUxM/6p7Zr/363xujDMtChsPtcNiJllhsvAGDWSBNuTTL/lhdL5CvQo
         AZXmubZxcnCHMrdFrTRcJemwGacRV38hRa5/RBMG2L4cERry2Z512u4+E3ghc1lC+c2H
         ISuYxYPoPkAlyTQlKSiFFh5z5Czm75zTPZVgfBAsFca67j12SsaMPfPI5GgcIu/9np9B
         qPahvtY4MUTWE61j07j/AuNVkOQ3zTG5RBGnX4vellLQMmypMCR6XtX/JoWr1Jjw/ktx
         xaBLkaCnvelcDRLlk294Ll5Er7D/Vu4GIVmPlR0/Z6PedmG0n5Rutt4nrnHAPzxwHhTu
         QG9g==
X-Gm-Message-State: AOJu0Yy9YHBm9z6Ph5kybBRgH/GqX2d/IBGbQPxfaU4NjRQFgjfeKSyx
	ilmosv7DwkhysUV7q5jVx/ZPr3h6YAmT3JxIiSfpuhVFyaFz4rl0
X-Google-Smtp-Source: AGHT+IErKsdEXc1o9U/Jvz1gNnKUFNtYvEe2qYeHliDR538FuYFNRUep95WXDxdFAQwJtDPwQbu4SA==
X-Received: by 2002:adf:ffce:0:b0:354:cbc3:bd9d with SMTP id ffacd0b85a97d-35522125e22mr5259764f8f.0.1716797101348;
        Mon, 27 May 2024 01:05:01 -0700 (PDT)
Received: from [192.168.44.127] ([185.238.219.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35671d03330sm6794562f8f.64.2024.05.27.01.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 01:05:01 -0700 (PDT)
Message-ID: <9b623cb2-6c42-4e24-8be1-ba32b2682275@gmail.com>
Date: Mon, 27 May 2024 10:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Fix spelling mistake in rtl871x_io.h
To: Roshan Khatri <topofeverest8848@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 ayushtiw0110@gmail.com, namcaov@gmail.com, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240525160230.66365-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240525160230.66365-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.05.24 18:02, Roshan Khatri wrote:
> This patch corrects misspelled word to increase code readability and
> searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_io.h b/drivers/staging/rtl8712/rtl871x_io.h
> index c5b12f74ebf8..f09d50a29b82 100644
> --- a/drivers/staging/rtl8712/rtl871x_io.h
> +++ b/drivers/staging/rtl8712/rtl871x_io.h
> @@ -62,7 +62,7 @@
>   #define IO_WR_BURST(x)		(IO_WRITE_ | _IO_SYNC_ | _IO_BURST_ | \
>   				((x) & _IOSZ_MASK_))
>   #define IO_RD_BURST(x)		(_IO_SYNC_ | _IO_BURST_ | ((x) & _IOSZ_MASK_))
> -/*below is for the intf_option bit defition...*/
> +/*below is for the intf_option bit definition...*/
>   #define _INTF_ASYNC_	BIT(0)	/*support async io*/
>   struct intf_priv;
>   struct	intf_hdl;

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
