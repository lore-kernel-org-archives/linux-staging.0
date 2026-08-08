Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94D3876DF
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786177178; cv=none; b=gqt9/ljTd9tw9UQdNcbDElPylVQ2Kos+o2Eb7JhOyOEl7R5hXEYpqcjqzGzCggEKs0B2jNhTpIYET1uKq5Cmh+pp0tsUSCiuDYq+Cuo6qbfqV/jXzH35zLbD5NDBSpe7EvfJzGNBVJylRMdqlGfC7V2Y0lu9Kd+mup/CftIyAQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786177178; c=relaxed/simple;
	bh=5OyS1iYeKL7u7M4vZYiR7Emzne9AA2JbDEQkYH6bFd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqr1J8k5sBCu4SBUGf77qaFV50h92KwI+K/cdd2kMPeLrxfMHCCf9F+PwScz3iA1DI+CnRpavDNdbsgacGsL2610bifozjEgH1z4dO+mea7HeCsxji4v7uowlpOnQ3ak1V+FbLIdd/zoHZIKdq9HMfdy4G74bivyj70GKY1ylic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAZLgyMk; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAZLgyMk"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e50a650a0so13663885a.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786177174; x=1786781974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0XHpkyOFc3Yjfcej75lDn7ECxMF/ltH1IpONNgmjGAQ=;
        b=HAZLgyMkm+SmRChic9K7qaJO2E4o7vnL3Vdbfy7kmHfcRLQrpyPvjQzuy/c3NN8euh
         plL1PRGwpX9lJNnPwCfTPwSrbpBBSjL/+QC4uaxb3eI9oO+9XtRnlrkW7mesb6bc9Ayj
         jH/LaSalgVrQqVuQpfFqvhozttFSvWrW3EZcDC3wiuSIiM/7pRs06SQDZ9d/VGHR4kcx
         LzuPPcucOoIQbA50q/FTZ79j4ZU5gLSabTWShGXC2LDakOGKMWvY+GmcPl0TWjCnNsVP
         r51Poej76VaaDf3zhOrkPLyv5wlgx4/bsOo+koKu9Tf/OptX7yFwSym1CTmyayzDp21H
         WlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786177174; x=1786781974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XHpkyOFc3Yjfcej75lDn7ECxMF/ltH1IpONNgmjGAQ=;
        b=tLdDVz1QXdjfGoN8M13i46nLP43dG4knLu5Hedxom79iOkkwl/R9GfJJkw89e++BGh
         bAcuEvRcGv/voRvV6rSKXClR1jtkF0YuWP48cQsgagXf0hFWib32GC557IfhgzY6hJG1
         nVp+spUEYgLA2F35qCGjh/yTZu5iPCXDhS0+GudR9csOdfgZ8aYF5NDABoqAnGVk96QR
         8Qz7VwIdyejGOxfPc0vJYz8p8clRyGvSZXbfeHJ5FR/b/QOKV1mK7MZXp9tGBSHnKKtK
         XyFnz2safKGOO2W9PgyTSbmCmq3vtZOz6kzE8xdyviZknF5IkH1uNhZAu/HC1AomOVeD
         WsFw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn6xsF91DYpL35hsHBXO3cHARyqAiqaoGoTzkMetxDISr35yKnAW8LnXWqoZAHBXjQaFz9rz3znQ4OOPpf@lists.linux.dev
X-Gm-Message-State: AOJu0Yza4DkrKMMJVISRoCBMYAMyS6/PEbWebnB9rnH1xqujpphdVbFF
	A+vcNciAUWmhVn3dOUqtwrvLHaOCGqHJbQb0B1KLuLEMjxFXOcdLglIU
X-Gm-Gg: AR+sD130gXOvFw9GllWIiBqJhFkEzOs9vtpKhVIXgml93G6BVUDb+03xTXG0WXr0CRV
	5M445bY/llECFgZBXPrQS5YyesJNoITny6ZVfcicXKbvvItSTpfabKqWkcXoEa3pjoXnXswJJKs
	Ln1D7Ym3k6XysZG1sDHmgaPxJsp7vzTx/ID/gHnHT8RS27b6iRHQmey4gkBx7yboXJoB8bD808R
	lo0u+gXYG7cNVYDcXucF0ByjT/U+NJViXER3Hqomy35S/nxz/v5QhYLZvCotGZZFykPnkF7uQ4Z
	tJgIRwgxGiDQgxtTTMsCobciUkUFv2Bi9CZLf56KUh5qQ389s1tLJcOVZYT7g/7LujooZAXmfij
	96TW6nxZxwZh+kFFq6c4CDzLCIbsiiuE4iVMJ39fUmUTadzHHaz9SXZXj+Q4tjTHmTWdDADLhBx
	y1aiAGpaZWpgKt6q+tIyUMu1tkZ6mE13SNi40END6gHs1b/muuIa7NNA==
