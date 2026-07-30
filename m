Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB2337BB8
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404760; cv=none; b=uZZXudmT9LaXgEYFKyaDsM9IlzZuVoyaRTYP/QHCZQKvdmYB5dfEA0nOjTPg+pmLpnYbWPT41D//1gKmesURd4QZU1siDh7zwkEyefSHHnEHXKZRy1RrPvoCv+xIkyX0fd0GvVH0PpcGTylW0rAKkxI+NwS6SllTrP9MeQibd+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404760; c=relaxed/simple;
	bh=FEbxtOCMm+1zTlknwYYR45DhD/+98s/zCd3MSrKtwJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmErY8wABcDISp6ZLcCy3Eyt1qLuZHGSJPROkJPT3niT3Hi/saxMbv4bp97x7nn6M+0T/hi+nz7dNP8KL1u7fSgMHW2uhjeuFFVQIT+ovz011HOhWrJ1nc3+Jb1yjjKGJQE/4vlzx8omOP0e1uloLjZp1Vc8cBz100wpVnXRNDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmZeFlwS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmZeFlwS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0117dda13so1910824e87.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 02:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404757; x=1786009557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWDRAM6ScA6tepJC1oPzWjfjIMkzBdpkHj1B47+vimc=;
        b=cmZeFlwS7CwkJFrpQMi6DW04ZNAiRTceCp0UNfO39LCu4hwc3wPQPmyf1Ah5Db3lvZ
         AFHSBFgClkvUmth4p/EC1Pu0V5QbGHwXWo85ilZp304joDGs/hGzUtOywuJ7oThKbcck
         dX5HlrtqFhTfOxZhN+g41ZDagOcr9etEdlDU5FzIT5sARoj2bv6S+RyiYF/qqaH8gucj
         eIwQ3dJA1jMq0jNFm8HbpaO9HlDy3MR/nPCBdp3pPMy2cBTFgwFIhJ9bzb2DJ8xuL7hy
         mv/MmUWFXxv5uGMAiZQgF6l1FsELL7eeOAPOCtewJdLQyp2Q/lLGN2lieYrvhtPK1Zo1
         7UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404757; x=1786009557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWDRAM6ScA6tepJC1oPzWjfjIMkzBdpkHj1B47+vimc=;
        b=LEM1TNNZPUyWcjaKkvfOZ4l2AeAHtOqb5cUKyIpFJcZDw4HbIE8NWqp0iPub/zGODi
         BTOtFxHbFvTF+oLQ+bsSbhob2Azz6hA0E5XlQwlEABX24eaQ3co/5kZEOzW7wVb8JGUm
         dK5stBbA+lrjxy8XJT5V1hofCklGvPrtyFybdF9uv5APSfinZvMcyhpMREvraqP9lWTw
         EVL6a1oP/qIADxeV+eImj8g3riMsVk2bQsDUaYBbnpDwYLdaETJpyHibAPShezP/Nxf7
         /fyiGtZWNJBW/ceeidq8zIa2pk5TTpO15Bqo82EGBe/kJPKIJi3btoWRpx19DQhvPkI4
         z4zQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBj6FkuRzucnI9+7JW3MNHB9a7QFOn9GCp7wPMhP33GnDA83WkLPNADtiu8TadWoIJIcoH1e8YE9ikkEyR@lists.linux.dev
X-Gm-Message-State: AOJu0YxRPSiP3NhRsH3sVUefBqARq5iYAYXktga4GkAwO+7oyy9zUf6w
	o3NBFgnfdKGBZQxhZZ5aFV6Pfjmlmh/gOOUw8UPvThJlSw/KrUZScWcj
