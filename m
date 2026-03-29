Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910D30BBBF
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 23:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774828290; cv=none; b=BNMFN4QaFpo4yAvWdZb9FqQg7ynSBHFuucTnoqU0ETjBZ0DfgXDxedxqH5CAraIVLKKrBzyLNNpFH0xzLG5CphEPi1IWxlm78/ZuiBRJEob/fjSZLnQKQLtcfX3RTj8Psnc0S9vdjaETVgU6dlAm3R3tMThwFSX3MsUn4aUd0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774828290; c=relaxed/simple;
	bh=YpMpuTZzOavO2FWVi3lBdct+RU887btYzppVB9m2k5k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fUmKhafI97Drm7UtHzbTQ0SD9oHVjXNVdpTsbn836s2swX5p1WKdHftIIppGNOMLDGawG9vG7QZtGO5YZ9mVkFnRnu1DVdSGmsYwEu6cGhf+KoZaMmdbvyvN3AXhL3oqmpWMpmsWPkokFE24zQ4GTgysTnxerr9vBOxPupDHuYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZbj9uTX; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZbj9uTX"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65006c99d38so2817146d50.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 16:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774828288; x=1775433088; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqnS1YXyhha9tTC/Bm/LiCWocUSVBx6brOljirdp18M=;
        b=CZbj9uTXkXXPCC58ZB7bW5t6Lf54rzzyhFCbvgHLilBRO5r3MK/U2RC3XBg0IGQjI9
         USRWeJEHhrsAQeZfeVJmNkzZZzRXh17KJPJx7744ZWlePfLGTlOPEKOvTXcfWTEVhfhE
         wQy+2NInTy6ZMGyArU52QrycwU1fOjbc94tMNepJ2tOdbgc7APHl20KjMGusJgJbbYKe
         ezFRdef6eNv67SZTD24zYaS8j/3ZoRmW9tDjoBM6VltXIaNao2ZZzCh8Sx8GO9/M0G41
         ZUwiZNWvaqTXaACMrvp7kPPcWRfcwnfCg4z9zkfCeu9YydUsl7uRt+lNKsQ2mfniVLbt
         Lhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774828288; x=1775433088;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqnS1YXyhha9tTC/Bm/LiCWocUSVBx6brOljirdp18M=;
        b=BFzs8ut+d5dh5v3zMixEJ+Z46Z6Akqz8Oe2rWq8oulKrX+yE8nqHV+TOmFY+Y9VprC
         yXN8Dorbux92enaONfG8SzaSfm6vl4TVb/IYRU5mMFICiHerqSwc66N5gZVJKwJCizJ2
         kKp0jN+NJNc52/bqY168uMbXyPYo0Txt8vhYm4/fTewcJqPlMobshl8P2RJypVVCQR3p
         FlMrME4R1XnrCt5Rz96/7y1H1MXgXbEmAIg9xy9Pq814uOtSCpa7ClTQO2kFgUjcffok
         Pw27poVTteFcye46QnJ+Ns6FWMEqTciqKZoJDM0Cn/VwQBuRm9z03faAZRscDdwifc47
         sNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDIWjTe3ZY3gRZMDl7bH0ShgwALuOD6C/MESIRYPH9KNVEa7fdCt88oV8/chzvdFmcmsJv8Z6gAmy3CA2S@lists.linux.dev
X-Gm-Message-State: AOJu0YxicbOiS3hElzvyN/iA+/bWAiTlpyXSWqFIK1kJEUdn5iIXUX/P
	GhSkU5C+O/FR8yNs7bv02qMhiKRaoUjO0Xv6beG/ZIR0XZp3SIK12kbf
X-Gm-Gg: ATEYQzznlpDTumIPEyW8Ct8XWm1wLPmxlBquotq/9k+zd1UuBJaZkDo9KCy4cI16hBR
	N/6yQMq9FoD7S5DxxctNogLg07doC74TM6fxP2+lWkV0by6LAjunDO+0XjlFLomB5FiZl7WxNmK
	CXkMva7nk2tMqeA4bvFi8Cn84iO7udGP4UNPBMqp6AultAoYIisD96c7xys8QPgC95TsP8pewTS
	j0AavE9KWGGGr5oUnAO3z2i011HGHTWcSJvz9gfkj9tBRugPpF5vn4d97y27oaLRMUCti16CvSK
	GDasAfqb27q772PwfqMk2b3oDf14CWt21c1i1TbHxUowRLbApgxLS7g1xm0uE+UPiCU7MJ4GqE8
	5Iq8/ri5/wHOvrNLTjryl2JVGjDZKw02/UVpn8ZL265MzaN3vKRm/a22G9Tvo4YtrOCxfnIMGpp
	dw6rvcUjpxiYk+ttwVtLnoCEueELIc2GMVHrL/HMT9f2capIQFX6erHSye/6vhugI3CzVOGX+rX
	zNT8QrQYE7YxSKUI+hQJ6M5GG43kFHX8t5of+gYsL8=
X-Received: by 2002:a05:690c:e4ed:b0:79b:d341:5711 with SMTP id 00721157ae682-79bddd29933mr98062087b3.24.1774828288285;
        Sun, 29 Mar 2026 16:51:28 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cba46f3ccsm27551797b3.40.2026.03.29.16.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 16:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 18:51:18 -0500
Message-Id: <DHFO471EX30W.1B58WCIKFNFS6@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename variables to snake_case
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <david@cardinalsystem.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Michael Straube" <straube.linux@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260327203636.24891-1-david@cardinalsystem.net>
In-Reply-To: <20260327203636.24891-1-david@cardinalsystem.net>

On Fri Mar 27, 2026 at 3:36 PM CDT, david wrote:
> From: David Holland <david@cardinalsystem.net>
>
> The Linux kernel coding style guidelines prohibit the use of CamelCase
> variable names. All variables should be snakecase.
>
> Rename the 'ChipVersion' parameter to 'chip_version' and the
> 'AutoLoadFail' parameter to 'auto_load_fail' in hal_com.c to adhere to
> the standard snakecase naming convention.
>
> Signed-off-by: David Holland <david@cardinalsystem.net>
> ---

...


> =20
> @@ -86,7 +86,7 @@ void dump_chip_info(struct hal_version	ChipVersion)
>   *					BIT[6:0] Channel Plan
>   *sw_channel_plan		channel plan from SW (registry/module param)
>   *def_channel_plan	channel plan used when HW/SW both invalid
> - *AutoLoadFail		efuse autoload fail or not
> + *auto_load_fail		efuse autoload fail or not

I think the whitespace here was intentional (although I can't tell why
they did it like this), originally the comments starting with channel and
efuse lined up and this changes it.

Thanks,

ET
