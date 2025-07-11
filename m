Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518AD204C0F
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222232; cv=none; b=ntMVPdc36j72JhkUviNJDu3UZtha07y6UbgyVdqn3pzlPkS5KjoFHugUnbXYUjafN1HUokJUh9liOaC+NZ+MlrkGx4sJk+oKRefaYBKRInbMv+jysPMpUgmSAuo2584ldz88OlcpFamhgiBLNBAKk/2GM7lPmoS2G87AuMsX99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222232; c=relaxed/simple;
	bh=b9d30X6AC2Mh3W35ZDDPDH18rY2ay2okI4QB1jFKHdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vc4Fr6rGgRTaMxo6JwZR8whaAnzZ2E8P0URoushWaDfgvWK7i/nAI8bJyjX67fEw8rj+YFWq5vtdxUVaRRhc1gl7CJKzxkfOpelYUyqV+4mVq8riDENlsoadZZ4pt9Wu5dXY0gwmAC5CwoJmwgVKoYbwWGPAJj2rkroFKftbRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaU8xNnU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaU8xNnU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4530921461aso11923045e9.0
        for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752222228; x=1752827028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOPImjUv0NDEdWmQs1u+PH6j3hgf9YuU1oi+RRGD16g=;
        b=KaU8xNnUiXnYTbOZs8vc1A9XjgztBqmZFiTZfM3t1yuAynEKRHwWKN9YT0zJCUw+uh
         xisX2HRi7NPsDIPic0PEd4pn7U9zH0/7UnOs88xGL8+HKriOQnwNWPxWAfla/inMpk2/
         AJLx4/vEBGIKtTk3FMFESAfwU+kbku6JXQkPJaAAi6d9LEsh2f111t9oaMfOwews2wMP
         fr8qNV0wyTR1X9BY/UQMxN/IIXVK4XszHsgsfXN8NPQVyUt4OG5Wg9q3CDK8yAci8q7F
         AtA7hAiOLaZGixrHhtlyjjTa5MfQzMgGaiyph679EhJN+iTzoZV2nFFCeRq7UODUvhIj
         wQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222228; x=1752827028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOPImjUv0NDEdWmQs1u+PH6j3hgf9YuU1oi+RRGD16g=;
        b=f+j8tNBrIfiWMa+mQOzXukHax2/c1WO2EQl0tSyoOaR6lmQqPD4BudZKlQmL4QXbQ+
         bEBM4NSmKTH1wxgxDdlgTDffKojhCK2RHPDBM85s7zHqNuX6AB+WhoUXeKqGVsIyH+3A
         VDThJbYJnfEFGzTNV6zuN2//OLE4GdPoRviRzfPXAoGnIjIaa5Caoajn+hJTk87CqEZM
         uEe4TwdgN9C12oHk/87oEVD7EkPFgOuUL5VATHoRW+r67YiOd/6FbfQFNmDt946lIFa4
         y2/uhmyfWARdaCI1hQCX6N48XjTo/3GpncPtqiJeGqOKpJT5n69w7LTFbs5ydJZlYh4x
         AnKA==
X-Forwarded-Encrypted: i=1; AJvYcCWVOXsOa/IQnV9nczWAP1reuMj4g1RC584PfeZEDXqCtNnv2DoTmq4ZfkObITthInOBrm+i52YefSh3w4wm@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0RK5ZqJRIgvhpZtBGmEL8uNs7KU7+cIJSAqdqWH+ZFQLHzc4Q
	QazI1W7FqVQSGkCK2+Vh/kA31B559yf2H3xNx87PaDtX1t0GO2amcBVq
X-Gm-Gg: ASbGncvF0jeeV4s3jxHqyXtu695ORlx/cc0IH7PncgoZ/Gy7KNnwWo0x284OX5/ZZSt
	p+bNiGG3CPBYbwKKUPQgYT/RnYxbB1vApJrA/+j916EbhjxEGI+/Bus670lpxyv1eRjQRJZHSMl
	R3qOGKLj+SxBhyPgAzlCeuMORTaMTGjuLWsH6pTHEZBxnSYL4Dv3LsTnS/CDtt2TRpTXnHm3Tp6
	aLmMFcHqGqq1Ho9WLSxkCIwkgPXleWo09/eiFayo5jdlTkMbDjqF5lPRmw+6nL5DtBJtfDpb4YK
	MKpWAsoJorbJr8HJcau6+at/7EzRtz35FLxc4Kk/sQ9Rzk+tFtPZHPD9yjPsn+LWl9N6TY7kS3L
	2lP7m9RhhE3nOgL1mgJMxfjbkJtlZB8Etu+gMWXoNTOC/z88TN+Ahkg==
X-Google-Smtp-Source: AGHT+IHr0DTxguxEgcI5wlEVMqeoTEaGB3CfaOWnNYJU9nFgV5lDHABmZQi3Ev7VdxsvlmVZMsSSGw==
X-Received: by 2002:a05:600c:138d:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-45565edcb1emr11723075e9.26.1752222228404;
        Fri, 11 Jul 2025 01:23:48 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d612429csm73543555e9.23.2025.07.11.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 01:23:48 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:23:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bingbu Cao <bingbu.cao@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Arnd
 Bergmann <arnd@arndb.de>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: avoid division by 64-bit value
Message-ID: <20250711092329.74e52573@pumpkin>
In-Reply-To: <20250709145710.102669-1-arnd@kernel.org>
References: <20250709145710.102669-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Jul 2025 16:56:56 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit targets, this causes a link failure:
> 
> x86_64-linux-ld: drivers/staging/media/ipu7/ipu7-isys-csi-phy.o: in function `ipu7_isys_phy_config':
> ipu7-isys-csi-phy.c:(.text+0x1509): undefined reference to `__udivdi3'
> 
> Note that this does not divide a 64-bit number by a 32-bit one as usual,
> but the other way round, which is something that the compiler should
> really be able to figure out but does not (as of gcc-15).
> 
> A few lines higher, a similar division is done using the incorrect div_u64()
> that truncates the 64-bit divisor to 32 bits.
> 
> Change both to use the safe but slow div64_u64() helper.
> 
> Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> index 4407750c7f40..b8c5db7ae300 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> @@ -734,6 +734,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	u16 reg;
>  	u16 val;
>  	u32 i;
> +	u64 r64;
>  	u32 r;
>  
>  	if (is_ipu7p5(isys->adev->isp->hw_ver))
> @@ -806,8 +807,8 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
>  	}
>  
> -	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
> -	if (r != 0)
> +	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
> +	if (r64 != 0)
>  		deass_thresh++;

While 'mbps' is presumably u64, it can't be big.
So this can just be:
	deass_threas = roundup(7 * 1000 * 6 / 5, (u32)mbps) + 1;


>  
>  	reg = CORE_DIG_RW_TRIO0_2;
> @@ -815,8 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
>  				   deass_thresh, 0, 7);
>  
> -	delay_thresh =
> -		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
> +	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;

That one just needs a (u32) cast, although the 5 can be moved.

	David

>  
>  	if (delay_thresh < 1)
>  		delay_thresh = 1;