X-Gm-Gg: AR+sD11XnAxFOkqVTKqJeCRkTQhaBgUXTMoHJooZ2qkFzMzpte+T0MEMiGhhDA56n4V
	SEuCaBuWYLGuXTas91jy2kXlB6GBmZ3n7qy6Xh/byubA6M4+fHd6edEyFJPiKQNRrq5vM8fC9cr
	obBXIVOV1n2BHmS/V5J0Wda63eIwU5MdEEeHhfKwps3Lf53hEIB0GhmkArTaOrV87irb7Xfi6Go
	rskW+Djy4B+/8T8nDcfSYfxkLigfMeA88qfEQF3bLBP35lKI8lHAYFeLbzbNCX07mO31wLZDKPS
	0MQjEg2kagvivmpZge2eLEU/ZT5fH4J+dN9Iqq6djPB9nNhPbGufBvk/qJmD6R5t7O7Be28UX5q
	LTOAFA5y4H7SHH7XY2quDQbmS3oaDHvhYLgaQ0C7pmOudT55Rtsir0gegMnHwc3Bm5RNAk4bLgA
	XqsC365WWsfNO9tS+yimTX6DEJljNFDzcldcRwtkZMy4ZvUMRwnoSROuskzDk=
X-Received: by 2002:a05:6512:350c:b0:5b2:9c0e:a2d9 with SMTP id 2adb3069b0e04-5b2db3916a4mr379748e87.65.1785404756912;
        Thu, 30 Jul 2026 02:45:56 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db942d75sm226698e87.3.2026.07.30.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:45:56 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:45:53 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix underflow logic in swing index
 calculations
Message-ID: <amsdUftM4DIS7s_z@archlinux>
References: <20260729172707.13333-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729172707.13333-1-mishraloopmohit@gmail.com>

On Wed, Jul 29, 2026 at 10:57:07PM +0530, Mohit Mishra wrote:
> In ODM_TxPwrTrackSetPwr_8723B(), the baseband swing index variables
> Final_OFDM_Swing_Index and Final_CCK_Swing_Index are declared as u8.
> However, their calculation adds Absolute_OFDMSwingIdx, which is a signed
> 8-bit integer (s8) and can be negative:
> 
>     Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex +
>                              pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
> 
> If the resulting sum is negative, it underflows under u8 rules (e.g. -5
> becomes 251). This causes the lower-limit checks (e.g. <= 0) to fail,
> and in MIX_MODE causes the logic to execute the "BBSwing higher than limit"
> branch instead of capping to 0.
> 
> Additionally, in BBSWING mode, the check for CCK underflow mistakenly
> examines the static struct member pDM_Odm->BbSwingIdxCck instead of the
> newly calculated Final_CCK_Swing_Index:
> 
>     else if (pDM_Odm->BbSwingIdxCck <= 0)
> 
> Fix this by changing both swing index variable types to int to enable
> signed math and correct branch selection (aligning with the TODO item to
> convert remaining unusual variable types). Update the CCK check in
> BBSWING mode to examine Final_CCK_Swing_Index.
> 
> Note: The fix is scoped to the calculation and branching logic. When
> passed downstream to setIqkMatrix_8723B() and setCCKFilterCoefficient(),
> the values are already clamped within [0, 42], fitting safely in u8.

There is no need to try to fix the check in BBSWING mode - it never
executes and can be removed.
The ODM_TxPwrTrackSetPwr_8723B() function is always called with 'Method'
set to 'MIX_MODE' (see hal/HalPhyRf.c, lines 252 and 255).


Thanks,
Nikolay

> 
> Compile-tested only; no hardware available for testing.
> 
> Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 6c5f56d5a1f4..4e89847700f3 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -160,8 +160,8 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  	u8 PwrTrackingLimit_OFDM = 34; /* 0dB */
>  	u8 PwrTrackingLimit_CCK = 28; /* 2dB */
>  	u8 TxRate = 0xFF;
> -	u8 Final_OFDM_Swing_Index = 0;
> -	u8 Final_CCK_Swing_Index = 0;
> +	int Final_OFDM_Swing_Index = 0;
> +	int Final_CCK_Swing_Index = 0;
>  
>  	{
>  		u16 rate = *(pDM_Odm->pForcedDataRate);
> @@ -217,7 +217,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  
>  		if (Final_CCK_Swing_Index >= CCK_TABLE_SIZE)
>  			Final_CCK_Swing_Index = CCK_TABLE_SIZE-1;
> -		else if (pDM_Odm->BbSwingIdxCck <= 0)
> +		else if (Final_CCK_Swing_Index <= 0)
>  			Final_CCK_Swing_Index = 0;
>  
>  		setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
> -- 
> 2.43.0
> 
> 
