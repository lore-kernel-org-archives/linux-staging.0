Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785E2397B9
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189008; cv=none; b=B/gAaV7Vqgl/XhnKPeJoPlZIhlxYHV6VND86DtUX9rSg+ODaaBPlce61AaZ7ifvAJ2SIbI3sT3Rvi/FjPwx2QXlhxtcJ/hjIpK4gBeu6gEsmw3YFIp/EalygDx37hT/q6zsaKr2JUbrvUHNHdUhfF3kzU+OtfBXaomMx7HBL+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189008; c=relaxed/simple;
	bh=9FKzHiZkyVqJIEUKOBCkb0+X287tOTOwgifqFsa3J/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK6F3rCv9pMvMoo5Zdn4TAsqx0pHIRjGeaKPm7rGURRWPzTQHXSfg5DLPcrn88zYHiTxamHlFeMZ+NHLcH/dvlUtItUpsIOBfY79nJFGfp8mGv/uD1yEqgkBAix+WbB/rZwubtGNBAyYigDC4DT9ds/m5YZH2VzJ68vEk8OSXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtW6lm4l; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtW6lm4l"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c1389so4620868f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 01:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744189005; x=1744793805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P4JUvz8afTc7HG6/FXYMalLsIL/FarPH6ddKiz9jFrk=;
        b=KtW6lm4lcLVrNZSftx79WW2R5n4XW1//xuP3SDJ1flO5RlV+8F+gImMXK4xwzFVhRY
         l+Kv+86cMRbJC50xnwY65UhlWChUv/SaTBIn7+dLmMpnep9juX9bXTu1ax/xYnwBO3S5
         riZzLItmCo+HH1ymU6lIe3W5pkp9nGuzhmdTh9URbloUoSleLKxuizRqsdhfGbLHW1ie
         +RxRFwmPjy+q/JPUONzc5JR9rfEO62WI0aLdXTr+MzpdKFTf4McrsuTop4kFqvTTMrkJ
         /ZfYX8iUb+c5LnjddTQCqCf4fq1okTNEuYBMlYKzb3sbBKbnFfiaDw0XQ35ET/gQ6NWD
         RyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189005; x=1744793805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4JUvz8afTc7HG6/FXYMalLsIL/FarPH6ddKiz9jFrk=;
        b=B6vfA1O+3vcbbXnARZfRaEDmDHkOO+eyfyGNIL97qOaRVz6oi4u3yHVKh32FNc6S2e
         vBHRifyY3X8J7U6B0ww0cvhP/M594KlHrrEwq55UZAzz7rs/yGmcuFtmeNcv8QVXXxcS
         g2O5EytYp0qFNB8M8oNeXV4vusBXmNLoBoS4Jk6xyTN8gqqFUYZkLSwJ5XptdiSr9QuG
         xxME2btHn44eojLJoAvaYw0nXbzKaYtVKkCelLP+pY4kLPKrLLIcY5h25u5Kc6KQUCFp
         6qzQ+u37wmbkNQPJppTS49DAMXtwQrpLNkDQzrBAj4Ir7miipHLrfrNM/VQizVZJolkA
         YiSA==
X-Forwarded-Encrypted: i=1; AJvYcCVUHLlgvVF/qJfLxKTXxxRKT689Fvgij9tSaqw7Y1IfvMi83Gcaq0VNfgm70YOQ2bsHZDSiF2mDsjSzkU4i@lists.linux.dev
X-Gm-Message-State: AOJu0YylPL+0Fap3h9OdeV4pYE6HL7/JzxpXAohjfsNB6x7r+UCQBO47
	MKd5oib0dTCONWQxVC9o1c8SJ5yyN8Gci5khWQAnW98BLRWO9AHq
X-Gm-Gg: ASbGncv6Y0qSafI4TUmtQYJTksDF2NxUMlOUqCku8BOjlH1OOqfpXo0KnarRVMYyH7b
	Zf0EwbRmFsbRGB5/GNiHOgqhfBixcCupBXN/AFmHomdikWoyR4AWbsD//9BiGH0JbBhMjzNmX6D
	I/E/Dp9fhC+kWeSwpWgyzg9iZ7su0iHHEgMe/ZowNqsnqimiD/DNScQkMDuRHf2hNe+mgfipTTD
	WHPz7Plc5W+Wrd71SlaI8GVcU6wbKV8cn2GI5FS6RGz9Ec5EZwrel8hqctZyA0kzu+P0SE3ReNs
	EKKgJI/9RKncmurT9iGNVwAQ4pJI+ZR5FS2Wduv7rNAOmdztY6EHNiXo
X-Google-Smtp-Source: AGHT+IFYophTFBfoBk+6EWJfbHdMU/Z8k+vo558UaGYrCpc1xC8rg6vdLxD4hv17xkKSTLflQi8oDw==
X-Received: by 2002:a05:6000:1786:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-39d87cdbdbemr1553050f8f.50.1744189004914;
        Wed, 09 Apr 2025 01:56:44 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572bb2sm9102605e9.29.2025.04.09.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:56:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 10:56:42 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michael Rubin <matchstick@neverthere.org>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Patch v1 01/21] staging: gpib: Using struct
 gpib_board_type_ioctl
Message-ID: <Z_Y2Sg1tDok_MX6u@egonzo>
References: <20250409055903.321438-1-matchstick@neverthere.org>
 <20250409055903.321438-2-matchstick@neverthere.org>
 <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>

On Wed, Apr 09, 2025 at 11:10:41AM +0300, Dan Carpenter wrote:
> On Wed, Apr 09, 2025 at 05:58:43AM +0000, Michael Rubin wrote:
> > diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > index 6202865278ea..4ddcbc2a81b0 100644
> > --- a/drivers/staging/gpib/uapi/gpib_ioctl.h
> > +++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > @@ -12,9 +12,9 @@
> >  
> >  #define GPIB_CODE 160
> >  
> > -typedef struct {
> > +struct gpib_board_type_ioctl {
> >  	char name[100];
> > -} board_type_ioctl_t;
> > +};
> 
> This breaks user API so now user space can't compile.  I don't think
> any of these 21 patches can be applied.
>
> regards,
> dan carpenter
> 
 
These patches are OK. I will make a new release of the userspace libraries
with a compat include that defines the typedefs.
cheers,
-Dave

