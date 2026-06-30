Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C43A6B67
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 07:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805176; cv=none; b=naaIelz5gkcwJA0loN+NckYaZ7DSlBgw8Mi4WYX96UL1yVILISJLHDklMctjw1l58vqkQz1a3RT12DjN9/9zKAONoMNyQaQfZMtVA6TbfeNBvfIbBnjMlbDA1Ws/z/asUQvRga3OuQKKVTwPmr9m8O3XyMMX2KNqSF9nEt4XfKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805176; c=relaxed/simple;
	bh=x5lClJ+hHisus7sv+EdEVUAs07TB8Y5FSVG2Xgr71+8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDMk38c6Kz5xoCaiZ7Roet3BZxMZif6WB9MzhYaTpOnDne73UOS1WHyZ2LZIIpH1HcrWZ0+CIRmwoQ40Z0ete2IIrijwl3bQWz4IUX3eMB3yQuqNcNMReP649DqxS17i3ATVeVxs+BWUiJU5eKhBn6ktSGS0riee30OcdRz6f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha2TePIn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha2TePIn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4629051c946so213257f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 00:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805174; x=1783409974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f0a6CUBMW6wzjEw+k5eQBiq+eEykiLHNiQv7o3R41E=;
        b=ha2TePInPA7y1UUoyqtWbNDej81kyWAd4icdwFNqm1MP8GTdESu8Ft56yqXr3GRFCP
         sy39kPV6Q4SUgbGQSgXKIdRqX92p9T6l0LQozC0ksXiQ40ajiZpXKl/dPGu/wSWub2iu
         YeUSHeUGajl8lMzueFyBJC0myS51ADs9j0dantD2ofFsu27Ue1KTmXWJPbg1wXEcEKHE
         KTQWXCuyEIanqnVJqnKPPGkqPDbKM67A8Vm5+hNq3DoDL8K0r7gv+xlf0B0714Ms5y4a
         lLUXwm487P2UoKqmKy/b0nW5JdqkIm/2WMoPmBxhr9GKIUODvh0m+UDTmeW1QDYupJjT
         sHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805174; x=1783409974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6f0a6CUBMW6wzjEw+k5eQBiq+eEykiLHNiQv7o3R41E=;
        b=VAs+LhKSDXopRwxnateLPngX57INYwagyLP1hpAZVHdPoyDd14OSUg9OfwJuLJ0gCY
         0CTOPtsSoKUPmtmNAfPDkvk/fuKlwGYfkfh4Jy0uE8chTBQJryl+aQJEwbUOSNrPZbuk
         dIEM5veoSuT+aW0nAqMgnQIx2lw/XfMAn/6a+U3MvFIhY923CanTD6s9dRKmaaeb+ymp
         uwFM3T8gh2jrOQEQQ75D55n1b7tjXzE4zVoYBvJeIZpmOPCBky2ZoJzrIwz6W58S4cWA
         tRYOSYOGAPDXo8WWeyh9v/lpdj79OxDClovxAGq1S6FxkXj0d3GvlYBmIg5+c/trL+H5
         DMmQ==
X-Forwarded-Encrypted: i=1; AHgh+RojxPqO0pMZEgTvHB9tqmMpet4JgpDaMhaBXlYJbgQE+d3TBqiMTfniTYrWiQYotJpUAmQOTUD+I8KYbia3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbsh7vOImr4rK4vIe7rANtIKW4xzZH6VkQP7B5TolbvRQYiIHl
	6rBlysJyC5NR2MCFJiV2OphFXtDxOd/xvvm6J5gRpqhJo48z0b6INJyS
X-Gm-Gg: AfdE7cnjj8qtDC4DMrAPydKsr0FxbOgfsYdWawkF/VWTgTtRuR0Hdc17IvQznLp+dz/
	ANZDDWFpsecTfYykgPKRwVZegClr1/h3nNGsQafW71ZpKKOwaqSraYp4G7PK0BP8IMhs28nPHPY
	ZAc7GocPOSH/0CAEOFC9ueAG9ux6tID7STu6gxucw4a7uXNdq5J8MlCnH8fX7oT5RJtLq+TaV0Q
	4AQXBXjxslCiVhem/cA3WSF4JpGSApkkHMDfnKLIMqA1fxSu4BRry5mUARsfA5QxcwxmkYPcuRH
	vAAK9KwxrsyIoaJPBK6fZuzQln0OKWz/Ub6bt5+/hoiEZkW2Tp0+wLr/XObH2Zj42EuJW7i09aF
	tZ1uoyleQkT9+Qod9XJ58ZGwYgS4PU/deVIZYwLGtw9H+VsSdzVMPApH3kR3aruHWZQJDnVn1ci
	4FgiXXZHlVIt6/qdAa8EKPP65NzQB/xTGadOD9z6ahMs9bAO7u2jzDys1c00VlDbRZQb3jvsP6o
	ZaB3ZVbxa9NtLrN51gWXCnGGvu+Nn7+a62u9WT34Xd1W0pr/ausV19GWHw1Oy60tgXI8ZU0tt0l
	oiMCY+qLbk6Kb1Yr0gNQOwKvGazCBChGwE+RV3Hcw09t46YGkYbDEvM=
X-Received: by 2002:a05:6000:4a13:b0:472:e43b:5e8c with SMTP id ffacd0b85a97d-475dff5e567mr1152217f8f.20.1782805173846;
        Tue, 30 Jun 2026 00:39:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d19573sm5008391f8f.4.2026.06.30.00.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:39:33 -0700 (PDT)
Date: Tue, 30 Jun 2026 09:39:31 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9832/ad9834: use div64_ul
 instead of do_div
Message-ID: <20260630093931.00006eca@gmail.com>
In-Reply-To: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 08:53:22 +0530
Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:

> Coccinelle warns that do_div() should not be used when the divisor is an unsigned long, because do_div() expects a 32-bit divisor.
> 
> In this case, the 'mclk' divisor is an 'unsigned long', which can be 64-bit on certain architectures. The correct function to use here is div64_ul().
> 
> Because do_div() modifies the dividend in place, while div64_ul() returns the result, the code was updated to directly return the result of div64_ul. This keeps the math exactly the same but fixes the warning and makes the code safer.

Please try to wrap your lines to 72 characters.

> 
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 3 +--
>  drivers/staging/iio/frequency/ad9834.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index b87ea1781b27..91df7ee65bfc 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -115,8 +115,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	unsigned long long freqreg = (u64)fout *
>  				     (u64)((u64)1L << AD9832_FREQ_BITS);
> -	do_div(freqreg, mclk);
> -	return freqreg;
> +	return div64_ul(freqreg, mclk);
>  }

I've actually sent a patch for this previously, however the
discussion ended with the fact that there really isn't a point in
doing this, since mclk will always be a value that can fit
into a 32-bit unsigned type, therefore truncation isn't possible.

See here:
https://lore.kernel.org/all/20260409182755.499a419c@pumpkin/

-- 
Kind regards

CJD
