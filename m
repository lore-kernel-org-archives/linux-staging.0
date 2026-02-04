Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003373B95EE
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203873; cv=none; b=q9P2mJLdVZwwTywKG/9TahAiSkaKDWV/+0aQtHe5YDmcAmaCF1+MFrDGm+i6EFgNWapW290c3xo+SCjaYFbg73u706XnhOUuj1mCk+hZhx+yKWk6Z44pCd91B/+m5WZC4yBSlfoui2tLOZGm0cbQp8R5udSnjQWzlyrjKykHp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203873; c=relaxed/simple;
	bh=Zji1aowwvPlJLqP6BI0P+FkJJDk9vJBweSVoQnsBEb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeqAAraeoG/jU2UMj5GWEj5ULnEc5YTRGhNERTUS3YCVgfx7HCQ7dSOm+dCDfXwSBg+5ATZFqPcChjtcFDKPRv57y4BOXZto2jh1tRvhiRgS4/5whj8ccnAqxMP/aaljsD73fOwMVUyeOa5sUuQtl15KKcB64WSrEZ9HaYAXdTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZ4MFRnL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZ4MFRnL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so72333105e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770203871; x=1770808671; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbXz44JPj7P+j9kt1fdw7OHDtXzyxP/if5Dyd2KDXL4=;
        b=oZ4MFRnL33Z4aOfi0S6QhKW1sKCAHkWsvZVBaTPPZzUw3HHmFBvx4iLYWcWuz6O3g0
         CvkY6xCjYqBaESeDep58gUwT7NfBRIzCJ3ZTHn07nCwXzg5llX/xoE4loZkW/5eTDN3Z
         fZS/KW2p2917vEvyfyNYFvx49NdH0WY/Rg+2d0HcW9r0vDAwJCT3nFn7eYOwtRFykLdk
         AQp5Lwj6yObXdLH81rONjxMUomu9jirrTeO1ZOZF2ESoFVBlj+Q9k0XAdGdGrhea+Ta+
         neCPhCSlRfKSP38VFa1MjP07qM7Rq2TMF+UL51p35JNSBQgNVQpMtlJF14PBQ3S87ZZL
         dNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203871; x=1770808671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbXz44JPj7P+j9kt1fdw7OHDtXzyxP/if5Dyd2KDXL4=;
        b=GeSdLkW/2CbVp9N0WeqvNnYHNPCv88xyqJVCqM8My1ALHH+7PcT4RZSd8/I43oK0H/
         qQ/uqaIQOJUklYBmqL6QXweSmpJjOVvziHXzarlKLEwl5SZZXqk5yU0PJXbMg7VbIyNm
         QO1o3GpQZlyTzd4HfhleFiIPi9rUhDf/MEam7hEvbxWFyVJaguV7+OJ6TM1KLiu3utiP
         19xCHDk3UBxp2pCCx+46ex5VKAP9Wxq3Du6+iXHt8Xasb89jFklkwsCRIc6ktn5Jpr6v
         KF4Ue6v/X5PVbW5sNkQxdd6WdJZ/2xqIp8WsQHOosrOeuvelLAW+7wfNt7WnAxdnevWw
         C1rw==
X-Forwarded-Encrypted: i=1; AJvYcCXoLIlGCbIjQwscyUCphdwcGnuZsJf1QX4m/0QTAjRJwGBawf+zgHZUzn0EhUAPQdEYcRcF2K6/CatSJXcF@lists.linux.dev
X-Gm-Message-State: AOJu0YwyrgIeGeEJCWguGHHxI3IUleE/PtRNS4eiOE2iKUyhRFwNwvKi
	3auIciG5WtPrE05nZIPctKocnjP9B+awDeCfWyfhOWpRT8xa6sUCVDSSUiRGCMdzy5A=
X-Gm-Gg: AZuq6aIYo2nl+uxp2N8KBtoj7mr3OZhYm6MzPgeDef1U4OOkCk8Y7RjwYOZPyt6Fmqy
	WwXwqlIE9eUowcTMmP6dXjTZyzAYIuUssOxOBIvdRw204uWW1QReaLErFVDuYjaDyk/CzGouaDf
	J+Q8ryZBRM2HoKfkV2LDLfnoz0jeCt7r5vPM2+LJj74fo7Smwl6M2LJpPEHJAI8CWVyk47tpPDi
	9oKElVk3RDzi8wz5MM/Q17vtbbxAZ9VyDPSQBzlXd5Tbk5ohNIaaA0i3TUrgQqLd2rxIxweHkTf
	05zq6MgIyDRGQrXMw47tXnQicWJf86XoSeM9O73VYeCCMMsDE+9wTeUcrJImVbbQa7A3jUbZ1cr
	WQ7LnId2zkxEtEQXDl8ZuzgNVk0S6jEVFmXYnEblCt46kIhqd2NhCLVEjFtIeBi4X3kfN/UKgo2
	+jwEIpRjum/R8syIyF
X-Received: by 2002:a05:6000:250c:b0:435:9ea8:8b83 with SMTP id ffacd0b85a97d-43617e41075mr3937187f8f.19.1770203871213;
        Wed, 04 Feb 2026 03:17:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f9esm4855601f8f.28.2026.02.04.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:17:50 -0800 (PST)
Date: Wed, 4 Feb 2026 14:17:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] staging: sm750fb: remove debug prints and convert
 logging in sm750.c
Message-ID: <aYMq2_W4IxRWhKgL@stanley.mountain>
References: <20260204101536.3311-1-iprintercanon@gmail.com>
 <20260204101536.3311-3-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204101536.3311-3-iprintercanon@gmail.com>

On Wed, Feb 04, 2026 at 10:15:35AM +0000, Artem Lytkin wrote:
> Remove debug prints disguised as pr_info that dump internal variable
> values, pointer addresses, and structure contents. Convert remaining
> meaningful pr_err and pr_warn calls to dev_err and dev_warn where
> device context is available.

I feel like you should delete things as a separate step.  It makes it
slightly easier to think about.

It's really a no brainer to delete all the pr_info() stuff.  I don't
really have a problem deleting the debug code as well, but that's a
slightly more involved question because it doesn't really hurt anyone.
I guess no one will complain.  Greg tends to be a fan of deleting stuff
as well.

regards,
dan carpenter

