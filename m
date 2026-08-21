Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E34BC006
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321710; cv=none; b=syqjKDY79OpEp2XGQ02opiZQwRS9k5lbv/bDAPbnoBbNPxHawYQ/LMPT8svcm15Ne646b4z9MTgDHzo9jaU7O9WsGOwajhdk8zReaeV98ie8FY5Log4HJFqM0L0j4fx7T1J6o2kOlrwQovArfljBlY4EA0kpLfeMm7VlkSXh+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321710; c=relaxed/simple;
	bh=JW5czaD2mxQt2d7DRTx1WpKHhDSc7gUWTlFvWBzinq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me1ADxsgBUGVRGAPGULU2V7l9gaAC637keZQBBcVBFBUmn8HQzlkA1kPpgLQIQG2uuQ5Wv+dulQJJ2zvKWk73ZG/tpuCdHMA5pQTeG/QxxiBm5MDuvQE7SeTOS+6XfCDC9LHK2DMU9htBg1H4eVI0yhXPdDg0rXQhVwjC8zfiBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7NazI7Q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7NazI7Q"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980dc26022so7652885e9.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321707; x=1787926507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UfCLiVXz7TZXppNIA+DfwYYVjdDOLWdByz+tfwQpvlI=;
        b=X7NazI7QBhGKf4j4NMiNykmpKHicTT9XDR3m8UMmlwQtPsBkOhSPW40VtgrFmn8Df5
         IE735cVvVaTwrHehoRikpCJrgwvAeTE9mclfJCgozCUbHjgVxJWgXnMqaL8vH2b+BV2f
         DGe0pELVyIWSVHTdHRjb+peK2eNYlvvT5U84PfTm3ny9F5GpHX/6ByTM7jIXOi8aEB5w
         U7i1T2eOOjBBnZfNnWQnfOSotoINm+fiBlwEVlYF2x95dVLR/XQG9BwJvYKdq79YdZJ6
         i535wtNccZBDPhkfVEmJdbonJ1QoO+S7FPmj+oFxpkdADYAtDCksm2JDckcW6W/7AMfo
         6zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321707; x=1787926507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfCLiVXz7TZXppNIA+DfwYYVjdDOLWdByz+tfwQpvlI=;
        b=PXmRwdWPGaDcBG8QFbc9pnBrryQ5y93Pv/1kIXHt+/2fTCkEzT/NBP5xBOPn+DiMhB
         bzjrhVFxgGjLr83zdrOAZFQ8nbiO1Rgk7VzulPz7c1LrVEeylljWbcHTMrAoDf5VeCEc
         BodhvHDUH4Ln2Wusacdi4lYkjXUfCEYJEfTpYxGnv+bC2Iv1wGCPwTVcA1xzDZqf3AKv
         /fNNJE+eFVmmsCwXTRL9LPwyn/eW0oTNsWKAvyW5925pf7DYMpkpts0l6NQHJWIH4hLB
         ETOHJZSYNR1BRyU0WdeDX36FYHpu6xvySZrqqJG6F+uUApPPmU0TSA/T7AJAdY/km6r8
         0ZwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBZVFu3hT/LjdI7ocWNyINl2dqS0QrN4moEgUKZ57KxU+XBXl5hRNOYrJLN5QiVvInmSuvqO5fz32Fxfki@lists.linux.dev
X-Gm-Message-State: AOJu0YxFUQlX9EfI2wR7QmA/d5+xxbt9kpjP88zvW0wUHhS7aIjAp4xo
	jYt4P1LrsRATFzSCqrg3AotdhkMJLEFkzOjvBikZDBRLra6lREEZkilg
X-Gm-Gg: AR+sD12rw31oxqHYPy646IHDNsB8jUbKFfwZ2VgVhlTZe7rzOHbEjNokbywX2V35kkX
	to+Qsk1b5oieMicuM/T8zD5XorLMlAF9JZY9ZPxIgoW3xa8dU4Q+H33lyr7XY+pGSGee219oJ5I
	YFTiV0RSzxP3BG41+Kzg8QYWq/Q1//0+WMFhLnzkAYrA+4syc9x1Q2QRkkSBC58XdaaRnIDIWLT
	8Cu6h72xV5+gBzIjeoh+Ey1cl8KIecoiST9diXON/A/21KE+gbNlvuCf3bjci8X5Un73zfVS92N
	cY9o2pB/OOzD8tsrP+XvQEbj9E45+KHx3cv581ejuCWGmIRPBdKxA8fPBz8THnGvklN3R78NBw1
	qEsrKFzasbabazFyDCtKZghbqUKDsiyxJ8dt5WTZy3GT/WfBMrB3uT3OUr3YqtN01uAdHr3BwqG
	Wha1lajM9wIsOAXKwfXDUBpWPNM7oKoqWDnnFgmhjWDTZYXTQU1Ln37AMU4piSkds+FLU=
X-Received: by 2002:a05:600c:1390:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499b83019eemr95249565e9.13.1787321706912;
        Fri, 21 Aug 2026 07:15:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bf9efa89sm1855765e9.4.2026.08.21.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:15:06 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:15:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: fix function declaration formatting
Message-ID: <aohdZq8Hyn6Nus8i@stanley.mountain>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
 <CPYP284MB0854550BAD16664CD1110456FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CPYP284MB0854550BAD16664CD1110456FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>

On Fri, Aug 21, 2026 at 11:04:09AM -0300, Tiago Panizio Gottardo wrote:
> Move the cvm_oct_of_get_child() return type to a separate line and keep
> the function name with its arguments.
> 
> No functional changes intended.
> 
> Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
> ---
> Changes in v2:
> - Split out one focused formatting cleanup.
> - Dropped RGMII formatting and parentheses changes.
> - Dropped unrelated alignment cleanups.
> 
>  drivers/staging/octeon/ethernet.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index 42ec4b8324a8..e668e3baaa31 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -621,8 +621,8 @@ static const struct net_device_ops cvm_oct_pow_netdev_ops = {
>  #endif
>  };
>  
> -static struct device_node *cvm_oct_of_get_child
> -				(const struct device_node *parent, int reg_val)
> +static struct device_node *
> +cvm_oct_of_get_child(const struct device_node *parent, int reg_val)

So, in the end, checkpatch is just a perl script.  It's not a king.  If
it isn't useful, then just ignore it...

None of the other functions are declared this way.  The thinking in the
original code was that they wanted to do:

static struct device_node *cvm_oct_of_get_child(const struct device_node *parent,
					        int reg_val)

But that's 82 characters and checkpatch used to complain if you went
over 80 characters.  Probably the right thing here is to do the original
thing because checkpatch doesn't complain until 100 characters now.

Really, the original code is kind of fine as-is...

regards,
dan carpenter

