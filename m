Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6A21B9F5
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648511; cv=none; b=uPBF+uk/tnB4IchYg8tqu7WyOEoPMn6ohvUH6o6M3ez8zb3cB+7wZaIFa8bSif05/R+HNW2k871i1U7SwncJYG4qZylG2r1/ONFoPOfFNKYnn1tcz2Neo7ldAN9aDPaGeLvxeQOyitz/iocOPTAMBZNYXkVYSku54B7oJsY8fXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648511; c=relaxed/simple;
	bh=x1uU4O6ERf7uSMhZA+GDKpID7bpPyS29bfrvbbIt+58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rn2weMyrUGpICiIyXGOpfwZebaUsdoplyzP33SsPIQJ+DQ6k8zDjcKKiyS9tJkRrwSOeHwjZrU+ZWAyl6xTomLX/3kcaNCsU1i+tO0hdNzI/d5yHFb8aQnwL4GMZkmcZW5VfGFiVUHFzSRvPFTWBgrtAFpUcPA1uGZ5Vy71PVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6QIISp5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6QIISp5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so37668375e9.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773648507; x=1774253307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gM8VLpK7o2tGvr7MARawA5A/lh/4eDEJKA70VNN8UJ0=;
        b=f6QIISp5eyYU9qyHpOQD6i1qs44ExKpz4EQC+ur5ALkfvmDc+vtjAjhJsYC+v9UACp
         YaU/G/4KVX79NmLvedesaCdIoQxH1M3cHIRulKKUE3QSNtjz8KnH91ZDLNLQJyBvCAkW
         MnichvP7KGxXCUj3pbE2LNUthjwaXMmAEmcj3OntWbB4SBagiN4ITkzTZQd91oCGXZih
         MW7pmTE1PycxeyngHQYlCDTmDDDSwc4+D3h7IIzuVATVL7wKzSyaOB3EbofMwhWiacPt
         bAfyYqngivsFKTUYwQm8IzjPkFZCWwQ0bU41uKUlW7EgmM1UBZUQrDeQHXb7PmvR6sLT
         /s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648507; x=1774253307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gM8VLpK7o2tGvr7MARawA5A/lh/4eDEJKA70VNN8UJ0=;
        b=qijWRDNRMeulImyjZyNOa4vbQq+KvfevUaIxmuBs67J6P6Pyt+4AhqeZ3nQuhy1ns1
         aRlON3pl6JReoPw+8XYvlc16ZjR1P1sR4BJBhoRRnQQoHQS9ukfBEDUddbAnuFItui/Z
         Fj0AwP6P0MKORDBMUBp1zxVRr2wFwsao/g0wi8AbRFsQfEEz8GzMeH/CkhECU0CNB3qm
         OnB7BtGQb1cdh6ZhGoo/gN9TZ2/+hgDU6CoJSApriAXkfcjy8b+Oggg1mdjYNXY3wtLd
         lSaQLsl4y4GSDUbw4bg07Zg0mdPSB9sVk9vaJcxBQQJsaPpQdMcSOrbFAv1P+TeMr5fa
         xRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZexMHEwrBOUNF5sf0EWswxY0IRMl/pxZJx//UCFRR/IC/kgExvaBuJ8VrBpE3qKp6LP91sAK0RfnKuNav@lists.linux.dev
X-Gm-Message-State: AOJu0YzkZjEGlpoqzjYYdlRrnlj+7M88S/TGrplYeCB1zaDyg9vvo1Jg
	RRptNIRyrpo0D0+eSfRRnnTE9WUvdkiq7PTfAGPoz++W1ku+vUv9PGfuDJxI7LWm49Q=
X-Gm-Gg: ATEYQzwneCU73G3arVySU3zrS9mpiq5YQT55wOmSr3JHvLxd7HJcD4Es6UUqsdTtJMU
	/wcpPRARa3XemBSqTIzdCpBtYRfOd3qD0LJly4whjf2zAg+xPYDUB3L3NJuT0loe/+J3LzHmVJP
	ccpuv4cdYDVLGQZq6nDnW5tTFtgXSkuvqvm2GBvUlkq92KJkmRGyDCzCqMCreRsVI1xEkc3WJyQ
	sFcd5043DJLysbVQmQhLixGjDDe5fxRx+/pBaBYe2YiYznPMVFVsm+niGPyWaJwbHFTup7oAG7F
	EmBHqQy1aeOf6WowmpLZD7+Rg05zATQiFExingJqZAnpo69lCbNg8n8BrpLcYY0xu7LT8UNmUj0
	bucIY6DnhpWO7LrkH8VMY4xnEAQJtnZrGyvTMDfhfU/DbPUB81wfV/f4cJuMDnTokU8banVtF+N
	vjB6xo9W313olKn24UaTd+opZLRouv
X-Received: by 2002:a05:600c:8a09:10b0:483:badb:618e with SMTP id 5b1f17b1804b1-485566d6e33mr138080005e9.8.1773648506976;
        Mon, 16 Mar 2026 01:08:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm456509905e9.6.2026.03.16.01.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:08:26 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging/media/av7110: update FIXME comment for signal
 strength
Message-ID: <abe6d4x5wFwtcCiA@stanley.mountain>
References: <20260312-staging-cleanup-v1-1-fdb9f8367e3f.ref@yahoo.pl>
 <20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl>

On Thu, Mar 12, 2026 at 07:21:17PM +0100, Tomasz Unger wrote:
> Update the FIXME comment to provide more detail about the future
> implementation for computing the signal strength based on the tuner RSSI.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/av7110/av7110_v4l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
> index 200a7a29ea31..a64761979609 100644
> --- a/drivers/staging/media/av7110/av7110_v4l.c
> +++ b/drivers/staging/media/av7110/av7110_v4l.c
> @@ -310,7 +310,7 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
>  		V4L2_TUNER_CAP_LANG1 | V4L2_TUNER_CAP_LANG2 | V4L2_TUNER_CAP_SAP;
>  	t->rangelow = 772;	/* 48.25 MHZ / 62.5 kHz = 772, see fi1216mk2-specs, page 2 */
>  	t->rangehigh = 13684;	/* 855.25 MHz / 62.5 kHz = 13684 */
> -	/* FIXME: add the real signal strength here */
> +	/* TODO: compute based on tuner RSSI */

This seems reasonable and also pointless.  Is this AI?

regards,
dan carpenter

>  	t->signal = 0xffff;
>  	t->afc = 0;
>  
> 
> ---
