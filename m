Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA603E1692
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391415; cv=none; b=gx+WjS3TemKLL/QRMd4tmRcJX69spJ7vNo90pWP+58kXZOE5Qr8mafY0LF0Arm3h9qQ39lAtue7byy16tzY69hTT2dt9s9hs7fVZn2I1C9S/263ZHCL5W0NexS/D4CpBrpqTA6Yv5b0MBA01ODSnTCaCKdqKhOT8idcu1v4alhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391415; c=relaxed/simple;
	bh=jdpmD6iVy3FAIMitjzPlLAWE1W7zO//hEsmY+/wCHto=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duIaRjAAKzPrPftYW73mRms/7ZYpqOCDoxxIdr01sz6QAB/qCmKnMaDddSUQt1eqo9q7WqLhBJCNgvRTi98lHmg03llF3s1Af9QvRfJCgWqCfgwQnRySexiMZYU4DkmqoCCoCNSZIriRFDb6R7d3zZ1BhOfHHiOUDv3ppDg94jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNfzJRVZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNfzJRVZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46daae24c79so631365f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782391413; x=1782996213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a66eo69NOE+n4s902wAJueSdPmo/jdek0/gyrvoE+0k=;
        b=FNfzJRVZaVZ8mVJkJSX5Z7jNpbJFiK7eEgRlDHKHvqvdlnWpUzXtLRSg3Oi5ImW3FO
         HDJAIyyeW8JDg6qqpJsTBb4GM+RUrifJlVr1ktGO73ZWd7cJSX0P6mhbTEVnPDSUTcrs
         Pd5CC71pRWhOfphhAtGOwYHuZTF9LIodINqQC8t/00xhB7RmOBk5SMjoQfQaVipAoWL1
         x3XmvE9p8esvX+YvOJfGMmseVs7rglnC32x3vRDtdbFH2RsWXHIVESzAbhEu5eUYrI3w
         bYhBxdqB61YpzvoJwjbqbFjpfi+8e3/t+6t4uscOI6uzNQ43H2fI00+EoAHnL72wNnv1
         tE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782391413; x=1782996213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a66eo69NOE+n4s902wAJueSdPmo/jdek0/gyrvoE+0k=;
        b=h5cXoXQ7Cq7yOGqzDaI875o5H5s/VomgIOQ2ObBfa6cydm78NTjGxXZlo8KktTQSVu
         nmV+2+vAzBJ3V+LchyGNFYRtaFnyquczwe9qvFFFI9VDmcaJqS14nBVqRiHUVfbr1Fca
         pqPlabnhb/XIIcxoB++ut2yHrQLVuFTdstSZZ+qBhVL1Fhm6IOxZ0wdijMWST8q/B2Ls
         5OJvTgjWHMukQCllMvSghIQo3zivhksiPJ8+1R6AhlN1hTm9O/jSGMgWDzuzGa/sCrWn
         GbzAg756tiKFKoQHtAoGYrLDaHtRa83nsAyFUDafqqffrKi8VMfgmAxEMGxevPX3mAmw
         xi/w==
X-Forwarded-Encrypted: i=1; AHgh+RraoDAcmhDNYxzI2JIQv+1Pq4Ov0N7/5kYsrlsJ/PMWyyEBojLsumWqaHAdbRiXHFvkZWyJiMuYPsAY7ks9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Z4hSGGxqlzmoPwyAk6L1f1MblJGN4gneo56YCFyOnJT0WQCZ
	ZC5WXRJ90gcToWcIkywYkDqynVzUc4VmVFUH7vCjtmQAkTbiIwxocCXq
X-Gm-Gg: AfdE7cmaCS5FHzwGJpCrqBzYvZzkM5//jb8tpll+GDI0rGk95bFMVEuLZNwFv4VMsD8
	fD/wCpFFfxHOwINIhMFcoogDMe6aJzUTJX5KxHQzMbO3QKlSt7x695kD5K0HY6zhRhfI0LFC5sb
	29h2f4w4BTp8XColz7U/HbUGqlScv7GgbeYCwHDOrY8LhfiOJjwktoojceyyrpg5TJeYibaKE1B
	cwfP5T5pdlxN3wRVIbQMwvHwZqqYTvCNimG9hkqUgkEm+DgG8UVeSwgIwdxNqVfzB0LXpf0bR5E
	j05txprpk1KmcmrzbZ5X+Dug9ENctASN5yFXyivpuIvfP5/flC/q0n4zRtEwyRtrfL/URFu0xMR
	WyKFz+BObCoQO3PbbpF976p/2gvUL4slWsJ1AQTH+6BdsftcH+GaEuQGsDEp99djK9RyKrG4ujZ
	RNgU40coGhSUoaI5JauVdt7Xr11i3O/bTbSma+fQOCWmU+QHq6YlmDSj0UKVPwatFKjIo5E5w/5
	Xpy2D95le2IqevtU9TalrR8EsKDG2X894jX43a6SrMdtodBhUxEwrvPv3A0xG1wAxqdnmRt1F0G
	IP9S9qqvhiWu8CfCU9xptEEyyVdV14kIKOT029fmX4tlicB7ckNSufpblneGNFnCCw==
X-Received: by 2002:a5d:5e8e:0:b0:46e:1225:1e0a with SMTP id ffacd0b85a97d-46e12251e76mr2637554f8f.37.1782391412492;
        Thu, 25 Jun 2026 05:43:32 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d46sm14905648f8f.13.2026.06.25.05.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:43:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 14:43:30 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9834: use guard() for mutex
 locking
Message-ID: <20260625144330.00005231@gmail.com>
In-Reply-To: <20260625120456.1267-1-batuadatutkun@gmail.com>
References: <20260625120456.1267-1-batuadatutkun@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Jun 2026 15:04:55 +0300
Batu Ada Tutkun <batuadatutkun@gmail.com> wrote:
> @@ -17,6 +17,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <asm/div64.h>

You're definitely developing against an old tree - this won't
apply cleanly :( Please update your branch.

>  #include <linux/iio/iio.h>
> @@ -152,7 +153,7 @@ static ssize_t ad9834_write(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&st->lock);
> +	guard(mutex)(&st->lock);

Blank line here.

>  	switch ((u32)this_attr->address) {

-- 
Kind regards

CJD
