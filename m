Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A719AD5C
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620834; cv=none; b=fwZZuBn9LaqYZUb7YlDx7Wl1GtYTcqfJXbh0C5uhEwY7Du1XSAn9B/q2WnUdZtj3Gen+VErtnwnKdQlcswEIwXupVSLYL3MEv4ncky3sxOTXlFBKGv+0xID9Bw6IN0KFBHApLuPRIIegildOF9taatpeN8udOBpJEDiEJpBWJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620834; c=relaxed/simple;
	bh=TdwRQ8hBs8RNJ0rWvmW48ICtfaJmKpknY8G8u7R1u/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXNjiQ4/s9MpsRulTW39t71zomaySmDRboU0TKY9DXpq9vbJFYqEAVmhrbfZ1994Tdb1JGHgL+crePQ7JTUjP/avVFpJ6OtjDmtl1fCpSap8MPLRvgMmraNLgGlMRy1KgmfJkkz2ELxiogZ+eGWbmdy9YShxtjsU9yxGjyLE79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UB1fMeO4; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UB1fMeO4"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2f77591f208so198465fac.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620831; x=1753225631; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8/xCeqyZt2wmgn8IDHS3lAPNn8HdJhxhAcP0TpDRFQ=;
        b=UB1fMeO463AElXV08ydT2UXrXkbLgP1JoMS5ze00mReEsbk9X2qi3p0iN7Gc+MRNTA
         JHb8wBFVwvjD53RnCB1fbyk7/eD+6/CiU0+DpELuW98WGEurOHiVuQpbg89i12WzGDqm
         j61tHer/4S8dzOPNl6vDVpPD1zycj8Murav6vxHIhXOFipbNqKYfRr5bWfw64o+bJ445
         YiVoWYCN42ktZq4/iCtlaj8OQzPLNQmvSeQOzpxpGDHwYJU/jDsnOCPGD0IdjbaD+G5b
         mU8UYtrhh0jlhDoir/RezEaBwa+zwoSYxyVUkeHVJe1eNXpNuG+Lhun7MUwEmGNNhnAR
         r95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620831; x=1753225631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/xCeqyZt2wmgn8IDHS3lAPNn8HdJhxhAcP0TpDRFQ=;
        b=elvYWprqsk7HQnWzYs4S+QaQoVmd6EApAC9UFXKQBaq4NUQh78/wOIMD7cdtXvy1LD
         hyNtCKddLwKaxT7YIgk5P6fF3WLKcNDPKRS1ayAc0rgEJjbdG7T400u4NeCThxWSsrqU
         e8YQLA1p6rGBkYY5IUKT7jdtKoFf1Zdsni8eDcST8g28NdjrlnSGiE/4FiHxZs3uomtY
         nx4oS9xqIBNpllWA/XdtvVSQHJ2VB5uQRLw8D6Jdt3WT/doZ0lMY88O/jkS25LpJ/Den
         Mzpne51r0PNb3FFCjdoh/OP5a/CXHJZkqfsPCTbEIFW8npTi62Araz3Li9HDRIVFXUJs
         buew==
X-Forwarded-Encrypted: i=1; AJvYcCWRJpCLnabCMLjOFJxleMu+Jmg/1TbSvFxcYwpKpZYVHIv+HRLCMUhZyZfUopiTnM6nBC2mqv8LnaoUziXN@lists.linux.dev
X-Gm-Message-State: AOJu0YzD+PEj/HJhfx/TVIbzuWvntEKrI6wmjkxK6KAJuVR5GRQMBM/+
	8kXfQhEfnpPz2Vti/mIZzzhHdO7FG3kXt0kihvfglU5e1LiorYc3u2nx46bi1KJjA3KjNr8oavm
	o4Dsl
X-Gm-Gg: ASbGncv2qUuUR+B2VuDPXb55EL5Tfk+AMjfW/kPEzHm7NGIVRjHZn1KZdIua4GzYKiu
	7tS3OACzNFUy1ehqvLWUClD07LJxXBGzMpqmoHmxs5InDl+rQwhUjDFnLnR88lqlCqRtJDhX9II
	IxHW1OwKTiFmQpWM1BTTTZmP8LuNa2CqkuAd5SjMsqbGF7pBv87r6v0nPS8gyLbUsvYRz7uMPeS
	zD00Y5FGLaTa30fJBNQ0n8kxgJv16enHojbglVFXvpDTOw3M1fOR5/UFRVHp/wmmOzp8rOMSQ6v
	FLRkgijXwsAc7UhvpA2F749xwCd66b4EpnuB5J9yOzviMVANfmo41boWJKD7DFs2AqeCxeKo8ic
	SjOD3acvvKx3bfrDPnjKiT4f9h2R3
X-Google-Smtp-Source: AGHT+IH6Iw8x0Ssmy6W7B2jmVJ1SqRlf9P0FregO7tqkNLu6G0HHdGAJ2aG2ptJl+JKWDH/D9aKSFQ==
X-Received: by 2002:a05:6870:3c1b:b0:2eb:9fe5:d06c with SMTP id 586e51a60fabf-2ffb09a5173mr834588fac.3.1752620831387;
        Tue, 15 Jul 2025 16:07:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a172:6205:b5e:43cb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d3541sm3036132fac.35.2025.07.15.16.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:07:10 -0700 (PDT)
Date: Wed, 16 Jul 2025 02:07:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ana Oliveira <anac.amplar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: remove blank line before
 close brace '}'
Message-ID: <588099c8-98a6-4d89-b638-479c7ee1ca07@suswa.mountain>
References: <20250715112513.4541-1-anac.amplar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112513.4541-1-anac.amplar@gmail.com>

On Tue, Jul 15, 2025 at 08:25:13AM -0300, Ana Oliveira wrote:
> Fix checkpatch error "CHECK: Blank lines aren't necessary before
> a close brace '}'" in sdio_ops_linux.c:309.
> 
> Signed-off-by: Ana Oliveira <anac.amplar@gmail.com>
> 
> ---
> 
> Hey, this is my first patch, I appreciate any feedback, thanks
> ---

Looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

