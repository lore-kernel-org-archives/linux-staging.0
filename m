Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FF481236
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709982; cv=none; b=YvyxM2uabMmWu2fNhm+cYmuN4Pxzn5O6PYhmq0WQNnBShZoZfV+569DRMtVN0oawoUHGjukCCmPpXlJlQcQBfWz5Lhb1W1/1ROzmNtHk4g+J+5R6+bU+NOQr+jQwWvjbP5jymxYZjQPJpTGWRHZuSzEgtOeQBdST7Orv7Oa6lQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709982; c=relaxed/simple;
	bh=52I+FqtPSlac7Up26ZcTnxLn+KCNGyoMvIJjZotH8VM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqUBGPOIh9hMTJm26+oDXLRBlOE0cWtm3lX1L6gSx9xkG0JX2b2rAawr+6KgzsObv6u4F8yPrF5WuVfH+3l59vuFqcigU8RgxAgF/H/cqBCKbekgJ7RDPIZvMnSV1QYFDx3ItDsDEvN4nfdPkgZsZdUz7eL5GTluhXr1FK5dLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDdHZbEA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDdHZbEA"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2229357f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784709979; x=1785314779; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWQplWHzIYiB9ra/DxAbtBKO9FD01YAgyf90olLpA8U=;
        b=UDdHZbEAI38mjAakgeD70KEGERWxkvM2b5xfwFss6vK5q3N2ajiNFG8oD4T2IQiaMS
         MZ2WQ4CnMnL+ZkaBuYl+WdnxvrsHkcvAFWBwVGfil9dBVird8TarQeKmphQvGNHKWFa8
         kzLcScNvEVRXLgUca9GVCZqrMK9Jd98zccVxH0Qz1XWFV/RUDv+UH3e0wXQVX49JgYuE
         EO287PR1we/l9NiYCgiJWk3jqm5WLf21lJzqQRUSZFhJhp9Flpi0gF4d3JrPkHARsRdM
         ZXJ4dUer2MqnCKYIm3s5UnvVDGopk+sPl6dkDJdpRfIqI6btwUZ86M+bg6XDo7FJENPk
         PdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709979; x=1785314779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWQplWHzIYiB9ra/DxAbtBKO9FD01YAgyf90olLpA8U=;
        b=a5namfTNHAGeeNtdNq4vJA2C8AjnjJvjoukL4H1uLrNrYVQ5cufj/9Soh+HZwHBhaW
         caNHrpw2KeG+RN44lBnP0TUbsSkRtFsrVkHcIMXO51CDviigwiadCRzIeMn43l/YStzS
         10JZpCeVQfKYQZ/HWbcYpMfKQJgwK3tyf74Pp8OMRZIV6Zw8PB8/rlTfNmsdC1fHkWT2
         2gDT6i7tbGkWsEzQoeDit5GlodLXE47pMbtF1gF0XFEskxZ/s4QM5/kEYYeR+ZQK3Ysq
         D3DN2bRJ+vFOPExxzlts3Xx3/l23ZL8ZsDX2GyJI7Occ6/dWEMfDzB+ra6O98CLt4hY8
         fApQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEDalGBDFfkwj6UmzGDRFYldOgKtntAuYTpc5Onp/XqtPC73XRHNs+5XAYTq7XJmHenmRUG0wO0vlhZvh2@lists.linux.dev
X-Gm-Message-State: AOJu0YwjAcDubVRDcFRBS+0vXQH8GTOIvY51MIORgz9yPwAnxK/kRJgU
	jVcZwSZraZ1MoLm6LuCwaAPNAIsB3e3tOGLhCS9yhH8LZP94KXxqsUkw
