Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD828D844
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299670; cv=none; b=KLw/fsKrdTXbhHYJ+743/bLfsJ6YwthhEPNxztJ9p9+nYJrRXlTjZvP9TDFU9Dh4qIQoEJsm4RhISDVvgfI7o33t3KECrnAyqg7ZMf1r5qbkmnOGq98IW09qyF8ekaDXRPiyefDkSSBe5+DooZnku5JO0RCPi2vtjYvNO8StabI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299670; c=relaxed/simple;
	bh=LG1ksJiKWB3q9vR/65Pc5t6so9vAfBBQg/u1r+q10qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx5pHdAMktx2a7SVhqNj9130VOJfS2tpVAgP+GxVjh8scj6583TRXkXu7Rou3kNuqJOdjAD7UPUJHLEtzPwUWmXxE97V2KQpDD6b2haJ1I9DmydVJ8VgHANfSxFi+NwnQfUsL6Jd9pTcBWLlWd5kUZKaEInLY65PWllWBxPU9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CtVhrfZK; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtVhrfZK"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ea2fee5471so2602328fac.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751299667; x=1751904467; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/R7vNwiF+9oBPUCy1uxOqRbFBhRy6o+8A0EvAUXNdqg=;
        b=CtVhrfZKXfm7imKytOwtej0/WuU/sruIp49yKkhKMa+munpaqMBWK/BmfQV3GHnwwq
         nacJe7iG1p0wWBVwM7XtwYF95WttdlwqEZ19NgArMgcvsolxk6TD8vulkKmF1Kj1U/82
         KyrnCZf7FpDzg9IxzTxkE6CgpcQUnRIh1tdU/gRuyDnGDEvvloMWvXbcQJso4pE6SgbC
         nFIBTErvOhA4b7zsTEjjwKivvwI4ZK0oiNqYGvozj8oGK2yOEmG5bqvFXn8tueq24WT9
         N+IIs/lhfSbNpDvtFMhJ0SIBtqBEZcA16JWqdLaXsn4RX3vvfFbFmNKWNID++Nz19U2x
         XSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299667; x=1751904467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R7vNwiF+9oBPUCy1uxOqRbFBhRy6o+8A0EvAUXNdqg=;
        b=T0sssoJUIO/OUF5waZduXk/iJmnfECpS3fQOYWmhmuL4qBxA9LkM3HSuqSawt0s8uW
         BqmsbugMAMcENRInqWjyR4KK6sU1MF0ElFfZUoyWB63A3gyo/t2a5s2zdAkBqJZoLif5
         Bsqo1qRBkuqmCXY1hMURT5faGibCuyYjytlLbtz5T4vlwrSxIT+n3TdMbl2ucc0p1UH2
         Ax6vg8S001Lc/SvdBxVAMnuUYlbJl+laLYWiLzrRGJ7/mY2BTJku1hcHldTbHYcqBTsq
         5apFcAdlGOaBf61bJCuGpMsOFhpEszX9vL5U32ZwynjFuP9QdqV/lcpNYDkmeUBoPvIj
         RT4w==
X-Forwarded-Encrypted: i=1; AJvYcCXFW7LR+pxzE3to98sFgqzlHlPePSiOu5hbBBNJHaeNfSA3J1wAPE5SjsXyafb6B2wBYSayx7/kwD2C3+6I@lists.linux.dev
X-Gm-Message-State: AOJu0YzITn6vhU6YVaWslb3NH9H0d+flhnBoKKHHtca4lVFwLfL0tA/4
	gwjBIbnE6nhZuH24ZTopCuCM2On20VRf831kXGc+tJjhgTtq1T/KBIAPWCDln5lFhH0=
X-Gm-Gg: ASbGnctZ+kjORrbKU5QoTqYRQuVyQJcwhBJ4HOcXeboA9QkROLEy7NEyVW4O4jDLOjr
	EIW9jVWtcnMKBCLAW6uBSn0nSCAmGBrXHvoxSnUh0QQ1IKsIxH9CezV4HODpmm6H39iJHNGBGhj
	SYMMXojrBPUD6OTU3Sey2a1XaXanfEWZTkNTvGUSH5zt03fhWeZueGGuOAWidCxxwWf+1W3E4iO
	9b0gI4pk9lc+puHqCgPwXU3aeBqtW375rf6q+Vxvy1PDDmkp1R4glMgRO9di4fOVAjnFqw/R8mX
	9GKVHObSN2iqf/mMwh3uYorV8QWgUogM9J6KETyZjQxRKto7TfSb9Ll02XpZMDqtNo3I
X-Google-Smtp-Source: AGHT+IGVpDYVlflVaW0F0NYK4knKVLcBuKDTprguFAwInJb/gAiKPsIXTprvj5I8HVKELM4BHElL1Q==
X-Received: by 2002:a05:6870:c84:b0:2c4:1b1c:42c3 with SMTP id 586e51a60fabf-2f3c0424f69mr94470fac.9.1751299661472;
        Mon, 30 Jun 2025 09:07:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb122a27sm1702697a34.62.2025.06.30.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:07:41 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:07:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manish Kumar <manish1588@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix all checkpatch warnings in .c and
 .h files
Message-ID: <bf5aeded-3bb1-4535-ba84-f81e425b5734@suswa.mountain>
References: <20250628082305.20847-1-manish1588@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628082305.20847-1-manish1588@gmail.com>

On Sat, Jun 28, 2025 at 01:53:05PM +0530, Manish Kumar wrote:
> This patch resolves all checkpatch.pl --strict warnings in the
> sm750fb driver source files, including both C and header files.
> 
> Changes include:
> - Replacing CamelCase identifiers with snake_case
> - Avoiding chained assignments
> - Fixing indentation, spacing, and alignment issues
> - Updating function declarations and comment styles
> - Making code conform to kernel coding style
> 
> No functional changes.
> 
> Signed-off-by: Manish Kumar <manish1588@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c       |  90 ++++++++++---------
>  drivers/staging/sm750fb/sm750.h       |  32 +++----
>  drivers/staging/sm750fb/sm750_accel.c | 120 +++++++++++++-------------
>  drivers/staging/sm750fb/sm750_hw.c    |  24 +++---
>  4 files changed, 135 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index e77ad73f0db1..8794195a9594 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char * const g_fbmode[] = {NULL, NULL};
> +static const char *g_fbmode[] = {NULL, NULL};

You're removing a patch which we never applied.  Start from a fresh
tree.

regards,
dan carpenter

