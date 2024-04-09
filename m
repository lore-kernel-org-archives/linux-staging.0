Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0AB80043
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712664959; cv=none; b=LyB8/COEr+RokQO4ukDFnsdoYhFr8ukH4Q3XVfbpiRtZl/Zgabx80srmRGtoLsweK11TLqHYWWEM+ZJ85/NYLtlsPuSXj0XJjy2j7CLHHQsuoErCFkTwHIsEWYJa0DxF/mda5eqhYF8rFETCqkv2icxHrY9wVCENvmlhfsn08Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712664959; c=relaxed/simple;
	bh=yPd81M+1NfZphw3W4cYk6nOj1ArNbzmhlNz4HC9gqq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGoX31msrbAtJv2HOO4JezJjmSEYAe8T5wt3zi5D4NIdfFdwnmL2jon38D4SQIkL7GEh6RKMlHpLuYool1hy9DcHSw0d6e+NOwwcGPQsKVnVuA+uPSTghWiXIP902nNX9ibcQ3hdZawWi6yh4AkiBqVbZZLqxjzeuz8b6zvFBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dImAX0sz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dImAX0sz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a450bedffdfso779490266b.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712664956; x=1713269756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2a7zpSCWKKDFCFWBoP14IB+FQzIYEADjjepMzBJTyI=;
        b=dImAX0szy3e4GUoLFaasVQj8aYDZ7JiFpcyi8zktzdVJvYJnY6Dr1V2XkIl6opGZoc
         ev68TKJOoMFlKB2HV/2mA+IyWQUJ2EW4MSPmk59cOS9FprySYF2mFPGipusERt0UIrlt
         0G5aTCTIeqLsBdiAJPXloi3kb3XmCmb9CMLyoRNXxNHy9J8uRtnIoREowWpgY7ruA1hV
         iyimbhl8LqkmXEanYoVj69y1WjanyWIF3hJJvzl8NoTylQseiY+gAxt3nFgWPvLFAj16
         3yrqrj/l3mmFt+lcwRLu5UCiXWJMwRjxvGtMgbnlHWaZtEEN4CNbW5ayYhUnRTR+yi45
         37rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712664956; x=1713269756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2a7zpSCWKKDFCFWBoP14IB+FQzIYEADjjepMzBJTyI=;
        b=Vfg0Q9SHVXkEpUTYbwO7S5Mlky7sLs3f2a2UYd9QWsQZEpqWhFshkX3RI3tM2EQxDz
         QHNJvO3ltxB9xdTdPk5hF2mFngPVo9RHOPDt5q0lmTxphqVBngUsC/EdckrO7Y2D2wgu
         7NXngRzrKG7vvE6R9mQSce58pkUnADxmpVsZsWtnFTGI23mHEbzoKp3XAAg69VBTLSHv
         JckJrlHUrnTummGGXFTNQaLl1r6VYaOD015whn2a8YdcbnsuvkCLZN/ICkxqopqGE4R8
         AOyh/VtBcwfGEeJZrqfj7m6uR+SROgNuzKjK3mCvqfRpSCG3j3/RjbFbEhQWGK3tiX3B
         MyIA==
X-Forwarded-Encrypted: i=1; AJvYcCWrMtxdBKpOLwRZ2bWgn1hKcnBYbr8gO1RG1F4WQ4LuAMqqRNcfezsbRUO8J2CGrDi0akwQu29TtZ+eBvHiwlzdl/smiLnrXDReNdbVBg==
X-Gm-Message-State: AOJu0YxHu5bxJGAxlycDXE6okQGkQ6GQcMS84Ai21528+qulvnoEf3P0
	Zz96zT9ugUUsGhkAZtkGazwbM+/Ydqnr71FIAGh5vuP7MKCdpxdLqrrnC+ffzec=
X-Google-Smtp-Source: AGHT+IFE/zCvPySd/Jt/cqVeIJgBn1agejVAFKR8x0SZSzXrJnJAe+FV3CiGMlIqGDswtrhwFrIX8A==
X-Received: by 2002:a17:907:96a8:b0:a51:904a:e3ca with SMTP id hd40-20020a17090796a800b00a51904ae3camr9982209ejc.30.1712664955960;
        Tue, 09 Apr 2024 05:15:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gv18-20020a170906f11200b00a4e1a9e1ab4sm5632229ejb.157.2024.04.09.05.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:15:55 -0700 (PDT)
Date: Tue, 9 Apr 2024 15:15:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: topcat <bfonseca@ime.usp.br>
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	topcat <bfonseca@ipt.br>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed spelling mistake
Message-ID: <1204e94a-d061-41eb-984a-86a29991637f@moroto.mountain>
References: <20240409114045.13872-1-bfonseca@ipt.br>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409114045.13872-1-bfonseca@ipt.br>

1) Fix your From header.  Use your real name like signing a legal
   document.
2) Use the subsystem prefix in the subject
3) Add a commit message
4) Add a Signed-off-by-line
5) Run scripts/checkpatch.pl on your patch

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

