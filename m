Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11583AFCE3
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040708; cv=none; b=jgiVK7v6gSE24AsBsVwVUrO5Be+t9iZwCXU29NCx7M00abRsYTTcO4B41184dEKTNp+NFew83WywHrGxTHlrxPnT07xMyAEOvCOvV66qX3J59LJtJgoi5M7DNAG3Ep/2qEFwPHt+MfN7K4FVQVOc4xgBY5RrDaYoys9pNnO1a9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040708; c=relaxed/simple;
	bh=fFVco98qC1luivT5Vpu84rAh1or13Sl7L/M19Jcb2qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSPCw3htqY0qNrv5YjcRT6RLYIwgrZOiEZihrBtngwxoq4H3ee+vwz/0W6TaSLQ6RF+7ew7iNS4zhytnAkFDJl5vPwhkaWQRM3gcu5NZQGbPX0FHZ9zrwA/NQbnOqtCh/udbxZ+YtwE4hBo7vTVWTL4p4eed5eIvptNoCRQIgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7c6jGmZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7c6jGmZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so141792345e9.0
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780040703; x=1780645503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vc+BiBXqNApFYq3fT6m0KjMLEQEnAecWg6fvOnqt1MY=;
        b=G7c6jGmZ/ZdfW5N6f5Pe0vDXlzr8kI6+rzVw+3hJSs8tzpYWJjKhL0Ft5h3/fs1u64
         ZnYxZF527vqlEKbZhyLeb1aOUg1qVK6A2t5LtgsApijmPd5TlBZ9nX1iARxrwcfHWZcE
         BbqPfYGeQDsYK6KYdYYBRg7F3/VexoSIuzTj8RJom/jrU0nW/ikDVQp3Vvv9rjwnLPxF
         As+Cg1AzcBEzWM1bmz3wXGuGgKPKhkJOt0M/p8pyFkBV4mbVIGgUcKgQcn7AFkI9ECHD
         u718/WgQ9CBm4wEHoF8hfAguM2MCfOHnT0Yj9A6zKgVR3NSvd9srGNuux7/QsHeSKvwz
         wtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040703; x=1780645503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vc+BiBXqNApFYq3fT6m0KjMLEQEnAecWg6fvOnqt1MY=;
        b=YTWTFcMyP4k+TCgK+3RcB+YLts0j//0IjDiH5dNtTgYQAplU55oL44/gKufDg5JNj7
         35sPSmlGLt4tST+NuzBn5zoHpiYkPOjERySH4P2O70vZswTqGvJ5zdlf3tpu0mZEyF44
         1Mbzp0FaV4aVkExckk7k6lFL6YcwGF/P2OviLVbLXikfqIy4g6JTvO0ACJtgCo2pnzks
         h476EsKtYpVoprG6CazlBeDEdKn09p3LJIEU5QPSE2F2eobNWUYVbSuU4WcnKlgMI9MG
         z5frmjww8MHls4YixG04vk1zHGMI2eJNT8Mm/05rOAa8ivuUBCnsFQxrJpAl4S7EGQi7
         4Fag==
X-Forwarded-Encrypted: i=1; AFNElJ9e55bIKJWgORYmmtxDUYl4JTqUsxXNc5KHCQfzF3u1vvrB0Bw6Xsojqc4D1aF/Lj2UsxxShYuWFCI2zPGO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6s5dOK1poxTl5g84wqkOVxkLDEyE7mh9+KxEIvFgMF30/5RGw
	sM9H3jiWedVsOzXWstfPQGA3AQV8KhggrX+PTGL4R8eol8Oyb0VZHHSJ
X-Gm-Gg: Acq92OFgH1b5AVTlhsHJnnNpNTmCCpGYoObf5cMSOdTZyziCT/p30IlXxIR9ruDCW12
	Ijk8LsJpuyaxq9zTd1JV64c5Bzv92JVBfHXE9XwHgDW/kg2/IK9npY5U+nngQgbaQRi/PgY1tVh
	0ft0WTLfZeG3pg0f+6ODB9CCLRIqU9LqwGZzwo4bvoBHnur7DZFa7vHmJhGLlj7YExcsk5KypG9
	we9zvZ9rnLFp/0SbdK28KdBAAQcbEyya5bACxX+usciX7y3zyBsCoKJUF7svdWVFHq1TGiqSWTD
	jpkrT7p3LXuOrH8oFSatGj3EVdKwJRQQKbNWPyqYftD515RYHGrwH+G+Z8mPbh9poaai58spp2g
	2eTzpp6Ti81X9Yob9lF8yqbv0A3VUrTHagq7aU1cM5/QoexdxrlZTUMAt1v+8CksYU9lr18gcEl
	5+/O3OGCwdbwx9ayt6aCUJWPAVxKWgf9wUCQ==
X-Received: by 2002:a05:600c:5288:b0:490:3890:605b with SMTP id 5b1f17b1804b1-4909d376fe3mr24438075e9.31.1780040702882;
        Fri, 29 May 2026 00:45:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6975e2sm32452585e9.6.2026.05.29.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:45:02 -0700 (PDT)
Date: Fri, 29 May 2026 10:44:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up coding style in sdio_intf.c
Message-ID: <ahlD-3VO5EbmtJ9_@stanley.mountain>
References: <20260528184415.63810-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528184415.63810-1-phant0m.mail2023@gmail.com>

On Thu, May 28, 2026 at 09:44:15PM +0300, Vitaliy Slivinskiy wrote:
> Fix checkpatch.pl warnings: remove unnecessary braces for single statement blocks, fix spacing around conditional operators, and remove multiple blank lines.
> 

Work against the staging-next tree.
Split this up into multiple patches.
Run your patch through checkpatch.


> Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d0feb28b7..17829b982 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -19,7 +19,7 @@ static const struct sdio_device_id sdio_ids[] = {
>  	{ SDIO_DEVICE(0x024c, 0x0626), },
>  	{ SDIO_DEVICE(0x024c, 0x0627), },
>  	{ SDIO_DEVICE(0x024c, 0xb723), },
> -	{ /* end: all zeroes */				},
> +	{ /* end: all zeroes */		   },

This should just be:

	{ }

No comment because it's obvious.  No comma on the end because
nothing can be added after a sentinal.

>  };
>  MODULE_DEVICE_TABLE(sdio, sdio_ids);

regards,
dan carpenter

