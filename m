Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D54503B
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752850411; cv=none; b=sv0im/I4BmFCdYPYgNAoMMh9i6fhuR3jc1EZ8cZsZ4d2DWhmRqUD5OKPoSOXdir0VeMJKqtBNtFvuFb1y4V9qlTIP3fvAkUYtLGU0dOzJFiLIQW9Tl4llRtMAhVnykaq9TJfNa5t+tzpfPNmzrGGcFCAKikEh9G7EOhCEGs4c+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752850411; c=relaxed/simple;
	bh=C4j1W7PuydHxpWCrJnq+RnTeRRJNesJnNoj0JHTHqfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvjQgIgvlXrGAQfYo07cvK7vHsuJ3ozs6eraLRR2PzV/iH+X7poHkRVvU6HDGr/LGKwNww993QcIclxZaiazpqOs5U1Z9BYpnaxwb3Ot5hew07y+vSRhRznJaUx2aNFdxstFf2GRIdB/BWgjuagdZOdELSGC69deSQ/6yGm5/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMGvnS9X; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMGvnS9X"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ffa81b41d7so740570fac.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752850408; x=1753455208; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDgeBH2oH/qESW6dpF6eUk0T2Y4Sci3Ik9kvwkFXKJM=;
        b=DMGvnS9Xqydw+BEuI8m1Tnrxy/PbkxqiN4n528VCO4QMJ49z61NV+l27Iu4R2dRFoL
         BKOrqjbKcypvZKfWCJAGoGjD/dO1Y0T3A2yP9RN7GEKvbmo+50cRLOewmAM27+h3ffF1
         PWmO8u3Ix3HpN9q3Tze+Gr+iO6hYj5HBfMjLU9yaUmICWzlVwTqq9j0NBuzkkmgkcmXj
         QNhE08bnOT2/beKSFGAIjCpWDmAMtiN/kifCe9CAuZp5AEKCSG4KhHebGqd598wQeepK
         /j3Y7CLHnNz7jTjD8LsOzr4P14jxdIVp0DqNPZMDhZCYcFDIEgA3TiEt4wCsD07NQOOA
         ULQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850408; x=1753455208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDgeBH2oH/qESW6dpF6eUk0T2Y4Sci3Ik9kvwkFXKJM=;
        b=X9T85QhDWmoRgDnlUatliIcTqlH4eTjDMzo+Msq+STjN0iRG3/BZ1Amq7Ia4qJv9n5
         IOGIxh0zmyIEH3LRLr6rxc7fh8JMueEnBPlG1MNM3CCqTCsLqRMoD1rRVzTFKzo9L49F
         OADwPFJ/Tn+Xv8WE4s8OvJZyOW5rGR+PdDvVO6RNDjyN/uGB9xs2bCEtiduEJWyH25xi
         r+4NgrZ4QLEhF85DkXIL7wUeemlekUfwR2wQY1RrU+6y8gU2kpFIq4g8/CF3JvVELgUc
         iH4R4bBYtPlqq3DMawCVEwaVoCl0kAU7QC6OH6MMae+x/rI+px6NPElT/tyiLo7SBNyr
         5A5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqHp525Bks1WvM+sTYiNwGMH+WQEQKd6gyRqEwmHAEAEx48xlqpyMgGthGszmQAJfoRoqK4nwsWhcn+h08@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7WkW91XR+LlGi7hRvVGrxlRUBBYU3ngh+po7Me2Gzy2Hfq9Fx
	CAQkzE3SicocM6iLMm3Aubu3Vp740+6R2TzCdRSmUkz3nGn0zR+M44djy1LhWWMUb3w=
X-Gm-Gg: ASbGncuu/8Vl9MXRK9EmkNz1v/ciT0mVCFPUxAolO3BXMn2ryS2MQ9F9k7Qfn7OeXI9
	MGZ+nIQ4+mrVhuqH9YNBG4GRPReO8iyvzC6bgUMw+uZRGviWpkQ/TfRc1Me6UkwJuEDCPw1NxVZ
	IKOjtpV4JPUb6PHaDyByxayi5UPc9idVrJmz8CLgXvOXGCsfX92T0TIF3RF/ygQHKGJ5LKlZUQr
	a9lcWicbuje+wVbFhwAzGY8jtkk5MCsq+wJP3lxWxaz2SaJuc5mLvUWY+KZxQUDonUESUSg8vRv
	XHHD2eM4NRPrIUT+XHRKpSJa6vZHszC4VxWnPgySZNNZBUhAGCESTH6olMXNe3nupI8L/rzuORx
	WUKyO64PHNLZTW5gZHz9bGmG+kxd6Bg==
X-Google-Smtp-Source: AGHT+IGPhzFCHREIPi0nFXZL9YZJzmn64Udn2fqdwHgXC4Arvxph+F5Rddp6XkQErVZSyQoiAvgKSw==
X-Received: by 2002:a05:6870:7886:b0:2d9:3868:b310 with SMTP id 586e51a60fabf-2ffaf2a2ad9mr8519060fac.11.1752850407866;
        Fri, 18 Jul 2025 07:53:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83605aeasm676624a34.16.2025.07.18.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:53:27 -0700 (PDT)
Date: Fri, 18 Jul 2025 17:53:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: sm750fb: make const arrays static const
 char * const
Message-ID: <aa4a160b-1f0d-4983-8532-bd22214d7114@suswa.mountain>
References: <20250718034913.49300-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718034913.49300-1-ignacio.pena87@gmail.com>

On Thu, Jul 17, 2025 at 11:49:13PM -0400, Ignacio Peña wrote:
> Fix checkpatch warning:
> "WARNING: static const char * array should probably be
>  static const char * const"
> 
> This makes both the array and its contents immutable, which is the
> intended behavior for these constant string arrays:
> - g_fbmode: array of framebuffer mode strings
> - fixId: array of framebuffer device names
> 
> Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>

This is a v2 patch.  On the first version of this patch I told you
that it breaks the build.  So I guess now you're trying to fix it
by making fixId const as well?  It's unclear.

Anyway, it still breaks the build.

regards,
dan carpenter

