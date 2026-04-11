Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94B33987F
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775903913; cv=none; b=Z608iksbKTDpWoZlY2g4Thi19GvCBLNBk/7xqgrAcFdvY/Foezon9pf633MHeKPCUl7UlnrrccGUmYcd6W79VjKOT8pR9phxuAqSQxQKvw5lJrvqV9CoXPRu7FSbx8/f+bgMGQ4RiShuoqryAxoYGxDI8yWjx+ZI2p5HevsVULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775903913; c=relaxed/simple;
	bh=1ssmPN6eaWpsHEUpRPyPqbNx0hAfCC6bne2u4F647W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2neXoFc8PC1hK8x9hPLvmFOHBUYhH8yVf42oYEAOgTIW/OsyKZ+7Ia+ltsEPW+JFVvuNtN+rCD9PEg//JTXs+yd6Iv4pLH+rgDYOfsdQriEiUiUuK8p/hvJCZfr+k80ju4K92uGmeQfJTvpx/iS5iCwJhDROeJbuB1LgKjzhtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/T4GqjC; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/T4GqjC"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1279eced0b9so4227067c88.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775903911; x=1776508711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m48yn0WPV4oaRj5jTwnjFikJvqvV0KXxEX/oKLKRTpY=;
        b=s/T4GqjCMwHzYgXyPfudWqSNeA5VaedV05aH0MOMEPborSBy0/Kzv+ar/gII6IcgfU
         8taEN+y71GTgzyy+QJ90ncGKBVgHOGcVvs12HX7NZjMNvYe5aRW5QSM2z9Q1EwTxo6sq
         c4Z3KIOdcEuN90uLj9NR4GszdkS5c1vY47jsC1oyT1aWFIM+SlvYG5yKNkqQAHGCpDh9
         f4b101Cm8OyPE8y5q1WUURoFtmQeakCu+FkOEeqL0stbjR74v0yrcSHLdf3i6IyPCgFE
         7V0lPXBAUJ5z8b0SBFwfF4R39+YLuF3hxx672FdmQYL/tUFnVQ1cOEVVcJdGSj6QJP8v
         bBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775903911; x=1776508711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m48yn0WPV4oaRj5jTwnjFikJvqvV0KXxEX/oKLKRTpY=;
        b=VAtwqnK5mBBGmu94gjcCOBcYF3ORc2J/TNijEjPb3quELcPkIx63v2/M8mxPsijlK5
         V4DV8PwA2Ahv2etnFkg5eAJeRiPkYTblu5SR3ULiUL/ATE0SSQaQbE6polkQLn56a6kM
         T/2Rw5J1dlxaQb6RjzwZtGfO70DXAj7JprchKmaVydmx7CDM+T0uMsFHGCdbkLNkph8F
         RAoazb66sm//arVcR2+a3wq6mRZXPvfifZRh69WCI73xLdHFvbSbTLnvnkYCL9h+/7Oj
         NtdmHTlQaMlIMpo6QjTAT6soshd9nFKV1SfqDP1Mz99JB1EynBrl5pAP+DT1byLyHQqY
         Cang==
X-Forwarded-Encrypted: i=1; AJvYcCXHMN1kVOTf3QwEVjqPCsYgLca3em6VqgnWrQce9PAIH0udkQhTdQ343YoynY3szt2XecWdsGW53CSmuDpA@lists.linux.dev
X-Gm-Message-State: AOJu0YwnmNrANt7XZtNcSZvdpHhsY5IsJ/eGQuCjqPT95fMT3x81xpf8
	YUxBUrEtsYORIJUZa5wVDQXg7NMhy3Z32c+0KGRkQOqDcEXYo9aJQW74
X-Gm-Gg: AeBDieuVhWzybEwgnexCDBCEpsQw7zCMc/eOl/eCyZl+zwfSaDy+2GmwoWRRQDArgnD
	2ggPnToExT58iEmenmzINiauV1esDOYwqPfpFGqveCDTXqU+drAmYuekn0cQua9jIDJ52lVxaKk
	HijU6tBg2X39HX1KRz7DkpECfvnjBtKeJ/a9q3meZBYSGnJ0zSMsuaTiULx6DnnCyYeyq6vqeYF
	ZTC+tIf33FhqvCnagVCUDseWPwXX1WqroJ61KONuiyoWnuiIKRjUX4lnav0jtVH2Ott36V4hhZ5
	QTBaKX07lOr0cNa9otKXgjKyen6TgnRCyS8Ltk2aHOerzUyC1AAxDjbY+rtNIk0+P4VqupouNP1
	AuIjtOPGsmtVZP0ZcbWcmfvfrchTBJkkjTBGhZY/GOnpeMTIsZGOv7wto/vFKyDJikEO8FdzUbx
	dmP46sS3eFWK6i8C0=
X-Received: by 2002:a05:7300:7495:b0:2c8:8ae4:962a with SMTP id 5a478bee46e88-2d5870ac142mr3775954eec.2.1775903911142;
        Sat, 11 Apr 2026 03:38:31 -0700 (PDT)
Received: from localhost ([45.86.211.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm9136444eec.31.2026.04.11.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 03:38:30 -0700 (PDT)
Date: Sat, 11 Apr 2026 13:38:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise
 math
Message-ID: <adokoNfP-Ueg4yQ7@stanley.mountain>
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
 <20260411085848.75381-3-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411085848.75381-3-joshua.crofts1@gmail.com>

On Sat, Apr 11, 2026 at 10:58:48AM +0200, Joshua Crofts wrote:
> Refactor the ad9832_calc_freqreg by adding a BIT_ULL()
> macro instead of manual bit shifting for better
> readability.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> v2:
>  - changed ull to u64 type
> 
>  drivers/staging/iio/frequency/ad9832.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 8873a6d11e..4221e51dc4 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -112,8 +112,8 @@ struct ad9832_state {
>  
>  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
> -	unsigned long long freqreg = (u64)fout *
> -				     (u64)((u64)1L << AD9832_FREQ_BITS);
> +	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
                                                           ^
This extra i char is something I really dread as a vim user.  :P

regards,
dan carpenter

