Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA31E9B04
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739343927; cv=none; b=l6dEgrofvZZ6YUBWqgUuXoMjblknRv6zem7YVSCYhj4pQuPjqj4O8k1wKZkSF35xfjJSSBQMt+AZwbfUsvUdR4wFNr3br+TTo7F9NS24+uDD75DP52JZYUSCLMh5XVpsSxuAaPdiiqc8XlRCcNlBRlDxkbq1jMZWrvX92ejM49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739343927; c=relaxed/simple;
	bh=zXcsr3pYSv/96sSEGUCA4EAQ0xqtIRVkV7ZrcBxxVWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0QQtH2P1cKhfSLnBNI0cpSWCLw5++FxEDIhpnwrDr2ruUUzXlKFpG158YRJG80CIJ+Owu8VN3bYarAxweH/3gjXRDbBqsTIRK4e/rn9ib095VLXLQ2pwLxh937McEYevMtk5Dg+XuYFgekVfN1oU0NSRZ1VQatE2jg4J4dz/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQU60RaV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQU60RaV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so487289166b.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 23:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739343924; x=1739948724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=euETd8cRVjpfUqZLd/hQWqqaZoYqUqUdjkzivEPa4lo=;
        b=nQU60RaVGbcrx4/DI/HqdSkpwnPkPLii+1MN4BU2Xr9HnEAWqPz/yF+N6HqUCBVsoc
         0RXr5eQzNOiTbb4RvKXtiQobksBFQ7SMDS9MhZvJthK4eHyQppl9IW7skC+t1g3KFbQS
         2L1sZxPrmcAWSrja8VU3hE0hiFNbyznXswyQQT5MC1hJzgopLn6LRsG+AlQ0hkT/cPyj
         LENcZTT9ZRjLM1XLT6Pm+9v7b95nVSNlV+BRas+rBoQtoLOtjTRBN5n+5+PeJ1PDfhu1
         o99Imsqb8tUn6ey0wv6exeXyWU4sxhYG6rqlUDeSVnANqeH1RdQIADv1REcMcqNXIh61
         gN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739343924; x=1739948724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euETd8cRVjpfUqZLd/hQWqqaZoYqUqUdjkzivEPa4lo=;
        b=peHIR2FLeJV3/GJItxkv/rV/LARcc+zRFwSSGich08n3HklZrW4Acn0EUR6BxR5QrV
         lGmmUOoctxHRfj/NyjzBfL5iohfOFPZbl1sGuwSDHCfHJrSDieWs0FoEjlKPAhulPbLZ
         pfhSerW7BTYE4sFTJrKhxhTUvIrdyn0ZuhxnxFv/AWEgLUFPMhEDFD16XJrjIBQC1HwZ
         8gJQkVzkvc3TkajJnL0KrGEnFkz2W9cWhYeHN021yTA/0VWB9K72SDUCGe2WIi2EjjT3
         YMpNb/uWKZ9i7lP3cwDK9iCNHjkDpkyRRQiAI9NJW8Ox9yU44Ld9y28jpOwb5C+7TAjO
         X0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX4X1QaX6uSHCE/Gfpt/IJNTkV/3G5esRZCeyYzskonHZdM0fR9upAUk3ROXS9LPJQq/iRInx4JkL/sYIli@lists.linux.dev
X-Gm-Message-State: AOJu0YwPYvhTL3A+rmVyZRX3LMttLo17JXJKMJRolZQrIOgL748sM21a
	wrkfqUzpwPrTW9nSAh2KHC7HHvKp3o+h5iwN2XKSv7wZVGjNRdvHeX4X1moGQNE=
X-Gm-Gg: ASbGncsfapGAMltB0gE3tqGFq+6X5Dg7T3Kb8eK0x4A54NkgTLQmKcET59LTWLo32UP
	WOkV8tWhb8ck9A9Z9Rnbslbb3mD0iGcGklcn8csZ2MVcRXqNRsoh5XbvzO87XIMr6Ea0foCaqBa
	DRHJ3+0H5eU3OTZaoBvg9dKB5Xvpqmd8Sn60t+lCjkMsWRprci+QF3qBW8jlGsz1tqMwvKKLV67
	VjrmHxoroUbQMbv8VcGNjlFU+t2ukb8nQzMhu4oWSe4SQmqJricv7EVxjoQpKqFHb/g5l+4Ybpq
	UzJK5WHDKBUb4ekPCtNK
X-Google-Smtp-Source: AGHT+IEm2y8yicAGvHFY6cOVVOaorfYDtm2HfwUzjHmoNrYmYq8SoNb0GQoTipxLHQvOSBL85AXRNw==
X-Received: by 2002:a17:907:2ce1:b0:ab7:be81:892a with SMTP id a640c23a62f3a-ab7f3714cf7mr129434666b.12.1739343924046;
        Tue, 11 Feb 2025 23:05:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7832a02fcsm1116402966b.94.2025.02.11.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:05:23 -0800 (PST)
Date: Wed, 12 Feb 2025 10:05:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: gpib: change return type of t1_delay
 function to report errors
Message-ID: <90c2bfc7-9a76-483c-8cb6-4dfd358d586f@stanley.mountain>
References: <20250212024247.176572-1-rodrigo.gobbi.7@gmail.com>
 <20250212024247.176572-2-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212024247.176572-2-rodrigo.gobbi.7@gmail.com>

On Tue, Feb 11, 2025 at 11:35:36PM -0300, Rodrigo Gobbi wrote:
> Propagate t1 delay configuration error to userspace
> 

Better to spell out the problem a bit more.  What is the effect in terms
of what the user experiences and explain why what you are doing is safe.

  The current code returns "unsigned int" and it doesn't handle errors
  correctly.

  The ni_usb_t1_delay() is the only function which returned an error (-1).
  The caller, t1_delay_ioctl() doesn't check for errors and sets
  board->t1_nano_sec to -1 and returns success.  The board->t1_nano_sec
  value is used in ni_usb_setup_t1_delay() and a value of -1 is treated as
  being above 1100ns.  It may or may not have a noticeable effect, but
  it's obviously not right.

  Typical delays are in the 200-2000 range, but definitely not more
  than INT_MAX so we can fix this code by changing the return type to int
  and adding a check for errors.  While we're at it, lets change the error
  code in ni_usb_t1_delay() from -1 and instead propagate the error from
  ni_usb_write_registers().

You should add a Fixes tag.


> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index d0656dc520f5..cb8840f2a461 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -1591,7 +1591,7 @@ static int ni_usb_setup_t1_delay(struct ni_usb_register *reg, unsigned int nano_
>  	return i;
>  }
>  
> -static unsigned int ni_usb_t1_delay(gpib_board_t *board, unsigned int nano_sec)
> +static int ni_usb_t1_delay(gpib_board_t *board, unsigned int nano_sec)
>  {
>  	int retval;
>  	struct ni_usb_priv *ni_priv = board->private_data;
> @@ -1605,7 +1605,7 @@ static unsigned int ni_usb_t1_delay(gpib_board_t *board, unsigned int nano_sec)
>  	retval = ni_usb_write_registers(ni_priv, writes, i, &ibsta);
>  	if (retval < 0) {
>  		dev_err(&usb_dev->dev, "%s: register write failed, retval=%i\n", __func__, retval);
> -		return -1;	//FIXME should change return type to int for error reporting
> +		return -EIO;

Better to "return retval;"

>  	}
>  	board->t1_nano_sec = actual_ns;
>  	ni_usb_soft_update_status(board, ibsta, 0);

regards,
dan carpenter
