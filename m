Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD9726B742
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778471338; cv=none; b=cwnL5f9Uoh/OMKGfP3Z7/z6wKwQ1ZHqS/w/TcoUAVXzsZWibfv1FBCF7gK86vHvrHBWNGkigPN8bfQb1fC0t1GioPsg3Kw+imkyV8bMYU5ILlBLlSEWDz5ssvMxqWfIT2CkZ5Sqq+/0a1YLpR2X6jZoC6dSomyE1WyI92xKWwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778471338; c=relaxed/simple;
	bh=AH7+rllUgr9cRttphcbDn4wOpxLHtvMKyuKiFut/RQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmeG+asYuLi9NWpiLDRmy/zOlJ1Lujtcuc6Bly2e8qKiV+ib6mkgxCi0991U8owxK1nDwAgOzQ7vEmaTi/Nm6MlMYgqjqPvhQ1WPQpPaPYVxCbZtbCDN/nOJJi5P7pe9/+e68MoVcpVI/M1g38YW7ApdfPj0CSE5bfgDoRmj0jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHqnrnYc; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHqnrnYc"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso3395760e87.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 20:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778471335; x=1779076135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPGkcrGIaEtncHosCoZMqsncXm4lY9+/rYNyGkd4nTY=;
        b=ZHqnrnYcMy0zxb4aBEgtZBbmM5lYvhwFrFDFHDVdVMD4pDdeHV85brta+epWfZJ0tn
         Aii+/0ViRW8lflVcb9srSMC3MylzUWBGHL93+YQMRCZWwbhvg6fCuC8izcDq2h+DLrbk
         fziia9axUkOzSuwbvtgCzCgwci2mFGzRc88W/+59bSnqJPwdFDNX1u2bOoCAjK5wneFh
         gaRvG/knSpHXI6MdrFsJFAQqsBRMG3cnHd/3dsGCIkIAWCvZFzieb8MGIjJxjzTj81+8
         I74/2LNiY6GmcewqOdq7G6/0+ob1caHgUOQXTo8aCWJ8TZh4yJ5ca0ZdVh89jEIWJuOo
         k3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778471335; x=1779076135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPGkcrGIaEtncHosCoZMqsncXm4lY9+/rYNyGkd4nTY=;
        b=EiQS1POY/lqzACA9FFlaTu1BflquSNCCyTtVbwIEShjDjdE10nfdLj4trnYoODI2uW
         gN4gQbZD0XGyDo9MazSv0EWwg5bpqsS/7GitniUpkpHUHoAmKm0eqX8TG5DQVNfFNrbB
         Izv59AZjNX+xKICD2l9B5vJJFy4W9ZPyLObqrteQzWE614nTGds0xDsFCXiq3U2SRlrp
         ffP7wXn0MmH80uP7ILl/zgcD0+O2qYB5wE+2WR4VhEOdBvz5lyCJYza7pOLRsMEVN6A6
         9FLJPrINBzWeql6bLDmst2hn0D9yXE3PqoSjsA27dmbtx3GXL7+TZHNZV7JMDR8ELsQC
         WpXA==
X-Forwarded-Encrypted: i=1; AFNElJ9uYp7I4uBM9gBppsyAD8G9aFbpIcb8rg4K/DB9dKh97iN77m9v8Mn3PLHjsAwKLt1ImM2NUf2bF7Pza7h4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8ut4IiRCyAbln9MZGHe+7OpEwAvisiFG5Cre2+/Eq+A0aggr+
	8o57B7UTWe75pAkGsT6xaonH4kq2oyDaO/izoFZeWwmnp+TCMQwtvtLJ
X-Gm-Gg: Acq92OFnuDM9A7gDPIgBfL+4Ux3u6QX5qCuY6lwfZNzAYYqbQwX0yI6XkuRJx8PbGGs
	5pmKl+Y6rPvT3cf2LYIWSZ73M+QoCWS8qH0iLuOAGTFJCnXw5NbpCTiRBDx7wcAf2NQau2Ehk06
	XQ+XD1mtFO7HR/rar02FFHeEziLGzsvPZQRh7wKg7m6wDObRBx8gfAcGdw/pFoL0xrWQdSBH/DN
	gcTxeMo3NitELyDrWgI0WRbmapMATY+gqjv4pG6kiAqV4ZcTLvvhs6U7esBXYGzBySCWa3P8IbI
	1sjnCmlUBXGY7ZrsmjyTd0pC7bOxJRpowp5ZznUXFKd6QftV78lAJpFU2XLrrzZc2bsfpS8StQl
	+tWiz+d6160MN/RhGmRT4TE2V/8WZIvVvEXUNIxcVAe4ot+wFlf2bSyVXlxzHTzJVwgKoASFw2V
	FDoMInsBsVyAxC2hqlJNOft6Bw
X-Received: by 2002:a05:6512:15a0:b0:5a8:64c7:9592 with SMTP id 2adb3069b0e04-5a8a94c8da5mr4150614e87.37.1778471334459;
        Sun, 10 May 2026 20:48:54 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e14csm2318721e87.43.2026.05.10.20.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:48:53 -0700 (PDT)
Date: Mon, 11 May 2026 06:48:51 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] staging: rtl8723bs: Fix comparison style in
 IS_CCK_RATE and IS_OFDM_RATE macros
Message-ID: <agFRo7v9NZ9Ogf7i@archlinux>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
 <20260510175207.563378-3-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510175207.563378-3-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 01:52:05PM -0400, Pramod Maurya wrote:
> Place the variable on the left side of comparisons, wrap macro
> arguments in parentheses to avoid precedence issues, and wrap the
> long macro definitions with a line continuation.
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/ieee80211.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> index 7a3609d019aa..11825ace95a9 100644
> --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> @@ -394,8 +394,10 @@ enum {
>  };
>  
>  #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
> -#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
> -#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
> +#define IS_CCK_RATE(_rate)				\
> +	((_rate) == MGN_1M || (_rate) == MGN_2M || (_rate) == MGN_5_5M || (_rate) == MGN_11M)
> +#define IS_OFDM_RATE(_rate)				\
> +	((_rate) >= MGN_6M && (_rate) <= MGN_54M && (_rate) != MGN_11M)

The IS_OFDM_RATE() macro is also not used, peprhaps it would be better
to remove it instead of formatting dead code? Of cource, in a separate
patch to avoid mixing up different changes.


Thanks,
Nikolay