X-Gm-Gg: AR+sD10hStnKCOk6CZ2JJSnzUvonRuyKsBFqZbX4b8Iua5kqkFqG27U4suUniEld8az
	b0fip4IkUZTPKHQjUyxrwKMShzGbDZMQl712biD3EV8jaybdZUKLNyjGbebbMim5dQQXmJEPVvU
	FKMFGzp6TIVG4Mw1VhXU5Dc9VGXXbOmhY+WX2hAljUJRfKKXIGheRvJfoaCOhJ9S0e/T+3xpDdd
	aJk9f6OajiKiL/7HPCRozvsBGYOpsFekpHyH+kBpy8XwlcYAPkrQfKTl1zkkfnquKtu9enRNy8d
	uzOXpnRQz6K/vfoS1jO/ijPQTQLlAVUjK87WDCLCWNQvqulPpAf8hrCRrg8kuzbonCsalrSwTFo
	x5BmFWgB5UDWtOx2jxB4DD3DhuwlsVmHsBe1Y/sRVpEVE3quIrVm9LWFaM0Irjij0YDLi/6BlIv
	alOC2pIutzEIJgcVFuLCQfSsPKIcz7bXZQcsWzOczrMsh95sEbZUHwEQrC6kw2dC9sHwvaLEg9K
	Yybaic2oNbP3FTpGz356BqbYpmeNgOpzgwXGFl59aEnb886Hrfd3VmZR0/36dii3G7/uC9I620H
	mPF0ElFmJMos/JWPGo6dLrRplMZjo5nblTAVsHn3DOo3m8bLwHdr5RB7qL7Xff2OP3dXpg1ckPY
	aWdI2oqKMpBWi
X-Received: by 2002:a05:600c:2049:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-495639714bfmr87077095e9.34.1784709978460;
        Wed, 22 Jul 2026 01:46:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm133607895e9.12.2026.07.22.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:46:18 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:46:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
 nuno.sa@analog.com, gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
 me@brighamcampbell.com, jkoolstra@xs4all.nl, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] staging: iio: frequency: ad9832/ad9834: add comment
 explaining do_div usage
Message-ID: <20260722104617.000050fa@gmail.com>
In-Reply-To: <20260722082227.18768-1-raizudeen.kerneldev@gmail.com>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
	<20260722082227.18768-1-raizudeen.kerneldev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 13:52:27 +0530
Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> Previous attempts to change do_div() to div64_ul() were rejected because
> mclk will always fit within 32 bits for this hardware, making do_div()
> safe to use.
> 
> However, Coccinelle continues to flag this as a false positive. To
> prevent future developers from submitting unnecessary fixes, add a
> comment explaining why do_div() is intentionally kept.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---

Please don't send a new version as a reply to the previous version,
as it can break tooling such as b4 for patch review.

As for the comment, I think it's good, however I'm not sure whether
this should be split into two patches, given that this is a small
change. Andy, what do you think?

> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 60c33e10c46f..6d046e9121e2 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -118,6 +118,13 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	u64 freqreg = (u64)fout << AD9832_FREQ_BITS;
>  
> +       /*
> +	* mclk is an unsigned long, which triggers a Coccinelle false positive
> +	* warning about using do_div() for 64-by-32 division. However, mclk
> +	* for this hardware will always fit within 32 bits, so do_div() is
> +	* safe to use here.
> +	*/
> +

Unnecessary blank line here, you want to couple the comment with the
line that it's describing.

>  	do_div(freqreg, mclk);
>  	return freqreg;
>  }
> diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
> index 33dfd723923c..8722f3a01cde 100644
> --- a/drivers/staging/iio/frequency/ad9834.c
> +++ b/drivers/staging/iio/frequency/ad9834.c
> @@ -103,6 +103,13 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
>  
> +       /*
> +	* mclk is an unsigned long, which triggers a Coccinelle false positive
> +	* warning about using do_div() for 64-by-32 division. However, mclk
> +	* for this hardware will always fit within 32 bits, so do_div() is
> +	* safe to use here.
> +	*/
> +

Ditto.

>  	do_div(freqreg, mclk);
>  	return freqreg;
>  }



-- 
Kind regards,
Joshua Crofts
