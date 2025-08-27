Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7142820BA
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756289383; cv=none; b=YYz4o6Goq1aGFDZPuWydNb005IKyaQRDHhSlH53mauoOQn2EAJ36z9373u/xj1Fb8DkOcrHjdpfx4S/xpt7BdbRKbKncWMmdVbiKlWBSDEpp3nmrja0akaAnzHQyMj1aVOz84alPR2DFeTWqLe6g49MvvJhs+xeW1IWdrLQhnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756289383; c=relaxed/simple;
	bh=J0lkcTHUid3XxD8U8mPToo1lJJyfeJ5m6rE6h09yz5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxeNzeT8CglH8Uzb2Fc2TCGpL/Y2Uyib630RuGeq8FLZaOF1yyel82hnhR2dIYEUcRYbqMkOly0R+EN2O8Ej1S/LAjuQAmcMRh740uXCPYPV6jJBuU73w/btIrEsYT3Te0xaChEgphsPXxlI5upLpm1qBmiR78yxaXs+Wk5/Iw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECU8fq5w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECU8fq5w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b4e5c3d0fso16295735e9.2
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756289380; x=1756894180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPJo3DFYnaR9E2CWsARN7ky89otQMe3GktK/razN7cg=;
        b=ECU8fq5wtJfcD9UruWQXlryZ+wNojLP7/qeyHQ/Gd8uSneFwFMdY5Ji2XXX5m3mxQU
         nUdEKrv/2qg3D5HkCyaZZkMmIEPGt/dSaCdyiYbF3xfCBFPhcu4woOPlatmINEtO6Du/
         cDxyXyl6hq7wgi3hRwrdu8U+xBWl+X5hny7+a7WmknOiXedaaMNyOan5vj22oZpCQgyY
         lQ15krSqDsjvux2GxEJoHAUp5YC74AnCPdS+mFEaQ7L6Uy+JwtlrlJaQCoE89khj0qg6
         UN5cKqxIqZfWORbcCYYRKdvPc4fphfj1LGfu48eJJPBoBuDEFZUOWU00S5AfL+xx29kS
         UbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289380; x=1756894180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPJo3DFYnaR9E2CWsARN7ky89otQMe3GktK/razN7cg=;
        b=tkDfBDLBQ3VxoDvZKYjg2RcdJhr1zjnshb/i7t7CkSJZd6j+U4W7rAyVb/i+6P9eNc
         YcQmS5NAnUAvqUfxmvVwpoIVOvEkuRMqs92vXfq9WnsamZUj86jpVIGD5T6WC6K6BfLj
         NjNE3VVwqyFq+Au6O2lsX30NO2GFTbYzL6qRhzXP2pqfR7dL8WkRjvz3bVyoNoSFdvue
         +SZNfctDUIgLDWsXJfOBNSOGs97iYxUpZu/DjdUD+1gBI/m4gjio49rUVlNy29qh4kRm
         0r2SJ3fio8xMa3PMHmUIQ+rlixCnSkxaetsdxvKSS2gHSrXHoLAiWSY2zcRK0Hdm4b7Z
         pMWg==
X-Forwarded-Encrypted: i=1; AJvYcCXwmy5NJw10HYImwBfsEz5KGI2R7EpThTFbXzYYoVvHyuS9Z0iSh+MBXXpUNnBQQ+OPvAiO5a7ASKvdAyNI@lists.linux.dev
X-Gm-Message-State: AOJu0YwLs+z44zZ4fhADw5AOslrjXEOpuIh7RaTCRserFmh6t0/iutYj
	s3+/fLG+q5JsQB2d8XkOSGSIr0YWmoWLTB2jv+tb0dsnUtS+IAIgK6xo3cg5dUHokkk=
X-Gm-Gg: ASbGnctNHMXL6/EBrDEptTut2137JklpmlXpZO712AGarOhdYgHpU3kjDHC2H3lrCSN
	8aBlbwjdhNOA6/joSouA/uyED+MKfwAK7v16Ud5el9pZbjrs6PPxJtT7CdoYwvEAzjUbxZUghLS
	yD2Xe7ZvtV+KoyMRdPcpmOt8ieuYJNRBvQ2HLTLU+Lr49DfEMy2sVJN6y95k/94zTp/UEMdWb3J
	81WW4R+5OHYisGYzx8p98IkIlDeTH0FACXOtTSyxX5fKPBmkd7eH+6HqYxJjBefmgCLHB00i6lh
	vS49CeyDxuxfFfOILroo5CK6hf43ctQZ/IprGEulISiSwZ+GYvzQakms2hLvqjS1SO2PZaCMls5
	RrzpqvjcdqK36hL1Jea8uMptqsAY=
X-Google-Smtp-Source: AGHT+IG7OpLH6k3HwvLOeBkdHsqBfZQ/AFfCGLhvEb/bBCKCAM3IYfHng/H18tROilNBSKqh4ga5LA==
X-Received: by 2002:a05:600c:4715:b0:45b:47e1:f5fb with SMTP id 5b1f17b1804b1-45b517d8ffamr156139455e9.36.1756289379317;
        Wed, 27 Aug 2025 03:09:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cbd534656asm5268714f8f.66.2025.08.27.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:09:38 -0700 (PDT)
Date: Wed, 27 Aug 2025 13:09:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	matchstick@neverthere.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: gpib: simplify and fix get_data_lines
Message-ID: <aK7ZX3rlcS6ObWvE@stanley.mountain>
References: <20250826220502.210485-1-osama.abdelkader@gmail.com>
 <aK6wlcLBN1HclMpl@stanley.mountain>
 <aK68qXqStIwBrejF@stanley.mountain>
 <f3ab3c2d-2056-4802-aa73-2b0db4c7fc30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3ab3c2d-2056-4802-aa73-2b0db4c7fc30@gmail.com>

On Wed, Aug 27, 2025 at 11:28:36AM +0200, Osama Abdelkader wrote:
> We can change the return type to int and propagate the error, so:
> 
> static int get_data_lines(u8 *out)
> 
> {
> 
> 	int val, i;
> 
> 	u8 ret = 0;
> 
> 	struct gpio_desc *lines[8] = { D01, D02, D03, D04, D05, D06, D07, D08 };
> 	for (i = 0; i < 8; i++) { 		val = gpiod_get_value(lines[i]);
> 
> 		if (val < 0)
> 
> 			return val; // propagate error
> 
> 		ret |= (val & 1) << i;
> 
> 	}
> 
> 	*out = ~ret; 	return 0;
> 
> }
> 
> Then in the caller:
> 
> u8 data;
> if (!get_data_lines(&data))
> 
> 	priv->rbuf[priv->count++] = data;
> 
> or we print the error here, What do you think?
> 

Printing the error closer to where the error occured is better.

How would we handle the error correctly?  Sometimes it's easy
because it's if we continue then we will crash and almost anything is
better than crashing.  But here if we return a 1 or 0, what's the
worst that can happen?  We can't know without testing.  Adding new
error checking often breaks stuff.  I've done it before where you
have code like:

	ret = frob();
	if (ret)
		return ret;

	frob();  // <-- here
	if (ret)
		return ret;

And obviously the original author left off the "ret = " part on the
second call.  So I don't feel bad about that I added that, but in
practice the second frob() always fails and I can't test it so now
people's driver doesn't load.

So adding error handling is a bit risky unless you have a way to test
this code.  Just printing an error and continuing as best we can is
safer.  People will let us know if the error ever happens.

Let's not over complicate it for an error which will likely never
happen.  We can just print an error and leave the bit as zero.

regards,
dan carpenter

