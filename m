Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3160191F6A
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756282035; cv=none; b=WV23tntaZ3EZGuhILS6SUIU/FHFmIBnfxCbx6wFoPd+8FidBJqRW8jmWvBXjGRkku5D5kbFjjdqC2mGMPPVNxcDYqBWB8rUtASYymrzwJ4c3KzhY0lD2w7GsHutEXfyWJV5QVyxhhjDyCyd6CRHCNdTR16N/4wo8eD76OJEC0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756282035; c=relaxed/simple;
	bh=5HApl7J1+KZSg0OQPRohvfP1g3izBueYr15Dlsj4rF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7T2lQ+SG8V1jselPW5BMDxE0oI8nKxjMQRhCJNPh/ww8BL0TdwRJFAibUmdMGTOGRCjcHa89fPPX8uoixZNIBNCDtao68OY1Z2+mHsGVBByucmKJqvu0ff2lQQWzlGIQoeQrByDEOX3x/gpUZtAMExTrTySRnVXvEfehh8rMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+RaifF+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+RaifF+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b6278893eso8732035e9.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756282032; x=1756886832; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XEEEilHfE1GLhoyVzsYIneNopkvi33gatO1klgimhI=;
        b=B+RaifF+oDXhBfZKn2CrPAxu+PCD5QmskQsK89ZrQa72T/H/7BEaMYDp4pUFLb5Hgb
         Ar8DFNfevIrbIn0EcEsRQzUuFYIYl6DIOaWo91736yxXljX/EQ+VeZfp66C1tpEC1Tu6
         GS9+xNCeLkDfdTSNffKXaIHICtubeVOK0sP9w3spJBD2AxlKpnGK++3UNlo3BMGO4epB
         OPvXuz7o2x9PaMlSv6nziQeDqUpAGizNdC18MlC9STlPyNAjmrjY2P2HnKrnX6i91LdQ
         GdcEMrJnULxQoDdauka9dqvkgN3/RCmuPqphGJUE2Ah3k4XG0x94YRkG1XBsegnIEGpk
         c2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756282032; x=1756886832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XEEEilHfE1GLhoyVzsYIneNopkvi33gatO1klgimhI=;
        b=a0mzNITsxR185HiIHHYJUZaXDISSdJQTMwxWUu+xam+oTnCcu/3NV84AlMnBErNCqP
         +5hErzOk4bYxEyqBmcqiQMcHGOxDymg3sLGRS+GTGlSLa/BPAO+C4CW7UDfu+9mUU8Eg
         H+nKHOOwi7XWdYWs5fzbEFHneU4qrruzXZ3MotKGB8XsyVBUOmYUuSAoM3KwkiAxZL04
         ZoNktilOhRdoBMShWgHEYO9awcaIN59hH/qXXj77qw5rjtf5zMxeM/PasSl9eMrS+Vfy
         HRLVn42Wx26Xklj6GnthTPFEdDWQBDV09OOqDDU4cxN+Iq6Nl8XHjy0ORGfYK+o5iGEW
         tf8A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2b+5VNNEay2QSNdgCABDs0S2IkU8AVuEFUzF1BIDnnKPY6wISAaaO2cQr65/IppWGSTM+lvQ4gwbpkVU@lists.linux.dev
X-Gm-Message-State: AOJu0YwGkgpcr9yViGPseSjkohnpt02/eWc5dXkekP/Rkcfo9syt6eZl
	iaMkv2CBfZwL9Z3dFT6qTAVZEPbLiK3GEYf3/wdi4UMeN6Uh5GM9tUjNCxaP1QJVHXM=
X-Gm-Gg: ASbGncuV2jlsEf8vbFcGmpQqedS9yLq/BUAam99aZRVLoWDbnL8j45gq6jxJ7kU07NN
	p2c5uVUZGW5/W5MAgcvNOtZgtCpsP7MVQYiu0/lIGgJCxSrhvg3JaDHARSLhgsa4K6tkNf2sRSv
	gNCovjtAX7W3djfeUjLRRgX7KEbjz2Dgl1Ldw+iznY+EXYU7WImohyDNONZDxw3xSSQAsySLTDu
	bIzqoDkjJ8W8zeHTtNf1WLU8WBc4J5VLbOpNWbww7zWeCCQTZ1apNLUB2Oei8FZ4krnC9L6+7AF
	YqRRH7RgBPwXIHGkDQgrSEt/c53rc/a4nS9vCd5c67i8q30OiuJFFpBzRwTEoyKt9ve3APFM3UY
	VDqauGr7I596WE/8QhxEnKeWiwOs=
X-Google-Smtp-Source: AGHT+IE8CHB+zttlbDDIwDXRSFgPzyUYpDYBRdNDJ3qUHnqYkUBhH/KN69QYUoUlHi/jGAxq2dXn+Q==
X-Received: by 2002:a05:600c:4687:b0:45b:47e1:ef71 with SMTP id 5b1f17b1804b1-45b517f8e7fmr156917515e9.36.1756282032014;
        Wed, 27 Aug 2025 01:07:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0f320esm19676075e9.16.2025.08.27.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 01:07:11 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:07:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	matchstick@neverthere.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: gpib: simplify and fix get_data_lines
Message-ID: <aK68qXqStIwBrejF@stanley.mountain>
References: <20250826220502.210485-1-osama.abdelkader@gmail.com>
 <aK6wlcLBN1HclMpl@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK6wlcLBN1HclMpl@stanley.mountain>

On Wed, Aug 27, 2025 at 10:15:33AM +0300, Dan Carpenter wrote:
> On Wed, Aug 27, 2025 at 12:05:02AM +0200, Osama Abdelkader wrote:
> > The function `get_data_lines()` in gpib_bitbang.c currently reads 8
> > GPIO descriptors individually and combines them into a byte.
> > This has two issues:
> > 
> >   * `gpiod_get_value()` returns an `int` which may be negative on
> >     error. Assigning it directly into a `u8` may propagate unexpected
> >     values. Masking ensures only the LSB is used.
> 
> Using the last bit in an error code is not really "error handling"...
> 
> What you could do instead would be something like:
> 
> 	int ret;
> 
> 	for (i = 0; i < 8; i++) {
> 		ret |= (gpiod_get_value(lines[i]) & 1) << i;
> 		if (ret < 0) {
> 			pr_err("something failed\n");
> 			return -EINVAL;

I meant to write "return 0;".  It's type u8.

Also that doesn't work.  The masks and shift mess it up.

	u8 val = 0;
	int ret;

	for (i = 0; i < 8; i++) {
		ret = gpiod_get_value(lines[i]);
		if (ret < 0) {
			pr_err("something failed\n");
			continue;
		}
		val |= ret << i;
	}

	return ~val;

regards,
dan carpenter