X-Received: by 2002:a05:620a:a113:b0:92e:2c3a:a15c with SMTP id af79cd13be357-9364922a47bmr2817911385a.29.1786177174375;
        Sat, 08 Aug 2026 01:19:34 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e279f0esm324796585a.38.2026.08.08.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:19:33 -0700 (PDT)
Date: Sat, 8 Aug 2026 11:19:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aditya Chari S <adi25charis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: usb: fix response buffer size for fixed-length
 hub requests
Message-ID: <anbmj5m_fiASaOzK@stanley.mountain>
References: <20260803010248.339120-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803010248.339120-1-adi25charis@gmail.com>

On Mon, Aug 03, 2026 at 06:32:48AM +0530, Aditya Chari S wrote:
> hub_control() sized the Greybus operation's response buffer purely
> off the caller-supplied wLength. However, per the USB hub class spec,
> GetHubDescriptor, GetHubStatus, and GetPortStatus have a response
> length that is fixed by the request type itself, and can be larger
> than (or independent of) whatever wLength the USB core happens to
> pass down. This could under-allocate the response buffer for these
> request types.

What is the impact?  Does it truncate the buffer or does it lead to
a buffer overflow?  Presumably Greg knows off the top of his head
since he maintains USB, but I'm not familiar with it.  Which function
does the memcpy() so I can check?

> 
> Special-case these three request types so the response buffer is
> always large enough for the data the module will actually send back,
> matching the equivalent handling in usbcore's rh_call_control(). Fall
> back to wLength for all other request types, as before.
> 

It sort of matches rh_call_control() except GetPortStatus here is
always 8 where in rh_call_control() it's sometimes 4, sometimes 8.

> Compile-tested with 'make M=drivers/staging/greybus C=1', including
> sparse, with no warnings. checkpatch --strict is also clean.
> 
> Note: this driver's hub_control() is currently unreachable at runtime
> since gb_usb_probe() unconditionally disables USB support pending
> separate USB core changes. As Project Ara hardware is no longer
> available, this change has not been tested on physical hardware or
> with a Greybus module; it was verified only by compilation, sparse,
> and code review against the equivalent logic in usbcore.

We disabled USB support in commit a96493560cd1 ("greybus: usb: disable
protocol driver") which was 11 year ago now.  I almost doubt it's ever
going to be fixed.  People are probably using out of tree versions of
this driver.

> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
>  drivers/staging/greybus/usb.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> index 475f24f20..ea6c0800c 100644
> --- a/drivers/staging/greybus/usb.c
> +++ b/drivers/staging/greybus/usb.c
> @@ -105,8 +105,29 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>  	size_t response_size;
>  	int ret;
>  
> -	/* FIXME: handle unspecified lengths */

So the story here we are using AI to try to address this FIXME...

We are still assigning:

	request->wLength = cpu_to_le16(wLength);

Where is that used?  This kind of gets back to the impact question.
In rh_call_control() we allocate the buffer with:

        /*
         * tbuf should be at least as big as the
         * USB hub descriptor.
         */
        tbuf_size = max_t(u16, sizeof(struct usb_hub_descriptor), wLength);
        tbuf = kzalloc(tbuf_size, mem_flags);

struct usb_hub_descriptor is larger than the other two sizes.  Here, now,
we have changed it to allocate a buffer which is potentially smaller
than request->wLength.  Is that an issue?  Greg probably knows the answer
off the top of his head again for this but I'm a USB newbie.

> -	if (wLength) {
> +	if (response_size > sizeof(*response)) {
> +		size_t data_size = response_size - sizeof(*response);
> +
>  		/* Greybus core has verified response size */

Where does this verification happen?

>  		response = operation->response->payload;
> -		memcpy(buf, response->buf, wLength);
> +		memcpy(buf, response->buf, data_size);
>  	}

regards,
dan carpenter

