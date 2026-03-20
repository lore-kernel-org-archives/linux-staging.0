Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08D37266E
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995118; cv=none; b=RmBzglu/MGhrIWMK4eo+LGqZufw0cGfue38QP3Fk8sAItMW3toSUjkmcufwDIx8vM75sgdCQ9wMNkj0/b8/DgqzvrtlWW33PAEuTLm0ydlDYGjQLOtJuieNMfHNUFQXqn6t7pwGuyq98xYkjlDBSygKRhVbgvwdYoEnHqBa6HsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995118; c=relaxed/simple;
	bh=ETxHLTtQBm6y1r6sVOgxp6YwAsxlxHWNwtLfx6ol3E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUSmY8wQLbtyW/eq2ZW5bBY/bXBFY32XVqLEoMu9C+o2SKIU76FqXwCz3enH/WjuIQibPB7R2wg7dbErMZuGysoFmeWfrp6AA1pmWztZfbNUNjaka5skxpZU7k9whxnsdBi/v3SMXTCaviezw0Ubi84tvovqz7HmKBV5CtXHP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXatYaZh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXatYaZh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso15138385e9.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773995115; x=1774599915; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXe4wYyKfFzpk6TVmPReLrQYnPcsfVJ9fQdZfLvuACk=;
        b=BXatYaZhJ7y/BOBt7LiJaLuQNKf+WJs5vDVNCtS1NcFRPAR8csewmCRbGAnGmtDaM2
         yxW49ytjf/hoovJmDQnkoXAWC4Ypw6DweVtjuOmiLk0pbCVhveZXGeee5NwcBksOZKfe
         DEma6uq9CJwZx2XVS/RX6jnR92zvCtYtFZn5LlVUpzZQQmo0QANH1xEkP5WmkvqOK1I+
         6d54loxlk4p8/seceg6oLIAc2WwbqM+Oh9ui7MmNBfDyNg+UkXd9BTFWjZ+m79hUm2up
         bB0v4NIHPhNGv6+NE8J4MVc19XObxRcvSp8vBpH1VsnrIZCxyH+QP3IPccoeTfDuKaEw
         8trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995115; x=1774599915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXe4wYyKfFzpk6TVmPReLrQYnPcsfVJ9fQdZfLvuACk=;
        b=GE6WNeUJROey/ryxqIV47FA5t7/nIkZeKb4feZXnVcctWOttr7ePSM1j0ga8MW8TvV
         Kx8BpGqBrUGaYRYNHggVVChdX3SADCyJHwjwwYRS+IvS1JtM34RyMrL6k7G9TnKJuLCs
         C5BmiAbBwvY6sTneg4tpGBYmhNB+lWrari1t0qyP6jafBVCXrfOpf6ELCbXv/UvuC0LI
         Pm/zvu0ian90RZpeCqsUJYmbeGW3kjhlvMFC3oDqk8BTejTN/5Jk4S6UOrB0zLXeid/s
         aOjyS9ZbEEXIr6Bd89j6pEkQnzlpC8bJknuYL/bof9h2jRjTH5dzrF9DPyXgXrt9ucuz
         hFYg==
X-Forwarded-Encrypted: i=1; AJvYcCXrT2aISqNKO3gFIJyShxYo+isSXYLYdCa5AV90BrnLK8n9Ymq7grwlujabC4y2zC/W9j1GRJycqOh2JTm4@lists.linux.dev
X-Gm-Message-State: AOJu0YxBAp6veC4SeclaS2uF8P9Uiu0YS6CwpOHc8zMb+iL4Fhv2lESl
	ctfRkFzlaJsgqiAhOBYQC3XiCN8x6/ssQKAahJzPZct8mk6mG8Le9R7DRGNqbkXkbao=
X-Gm-Gg: ATEYQzyoBFAxPTZQR3RicBAix93ZUI1gfqnNoy6BPOC3brebDnjFGs9wFiD2Oz9H4OY
	wBKk+nZxcLJ4MpBSWGl+6NeFBt8jIHvFTDZR48T3fA53GioFfBtFrq07VE96O/S92LiggrCPcCs
	F9sifK03IR14gKLM3yG5b0vVu5bEHMsQYy8ni2szp+c1jOK5Z5BlmmO40AhxhBISOofUdKg7P5o
	yiDUJKlZP0RXElEfuwRos5qKi0BdUOt42+zx/lums4ckm310qW0nRtc1UP7R/7GadsTILa7+a+h
	LBXYBGGijo7HLVQ/KJU27WqwLFTv7LVI1d7vi+ezritWo6mKHbwFBbZNvZs/+ftR9Bs+FD9jKcC
	pEK8yfz9EFC7HBsbINPEO0D33sL0hIrJqVoTVicjdXCIPSHNQyRZjV55WHHfLGuZGkbA0U3X4fQ
	Uu75EuZukQ7oCs1jd+R0+ulqyIPA3B
X-Received: by 2002:a05:600c:620f:b0:485:3a03:ced1 with SMTP id 5b1f17b1804b1-486ff037753mr31713825e9.28.1773995114916;
        Fri, 20 Mar 2026 01:25:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm78787365e9.0.2026.03.20.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:25:14 -0700 (PDT)
Date: Fri, 20 Mar 2026 11:25:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	andriy.shevchenko@linux.intel.com, ethantidmore06@gmail.com,
	hansg@kernel.org, Yeking@red54.com, rayfraytech@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove copy function
Message-ID: <ab0EZqOr_90cd0pk@stanley.mountain>
References: <20260320071830.28713-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320071830.28713-2-b9788213@gmail.com>

On Fri, Mar 20, 2026 at 10:18:31AM +0300, Bera Yüzlü wrote:
> GetU1ByteIntegerFromStringInDecimal() is a copy of kstrtou8().
> Remove its usages to kstrtou8() and check the return value.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

