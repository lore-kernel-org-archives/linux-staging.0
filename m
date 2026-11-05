Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882929;
	b=oyXXKozb5bc6DstJCUkgKj95/A3vTdRSCGopu3hWF8sutsgnVOyN9qfAsr+W7Su9O93W
	 xdQefkCJTYY+smGVQgMDdFHFcxNU5ixQtbGu7v7UXLlsGsXIyWJsLQgILPjfcHXkgepWd
	 hBNudxPrVOv79xrEuEhS61tZ1T9+KmMJGQ092gG0pT2ar4dZ41P4QKBPQ9ayt/UmTIYoS
	 3C8GV5DQ0H17rVC2Hw+iLLrTjE+JWctn1YRXCWXo600BxWJsGP5rNxUzd9m2MZuYG7bTK
	 8/HdT1K7wx+kDXVQM87wmqrV9OK9dl5ijg+pzGEfZXEX5p+U1EbHclqY+UMgndpfWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FpsCnQXulO1zACpv3lZ/XLdDu6HqgPswy6BO1ThvjQA=;
	b=QWoTvSEuJf9QHO/BsDBHqt682xzRWCWqLzI7gtrkyC7+4R/diBAm2etslW7ufIgvqzpz
	 ioT3ijh5Hs/sMIObiqEW6PGHrSSYhv9K9K6f3CwbRPxQHe7Rwv+ARzDyr7v4PcqnYqTI8
	 bH8AiTD8r1iZDvHE8QeuqSZd9UmM+egrFOjBnTKdn/dU1brX/ju7PxRP2RGsvPTMKVkBe
	 r1RNUpoKBEfYjkNoCU4YUigOftnnGTLi0Oav0WFDj+6NQ3QddRmvxlKpJxYo4mxWIptzh
	 Cznzk3bhQhw636lOyMON016xlR/2ReRNo0B+0JWNBjwBryXpVGrKHwS3g+aXYzWEY2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AqLQ/f+m";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76BB606A328
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 12:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76BB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqLQ/f+m
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3edaso438274f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882927; x=1794487727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpsCnQXulO1zACpv3lZ/XLdDu6HqgPswy6BO1ThvjQA=;
        b=AqLQ/f+mo9ExufnEpWuhFXyEzVszB4kv7hfYh0ATEM4iGk2MwHy6ET0kC15cPSgaIW
         LzeLmvYNm+q/TnMm2gSrtfG3J7bLGf1SF1NXRKqZ5aIeTQB0FbtDQ7+Fm2m189XSC98b
         EiPm5csIGtN3xteFQesm58wGBZxaYjQu9QAphTT3cPN8Pvv7Kp7VjukNLInbvNy57SY5
         gVt+5BtD/XJkrsbSvHms5iI2FntXtnCrUytoBe9mXN4RCcMhZmGOZsPZMM4PAeXj/QkD
         dOXK8aW1EmUME84oaZqT5lxHQddISNxvo3lOk0SoxnU9tA4TqW9UJlBUoXR0MZsOL6MX
         P3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882927; x=1794487727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpsCnQXulO1zACpv3lZ/XLdDu6HqgPswy6BO1ThvjQA=;
        b=sgvAKClrhkoIGSZ+h+nd1Rnv0U1tmt7l7RWjLQkDPas0OeKolMMRhR4SvuGj83S8k9
         SBPx7WWNzxd83zSjJWDKoqJtEBa7DNvSoX4DmzgiKhndwErLbL17nCZWi9sNv9uNOKkp
         vXx6KYfB/AbVGS7WOhZEuXWjNaI3hYuxrQl42OGnDo2JDgv8t8MBssgd1bVGFwY1Gmw+
         wozP1IMeXWgPi5aaPVoArEBSpjyY0xAYwvVXZkmDMMor21GKODQQLwpuCwf/nuq4eFSC
         j3xyUob+co17mn9evHbEM+hDe+BFjMZ+ufjD7nw4vT7lakk9fSLRXa1OP0YqCjwsIdZf
         9FuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB4nYkdfJ8ibqXY8vP5dlihYMWi8eTMCgV7MUDI21ehna5Luv5S6VfBN2SkDkTOZdVug9cdEhEBE5hnFZ/@lists.linux.dev
X-Gm-Message-State: APuU4Z8WfTt6wO/lYYGggO25qScM2z7jEsgh1hP6seXi48jQ26sPXN7X
	Bp92ZmhENenp57tYu9U31lAjkreqt1p38qrwcSHe8n22QwFee4uZEtxy
X-Gm-Gg: AYBFou1pXGJzWV5G09yGVfZOozBcYXOK70sEd/DrWWnaRIWxqK1J/RJKaEMDQxUcml4
	CqDPci+QyIL4dwGj/USkayBClXKIHmlfXuDB9Fs+FiFsGpIjynnWBw3UucrPuBvKiNwLT40N9J8
	jRZ+yWD4CSvCLqC3nCcu/6Mz+G5q1G4pfGfuVliX4YqRQ6yzNf6xoCpWnSZIe+PiGFL/B8woya3
	EoA5pynxv5mAeC7m4QSWJn6mnAZrkT1fOsUQZDxvplb9EMqsxWrORDv2hEI8WcoWq8Iz0AoPSa9
	TIRkFUzvCYA5jwGRhNpAurhnY+5IRJ1gN92y3QyQ5CguTo1VH1GZYF4p9ntUlWNN12FMY8XqdaW
	DZ056qF4s5l8HmsHzVAB6I3QbRJheB2XKK4RTrvgvbhh5spuW7kn+k4iLAUUCOzWJ/sUZqb7wie
	WvlbClOEIiu1lfaOibZFk1/2pjw2PyY0rMKR66Pp9SRD+IPb15meCK1YXEdrG5EdMzf9s3AxDVI
	hC/RQwv6JIeiNUBIlio8VV1sWKkhcsawO2k8RI8ZP3ommI1Awe5pGq6BVDuPLGHQ/3JsMPsuZMj
	98WXTJblHYffZCEbrJo/DPKI+5oKjvfnSDCXD3fK+UTwc6zw1d14HnG0Qfon7TEX8BtIh8iOG4k
	BN+PoGVl+0nptmNvsPEx8uPn+zGg6iMcpgmk1bRiFDrYojhaoHy5KcWxWp0BLDuTBAeg=
X-Received: by 2002:a05:6000:1847:b0:491:e477:6820 with SMTP id ffacd0b85a97d-491e4776b1emr2280105f8f.20.1793882926933;
        Thu, 05 Nov 2026 04:48:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm10342778f8f.33.2026.11.05.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:48:46 -0800 (PST)
Date: Thu, 5 Nov 2026 15:48:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Cc: outreachy@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: document lock fields
Message-ID: <aux7KmnRHloDL8dj@stanley.mountain>
References: <20261105101222.5478-1-husainsitamuwala21@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105101222.5478-1-husainsitamuwala21@gmail.com>

On Thu, Nov 05, 2026 at 10:12:22AM +0000, Hussain Sitamouwala wrote:
> Fix checkpatch.pl checks:
> 
> CHECK: spinlock_t definition without comment
> CHECK: struct mutex definition without comment
> 
> Add a comment to each lock in struct most_video_dev describing what it
> protects. No functional change.
> 
> Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff62f4..d60be8a741ed 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,14 +33,14 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> -	spinlock_t list_lock;
> +	spinlock_t list_lock; /* protects pending_mbos */

What I want here is an audit of the locking.  I imagine that the result
of the audit will be more than a two word summary.

regards,
dan carpenter

