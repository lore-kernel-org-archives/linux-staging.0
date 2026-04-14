Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDEE3876B7
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153612; cv=none; b=PBkrATLxmNrto77UIzmwtQzQx4x8UmygauTz8sSbbs74u6CrKuwtxMVr7taX5gLawuq0JQ3VhKTrg2fj6prqmQz/4qyUg13deNMthRqhNRxuL0kv0RaEzvJsWdUCM0KElbXa7KdSMIpx8QXL6rUa3ooPdL+azteWJ8bIa4xtJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153612; c=relaxed/simple;
	bh=r4j2tP7P3aTe/1XVylrCKGz445OYYeky3sOfeCovyDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVHE6juz93PvMr7Gu/FDxMxa+b71NC/t1UhEqDmXienvxYRY1d7xjWL8Rzdvqc3V27IT547zWX35o0WjZ60kGhzmNo84pUnQS+wpfzDxRfLr2J1F1dYfSHHWvY9jUTiZ458Thlo4WzmcvT4LSN2wRsdlyamayHrnhetzbjG5pn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWdo40AY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWdo40AY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso87804935e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776153609; x=1776758409; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4s6SRXG3jLim5/RSNVTHH9/fsxDsM8ly3EYLZybfQ70=;
        b=sWdo40AYcsVTGeVeGzHqFy8BMJD1Kk6YTZh6ZtrARDiPcPG1ZMUcMn/B2aGHbAb4LW
         06tpbcDWkLD94HYfEieo+xjwjwLza/QPc5/yTjTHTNImlvU8P8pioko0FjNxTGHi18mW
         iiCt9NkcALcRMeiXNwKUgqPX1juC+sinkraHFWWp9QQgC68MVsQRNoz4MuN/SutsuNF5
         c0W/ZP7/XIjhVIKrxkN6HNSxPWCgD2qfGQH4yyNXoxID3GfKMgDH4f9BS1dFRJWW02py
         fpKsN/jlcKXPgOQFqiTPOudMFXb8BQQ32b187SvUz/4yZeDJ5b3Nl5Ch0dB3s/Qd4Ftf
         jmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153609; x=1776758409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s6SRXG3jLim5/RSNVTHH9/fsxDsM8ly3EYLZybfQ70=;
        b=R7+LdTZ/s+5pK526jfsTgSEpVQLNO2jN1r1I/NqJCvxKarkE+EiorpZ/RDaROx0bQ0
         WqRqNgxta1cvUbgtjZDQFO0IdbAN1OLgU5hRFK7mlIBRGcQ4HocQv9S1jbwC6VPAtJ6C
         B+LbM9ijhsEypjjXlDW3yHjYTpfoEuKPFPflcyHgXJA81j5BqP8VAch2uYr5Sa5ICYt8
         aCmbBbqhgGBjPrnJvubE5tYNZS6+tY0oW5EqR/GU0FdAE6gNBmoSQS6UECPnlNhHzZjo
         iHqbHQRmctjZIEz1yYjX/6xE+h3NIwMWlXz0CwOwKG0V2gXxddpCuDv2D9E3jpAvZxoF
         iUaw==
X-Forwarded-Encrypted: i=1; AFNElJ/UqFp4MtmBvCvmibdkuYfWhwVa9A6P1yO27K3sFIFX9xGcZOVUO97QR/8adn09oLUeNonZ923qnwaBE9Tv@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3PqJTQjGB5gtcEdYm0qbeM/dnwyRcpQuQD3ioT5V0IIbNnQix
	yegB53dNopsU7WySXJdlkM5OhS4NDwtsvf5x5AAUVpMhfwxlwIcptiBX
X-Gm-Gg: AeBDieugOtU0H1DBAuKa3NdRIK1RQPMeMJBsRtZ70NgJv1NP26HkJ5K7htf1Pun9MBM
	G/2DHhyBooBQXplGnl9ZII/S9pVnLu0t8HSEXogYHx2pyisEtn2HniQ1MCR2o/PS1XQgqhVooJl
	z1+a9kNTtnFLEGFl8pzzMB0G79gp7NvgeMA4v5DSZzB2huD/cHLo8XY+60lApIhNH05bl+udh+W
	BKb7JaL61P01ZL24babu6pVVTUy1st3uQD5kBayhOzen0w309WYHxjvHzass+CxBFIQdNXtLrW5
	suwSktjZYN5JppXNiQFzah4stXuPNaglGLW6et3FtyCxn210dJFRCFD3gaFLM6c4BMTPnyrLWyK
	A+E73jvcToxwNWUjJ90TGqRmk6dnsdZZhxk9X640g+POf2MlHRlrTGspozu0TobEVW3t0JYZJuB
	v2qkv7I8VPpp53u6rP5g1/NxYpE1mFEYIyhvk3
X-Received: by 2002:a05:600c:331e:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-488d684323amr127903065e9.15.1776153609180;
        Tue, 14 Apr 2026 01:00:09 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b4903sm153281125e9.5.2026.04.14.01.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:00:07 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:00:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad30An8Oi_D-UTB2@stanley.mountain>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
 <ad3zDOhTjfwy_vj9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3zDOhTjfwy_vj9@stanley.mountain>

On Tue, Apr 14, 2026 at 10:55:56AM +0300, Dan Carpenter wrote:
> On Tue, Apr 14, 2026 at 10:46:13AM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 14, 2026 at 12:43:06PM +0530, Shyam Sunder Reddy Padira wrote:
> > > The return value of kzalloc_flex() is used without
> > > ensuring that the allocation succeeded, and the
> > > pointer is dereferenced unconditionally.
> > > 
> > > Guard the access to the allocated structure to
> > > avoid a potential NULL pointer dereference if the
> > > allocation fails.
> > 
> > You have a procedural issue here: please avoid sending a new patch version in
> > the same email thread. It makes things harder to follow. For example, I usually
> > mark the entire thread as read if I see some comments and don't want to go into
> > the details. It effectively means that I will never see the new version that
> > already was in the same thread!
> > 
> > ...
> > 
> > > --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> > > +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> > > @@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
> > >  	struct rtw_cbuf *cbuf;
> > >  
> > >  	cbuf = kzalloc_flex(*cbuf, bufs, size);
> > > -	cbuf->size = size;
> > > +	if (cbuf)
> > > +		cbuf->size = size;
> > >  
> > >  	return cbuf;
> > 
> > Now to the code. This is still buggy. The problem is that the size is not
> > validated and when it's 0, the same issue (dereference of invalid pointer)
> > will happen.
> > 
> > Dan, JFYI k*alloc*(0) returns not NULL and not valid pointer.
> 
> kzalloc_flex() basically can't return the ZERO_SIZE pointer.

I meant ZERO_SIZE_PTR.

regards,
dan carpenter
