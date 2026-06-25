Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A873DD85C
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388859; cv=none; b=csWSjn/Cxd/5ALIUVKOZ9tHdgYEgIHAiF6XOBgliGRlJfcX3l9oKSKths7nIKGagJ9YUroTSo/OL1ZlPeD7zSCmvE9VjtqZ70kR22DUTi5AyYDA5RAR0aMNUv/Twfh2UqVpdyLHLW3cCrjeNYcWvzqZJzO20RHWpMfxdQdo0048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388859; c=relaxed/simple;
	bh=0A+XA5sZigyJDUsHUd5Oo1tLE772EOJuScegvrWm3jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMP/HXVsvzQdJWh4lvboN9qmyLew+nhlB3ERCeDqtQ/jz4/k/GILM1BvNXOeQuM2+7cy5RcHnWx7EbD7rUST7G5Icw51N8r0vNXzqaWzkLLG3sYv1lmEJuHAHifoyATKvp+9YpYqESxrcD8NadnC2KI572TpZutBxDpf8mN9b/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjHHY3Rl; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjHHY3Rl"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43f5e285111so1416716fac.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782388857; x=1782993657; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxsefe/wUailqJDNAQGtmAmRQTu3ij9uN6odmHme2Dc=;
        b=hjHHY3Rlr/uAi1GzzphPQ7dQtL6kr1gKr/MA7E4U4F9fyVFIBeZTWHzqSqJPJNNd7g
         77z5moHZrqE+iptXoAK32SpJmUSFVDdUMWD+oZ0xN180c2AHD8rdke6nOlC6fhWHE2FL
         /pE/wZyP78clqTrauyRHiWKsha7KTEnSj8R6V75/k4kW3R918Ki0h2Fl1t7Kp5WuJ9sg
         DoYQlH+I4s4iGOVjzKNYVDYIyFu1BmDg3gC3Do37hhk1QePLn08LrFfcEwq7XsWEPuxH
         jCax1EIJyniYtTSbtPTHSHx/RvsbMWlpLB05Z6SU60Jvns2upJp9nYRNqlAzDiwgGOCm
         F8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388857; x=1782993657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxsefe/wUailqJDNAQGtmAmRQTu3ij9uN6odmHme2Dc=;
        b=qLrT8RLbKflE3SxbbZmYUYJyp5jZezszzH/0Wrzo6dn9efVYYBzhj7WO+QWntnLF6V
         Ky3YfForLOdbBpxL3vZLAr91D6S9wb0AqzfbAePy7aqedKVr6g7q/E8EgpW+27j4hhpF
         g/ePWGJww1XLpMl+GGCR07eXbxfPa7doYcCEiYD5s4e0J5qIyMaFw/ef2rcyc1AJmcAx
         tX8EDxxOkWKYR+J/ri+IkzN+wyOHkY6+Rq8dYWTgSdMIKS91MWToEBtNODIcUdHXewTv
         tZWpQr0q1qWgzo/nmlcsiYkV+EBZg2luUYixJlfNO4GiJ34QaeLbXbHObL90T3M6Pt80
         pnCg==
X-Forwarded-Encrypted: i=1; AFNElJ/eTEDyvJI0Qt+rZqLVamYPcI0HA3U9X547ce28VbYmpP+YrORalQMtvaSxSIwrMutvHAlRGXKJDNgsugg3@lists.linux.dev
X-Gm-Message-State: AOJu0YwC+LmpuF5evG8siTFkDAjLbRwjlaySNs6NqwzNpNz7J0UVjl46
	WhA015LcSBhbwKhFP4+/0LetDgd6UjrK9nXJfXia4mZYGfqiZGsH6i6K
X-Gm-Gg: AfdE7ckWBS3PB1E9akF32ji55bcB9eOWV0Q2GtiZ0GChFtie8VTBreJaRF3wX4tomC2
	MYNHJVz+AdcgkmfY4DToxqN/X2Wq6y/qBQstj5a+ipbJmuA2hfvib0AZY2vbKfv22/Wdtr1B1fB
	RlqWIRHQ2DKjpEYhwMwJOZhV7Bn5YhxefM/snKZ7VrLXa3EPJi1vMTJcG1j6J4mDev9XyYNeErk
	okBf5i/9SMt3aiYnLgxgolEZgpMSCVp9c/4rpGD+AnNzLeiTNCif/rp75AMnlKX4SGrYRfSTCAi
	zn6hxe+RklGjlwJzUjo67T61S1CnedsPByzXpt1pDSIWENgkLjH36nXx0k+3aYe9J7JFFzQCQTF
	F0R0pVb2/33rNAaWH/ukYfM4NBHrBpWBhtwOZs2FgsAb0q0Z5mCmZfQTUOAh6Jzq2pbkM9z839n
	ABu1S4
X-Received: by 2002:a05:6820:82c:b0:6a0:e2d3:8659 with SMTP id 006d021491bc7-6a1351969f5mr1724499eaf.15.1782388857443;
        Thu, 25 Jun 2026 05:00:57 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472e79af8fsm11115403fac.0.2026.06.25.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:00:54 -0700 (PDT)
Date: Thu, 25 Jun 2026 15:00:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix unaligned access and txbuf safety
 issues
Message-ID: <aj0YbygQwhlga4Om@stanley.mountain>
References: <20260625111602.438761F000E9@smtp.kernel.org>
 <20260625114215.325973-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625114215.325973-1-suryasaimadhu369@gmail.com>

On Thu, Jun 25, 2026 at 07:42:15PM +0800, suryasaimadhu wrote:
> This patch addresses several pre-existing issues in the fbtft driver:
> 
> 1. define_fbtft_write_reg(): when par->startbyte is set, buf is
>    advanced by one byte creating a misaligned pointer for 16-bit types.
>    Use put_unaligned() for register writes and fix the SPI transfer
>    size from len * (sizeof(data_type) + offset) to
>    len * sizeof(data_type) + offset.
> 
> 2. fbtft_write_vmem16_bus8() and fb_ra8875 write_vmem16_bus8(): same
>    unaligned 16-bit stores when txbuf is byte-offset for a start
>    prefix. Use put_unaligned() for pixel data copies.
> 
> 3. tx_array_size underflow: both vmem helpers subtract 2 from
>    tx_array_size when a startbyte prefix is used. A small txbuflen
>    device property causes unsigned underflow and out-of-bounds heap
>    writes. Fall back to the non-buffered write path when the buffer
>    is too small.
> 
> 4. fb_ra8875 write_vmem16_bus8(): missing NULL check for
>    par->txbuf.buf, which remains NULL on big-endian when txbuflen is
>    0 because the PAGE_SIZE fallback is little-endian only. Fall back
>    to direct write when the buffer is missing.
> 
> Also replace empty modifier arguments in define_fbtft_write_reg() with
> a no-op macro to fix checkpatch warnings.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>

Is this how you would sign a legal document?

This patch does too many things at once.  Split it up.  Also please
a delay between sending us patches.  Otherwise it's overwhelming to
deal with.  Bunch them together in a patchset instead of sending them
one by one.

regards,
dan carpenter

