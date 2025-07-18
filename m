Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD715E5BB
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873439; cv=none; b=PsEb4Q6N4N/kn1KJagCFBiOqFtRyzTZvDzoj1KaH89clcXTiAzrkmWvPYDScngPc8KS+kWoYKaIr69G3EBm9NBFeNhi3tr/SLRfin1gBn2BcG7sT3UADY1SD6POVwCU1rvZRfFlVPVVG74YZWf99YqQtO8iAfqM+kyU7jiRppso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873439; c=relaxed/simple;
	bh=1we4BNyZjm8RBRnwSxx4wo+G4NuxZiWnXz7k7WwGtK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dw1NctNFj8faagRs8s3q02JAv4y1P7ikOwiuxmNmG8Dd0spJcbyoUlaC5M3usGKcNmDLYmJq8avnXB5kKBk7y+Huu3lmVrwxZTQlHBIbty+arSZ/nUHy7m5NOFPq/gNDnEmBvzFToZvWDEwmLTQr9Y8ovzP5bqt1wZHl9THOXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4pBgUEf; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4pBgUEf"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c172f1de1so1532967a34.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873437; x=1753478237; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2HU107DWxeJ8QpUWs+264JfniOxCt57NM2CKpeAioU=;
        b=a4pBgUEfId0eaBybyLV9Rno42JG3aDkztAGyRZ2QSg+vzMdfNDCmTl8RCNX6ybeL86
         q0cSphcNWFU6mr8cSTpZenfKlczGJPFVrzhv9tJ/3wzil8npkQp+f0YXzBzgwbWFLORu
         slbm246FMUDCykQhVby6S3fg/Pp8RNYlGIDIV8csH9ROGNJnd0BubC9WKam7GV0qLKta
         2AWq/8+/G0w1IRWDHTvqYHJ2FbnQ+vqALp8uj/gofR+JFWPWyZJRstIy0h+A/iKTHte2
         FSJkKrY63JpKf1TcptdwvFkxrNbgqDKwMqoCVG+o21UD7ezE9arfdRDAOW2EiaPQ7lms
         Gm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873437; x=1753478237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2HU107DWxeJ8QpUWs+264JfniOxCt57NM2CKpeAioU=;
        b=psvfUPnX4vBj+Pu3lprAmtGO1R4cGiYGiaa8v+LqcqdoCIiO+z+ZcIGsdbBvA0nFhl
         GWcEWpn93MhSSjJN4fKEYxtaGL67alsfNs/1f5JpWso/sPEMlSYQNepHq8DkX9rYpQCK
         5/W7Xpo3oeAjIoaLVbPTeyqDd/47QfJCt6iW+K+OerhyWQiHYNlYPhMcYoejL0ZdXAUV
         9moPzdDw5Q8aajoE0pIn5VLbZN5xbdfLVef/xjM/Eq8yKJ/RY+m8IN1pA9Eybiu9FB02
         rWUMv/6NtJTcaGWexzlQwJ7UutHGGb4/moBgHs0WPFm0nupmg06JykkQVPu5QjmOoZvu
         BUJg==
X-Forwarded-Encrypted: i=1; AJvYcCVNY9s8BPbjZsG+BvTG2yikD5/Qkm+/Gs3f6hPjBwRoCeoIvZTN47q5EYf9sbsY6Pe6yiwNvFkRuSg643Se@lists.linux.dev
X-Gm-Message-State: AOJu0YxTs9gbgoXWcePbMHRatlyx7b/1k0AjtCTDn4yB3Gi1z3QNMdou
	cK1Asa2WvdP+5a5jr6oV8uQsRguFsJ9bhYmUr0JZuF7hfBBzWWk1Zm3KHTOjUEfse6E=
X-Gm-Gg: ASbGncvd6K0QaVUQU7t2Vz34cp8sPF7xT5TSEn3gIbaM7mKw/00Mt0GxtP54YBxp3ty
	/1ioGH6APoiZcpWyCyLy29LMqmxbzUmhq8wpVWDMJw7ICvWGXxRDwrV7zTTlZnjIPWbe9H0MfKu
	zZg+g5i0FSh6RZmrGxfN388d+6fvvfvJLYBvafiJIU/wIy77oZd38rGBrCSApijKnblIdeChXfQ
	vIvjeuoX/CaBV/6GLRaVjksZet3x5oWIUaW6U1gsctXr74vdiDdcmPH312qIlB+y7dAWzWf3KRa
	ph+3kMWNr2BXPsQws/aE5nM7SsXFdpXsi2/w0NOpmHzZrjesGNxNXmxi6eqicVGlzMNCHTVvcqH
	J89aI2rm4W/PSE7qCBtt8w1mzeifWSw==
X-Google-Smtp-Source: AGHT+IEMwkHe7o0rLxRDKlvWcR6s/GxZv/6d9WXPrLeB7lGEuJfR80OfhLY4uOCTY+sYBlZAg2ErZw==
X-Received: by 2002:a05:6830:40c5:b0:72b:8fd3:e2dc with SMTP id 46e09a7af769-73e662d80ffmr11860820a34.21.1752873437043;
        Fri, 18 Jul 2025 14:17:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83636eb0sm942734a34.21.2025.07.18.14.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:17:16 -0700 (PDT)
Date: Sat, 19 Jul 2025 00:17:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: sm750fb: make fixId array static const char
 * const
Message-ID: <a9cd4eed-841a-4d00-aba3-5ffa0c40c3a7@suswa.mountain>
References: <aHq33vXh0F481FB-@MacBook-Pro-de-Ignacio.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHq33vXh0F481FB-@MacBook-Pro-de-Ignacio.local>

On Fri, Jul 18, 2025 at 05:08:46PM -0400, Ignacio Peña wrote:
> Fix checkpatch warning for the fixId array only:
> "WARNING: static const char * array should probably be
>  static const char * const"
> 
> The g_fbmode array cannot be made const as it is modified at runtime
> in lynxfb_setup() and lynx_alloc().
> 
> Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
> ---
> v4: Sorry for the confusion. Previous versions had wrong line numbers
>     or included changes to g_fbmode. This version ONLY changes fixId
>     at the correct line number (734) against current mainline.

Please stop sending new versions of the patch...  At least wait a day
between sending new versions.  This one was fine already.

No one cares about the line numbers.  You had put that note about line
numbers under the --- cut off line so it's informational only and won't
be included in the final git log.  Also line numbers are constantly
changing so we just ignore it when people tell us they are changing
line 123.  It's not going to be line 123 on our end so it's not helpful.

regards,
dan carpenter

