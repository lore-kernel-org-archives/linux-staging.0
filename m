Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F63A1CD
	for <linux-staging@lists.linux.dev>; Fri, 10 Jan 2025 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736486353; cv=none; b=F7CcJIbVwgeF8RnnWFbkt3EngtNYak10U6Butin0xeajX1+vizNC+ZNXvwdM4OhGAjTkN3/ZnbkrL+yWMnYxfIvKtCTllnY6SGXI/bun5zyesKtsKyGcISUYnqDTKDg+H/mOaxvQpE5az1CT6SGVVVNo2eVJZKyAsCLbJf1de2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736486353; c=relaxed/simple;
	bh=2X/kxAsU/EyHkXBri3qLmTwJtil4keIetY+On50i9PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5iv5hT5Gzw/3keZc0B+OjDbx6rHbCsgI7qNVAlS0wM1N3h7/kx6snQ39HMzHRvfu7kxX47j6FzmZnCc/5bdzZE8rCIUtPFKnIRWNo/rzXZXoj26/kYMyxUfl3qUu5/ezzuPTu3v0wBLGgn+ArWpDcdquKcnaxP73Ilx1KYLzK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVcWJniI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVcWJniI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38634c35129so1274035f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Jan 2025 21:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736486350; x=1737091150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8oFCFTcdHEhg96BatYJh9NcnlKO0jWzxRR2awIuIyI=;
        b=nVcWJniIXFIKt6EjXORdtUTNBHIepivQpCDKJ3uM5WYAC/Cv5jQhJipcTTEC1oxvyv
         zUq2+04ljpvLsrHPeCl8mk1CcrhOIS3KRYyluvZjuLwd8CpivLYQTcTudikkLUnCKBaC
         TX6CWXGlHuniapJYhAxL51Weo6oOUwzhR5x1PNc+zhhWXgJPMt9Uvo6Q51uqhvseCun0
         wEQqiFs7t1cUqS84aM08gS9aPyEVanekemAlmaG0kf7e+lPVD8h+mTJ6wKRTCEF8t7Ue
         kfAejcOF0v7kUF2Oz+3o1pAOhi0YmRxx4Ogif2ygmJDRQ8qGbtjQUpsgMGSiQ8H/N8KN
         WQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736486350; x=1737091150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8oFCFTcdHEhg96BatYJh9NcnlKO0jWzxRR2awIuIyI=;
        b=lWClfSbAPfMOiaJB1gz98QvkBybxGjvtVfWDwGMoxJ4Dn8aK/ble2WUjQNTJc4iAOy
         8bMb780cpwun3slK2//8lm1oeBqEQHNrryKc61pxFqp3d2IHjMGEWH4Mql+ptsYjthzw
         Vvr8szS9w3T762OfajSpqXfHH3O+QajxfC3SjNEo8a5J/D6Bc78IWrqW3cFxR7yM4UGA
         9pidVT5bIg7dI3iKf5adRXkhkxMpXUdYvTPQzhISDRnkzBrYuAKWdnNf9svMm4I3xn9a
         Sn4KaRFpvRyZpCz9chokfnnCzks3u2Ex6yK628KghNzaUaBiqBypefKFc86QYktEbSBb
         YlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd0r1ipq/TT6Teq+xrV9Un1TEvHRwgwD58iEKUaq7ZhYWMsFhVRscpjX0Os7le3nN72xHCai44n9ZicV55@lists.linux.dev
X-Gm-Message-State: AOJu0Ywguto8ximjpiEWmohBurhqe2u+mPNwhEW+QgHvqG3XClW73Yby
	Dr0V5qclL8pG5bxY2EXbfKdKz4tVQlGFOlKXCojqjppv/D/PBeX3cZZCN4nSZhw=
X-Gm-Gg: ASbGncvKf9/KsWWE50JEO/YTfeaKiIOD+CPt6QeROSVNDIN4wS0CJ3GVMTL5gfx/xtX
	cAjuyChMCHkr/yNm1Mi5JZ/iyYZn3YUvhjtGSAN/JAI3w6t1Nkh6ejofSglhjRdVVKf36Mpis3F
	1NzdLBQpgahmAztoj/WgPFOgpNYBxDV+O3Y+eDQFYnuyw/3OcLbizh9K2o4ReiqjD34JRjjTHyg
	ExHu6TJeQDTiZvTMapl4YFaWWw5wpW24bXunF2BdPwc9YKOmEqgloX4OjD7bQ==
X-Google-Smtp-Source: AGHT+IHMCkbQBlQceQ3npmj42h3FEXM07zH0jCBmrSejpOKnGPWBb2xUuL0eJDxg3rk0BrBKGy4+pA==
X-Received: by 2002:a05:6000:1445:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-38a8730ce5amr8622583f8f.25.1736486350419;
        Thu, 09 Jan 2025 21:19:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b7f79sm3539076f8f.69.2025.01.09.21.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 21:19:09 -0800 (PST)
Date: Fri, 10 Jan 2025 08:19:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Remove commented-out debug code (v4)
Message-ID: <3f977faf-12ea-4f10-8771-1985eb65a59f@stanley.mountain>
References: <20250109231509.32810-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109231509.32810-1-salwansandeep5@gmail.com>

On Thu, Jan 09, 2025 at 06:15:09PM -0500, Sandeep Salwan wrote:
> Code cleanup. This code has some debug code which is commented out.
> Delete it.
> 
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
> ---
> v4: fix title description

Close.  The v4 in the subject has to go inside the square brackets.
That way it won't be included in the permanent git log.

[PATCH v4] staging: gpib: Remove commented-out debug code

Please send a v5.

regards,
dan carpenter

