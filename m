Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F92D063E
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025088; cv=none; b=WI1DyyyYfedcBg5aoWmhh7Hi6641ZdQAIabGw+vcymdvOBW9CWdiRSgS9FaSlcoEPiR6zYNCBICRNGZVsw0+hQ95dW4fMXl0BsX639RyvnjKr8zbc7sd0UnWdHBrig3FgzmhfxtZR4Z+iJDDi8gd+fFYSayYAZL2sE03phu7x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025088; c=relaxed/simple;
	bh=NT8SNKlMSbn1fgNBsf2PG++bAPBx8X0fZAKSIS9SgKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVxxwFBUMV91/HFcxFjw8LSK5EDp6Gef+gXp1RD0bd6/D4fe7+sdSztlYTQiWwHKSBF9e/VXB9uQWKEXVZui31wHGHXLhzvZ3ecy3RixXKH6JB0vgYJK0Y0BZv2x1q49mo1uw1DKglnHPgg5lLWsGtIRkAN8sK9ECwIrwHBTPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9CRZ60R; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9CRZ60R"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-435f177a8f7so3140218f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770025085; x=1770629885; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4DXG80e9G+O0Zv1bGXdSlAcEHqwskrl7CILluOdPP1k=;
        b=I9CRZ60RCT9UbjdFLvmZM0gg7XigC2pqUueaaapu/nZeZCKBiOZUHrOi2YfVGWocca
         0tpdUiUvoRILEIqSnu/D7AFukqJDdCL7fxLsx4gZBtjdaTpYfYpIFGQmhCG8A1nK90jA
         5MeW0FVfO2i3w3S21FxJgO13q8tlk+rWhrArsR/dkv/MMB72Mpx1h864Ni0EEt+KQkme
         f+Ss2VNFqM1FOypvQUHL0agsGteiSlbAY4557YdNdQMsKTD4tj5YAJ2c3Caa71s6jftr
         eqWiBjT3iU4FnKNHG1eNTzJLT4rYnKM5pNGjDZllp5po1Tq4oq8clRPTzUqjergy1+5z
         GnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025085; x=1770629885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DXG80e9G+O0Zv1bGXdSlAcEHqwskrl7CILluOdPP1k=;
        b=SXkN+NI94a9ziwM4ypMh8YIoJ9um6wIP7OdaZz2N16aXlRmgWvHzPMuo6ukNWDuPC0
         s01qkzsZULI4lzNzyP5WzN0dYIaitzd90iKgBS29wL2m3+56J2HG3vB2Bp734Hie47cf
         FahEDCHyYV9Y2QbLRT66/dpwfMx2m3f0/tyu7iKmKrh0vxjlxv0xqGsCxP4BksjSq7YS
         H+Fvqd227zQ/Ep4G+9ZTZVJZIL69uiqpQCqYfk63iyeEUfxZBjl3TQHaUBYMUtH3s4y+
         FzX+UjEK7BUGYoqrQkR4EfvhxU9uT4RPr0GSrkg9haQIIsEECIdvpqeRQBewNcZeMsW3
         bilQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiLeLl917huY24ZxKXHoKDZIKBlKalrkJGJEfWdWrd/3T2CvcrzkANZpvasM9HdMwdggYL90fsxPr1wCf0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3KAFmOZ2uEsEp39Apk7Vkip7B01xlFAQjJNpWaPFEdJJ3jCGH
	1Jqf04ZOkzqjskpSR7sQC5NIsf5tvyCx4Z7Jr60qDeFBBHyiNIr9Ul3maTkNrJQ+5ns=
X-Gm-Gg: AZuq6aLiu+XmrG/w4aDQI22GU2JwsbrHl7sSB93OO+ipISv8CtDcPyaQ6c86uvQ4Rvc
	f5E4KePryx8ZtSWhbDlb3K3ti31F+hdaDKdlHFqvt3U5R1Sp+vOfUqfmS+9mw2YNE2vD4NXOoeo
	kDqneZVWv+smYtl8xgsb8B7DQmJuir5rkkcIsrIfqLKdp+N4T/eUhOxWUplcQgPI2JV5y1ypE2b
	iqSogR6TqT5XB8bZmKHc8Hhd7wG4RtLqOu8bxm3vVTfSLz7iaKMOSf77OxteuGRdhekhNl1Qa62
	Bw1oslrv/jDfvBDGOxhnLopmZeWnJ7o7f8SYJc+5dCQAn49kpryy4TGa55wnO/2rdT/Ix84G94J
	+jv5UN35K1VisQSxwPjLogH3EB7Eu+ehsyjWGVd6GOVSnAHKKveQsvpgqcORXGBZEcfHg/nJN59
	8sUEBOviPwrEYnaaVT
X-Received: by 2002:a05:6000:2384:b0:431:6ba:38ac with SMTP id ffacd0b85a97d-435f3a6a886mr15883251f8f.4.1770025085198;
        Mon, 02 Feb 2026 01:38:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm40816795f8f.6.2026.02.02.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:38:04 -0800 (PST)
Date: Mon, 2 Feb 2026 12:38:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?B?1i4gRWZlIEQu?= <skylinesytbe@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	=?iso-8859-1?B?1i4gRWZlIEQu?= <skyline@noreply.codeberg.org>,
	=?iso-8859-1?Q?=D6ner_Efe_Dasg=FCney?= <efedasguney@protonmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Message-ID: <aYBweE0vr8iIo0ex@stanley.mountain>
References: <20260202021845.265051-1-skyline@noreply.codeberg.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202021845.265051-1-skyline@noreply.codeberg.org>

On Mon, Feb 02, 2026 at 03:18:45AM +0100, Ö. Efe D. wrote:
> Remove spaces before tabs in comments to fix checkpatch warnings:
> "please, no space before tabs"
> 
> Signed-off-by: Öner Efe Dasgüney <efedasguney@protonmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 70b5b289f9cb..10c34228a595 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -362,8 +362,8 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  
>  	if (bWIFICfg) { /* WMM */
>  
> -		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> -		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
> +		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> +		/*	0,	1,	0,	1,	0,	0,	0,	0,	0	}; */

These things are supposed to be aligned so that the commas on the top
line are the same as on the bottom line.  It's a table.  But it's messed
up both before and after.

regards,
dan carpenter

