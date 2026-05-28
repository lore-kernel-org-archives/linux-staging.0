Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3ED31F99A
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953426; cv=none; b=CmnDMCZquGIBWJGdNRQkWkIyZwbY4Gm0DAqPEseMdXL+C0bh3Rgay3r8zgTRjGJ80orPFQaQg3Ky8s5ACFa8JYxQm44cUyc6hODbvKcPmPH1ayA8M8XRxCUR/bTEgWmbrlPxqeXhKWGsuFwLouShRIVD1QcykMVIIaHe84Rt1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953426; c=relaxed/simple;
	bh=zJiejorxc9hbXeOQMqz4/Z7l9LfvKtYMkzDoqFvR48w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BB2ZRGxVTHS/zYbkEyHX/OFygKRsZsy8Q8wDugBJ45vzhsEHT5cM1f8ovalg96P3PkkVPvaoZFZqNRMd61b3Jv8jhyh72abp483UCdO7C7P3qnG/M3+q8rF/GfhIN87vn2DkP+mOIulxOyePqjHcvrP4LfIV48A4C58YBHeBQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9cBwQFE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9cBwQFE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3927173f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953423; x=1780558223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqLb4I3vY1tjULmOl/LkKCXIPPHEkCsfo9G3pGb0IEo=;
        b=N9cBwQFEuJ0GiMCH9wzO0EMbhIMxPLyo2qlkmHvgU2KvuWfdDnxxSnpJijd4cUURXD
         osExOUAI8xOjI9qzFdb/2u8keO2t/IbC7DisQwZ/TxzYdxOqpMJjyPgX+PQ1AtvCFVmd
         VrHxjURC361tRal8Njk8BvkdL6S+mraA0friztqyrP49RuGFGCXXJxvGZ/r4fFAD3aGK
         g/iV9aSlncXnBQLvgNxmBeU3Stn3WyhldipXH7EGmuJW6hGuIqR12RFMWTnWASAkrlqT
         DmjFs3TpQiT6BmUKqmUOb4tKxI+3eYHH/mgimJrcUV16fL0SPsuSiN6KJsZVh3TgFQV3
         74ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953423; x=1780558223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqLb4I3vY1tjULmOl/LkKCXIPPHEkCsfo9G3pGb0IEo=;
        b=YSgwll8NzQrHK7gNEHg9RCnxut1+RzwTFECwacE8/G0BRFGb09594ZbJzEFp8oMMp3
         5gCtl+YOzgHqjur3tw1mLbu5osYMpV938gthj1/FtwyFli1hg3zZO+Y6r+e7i16u48tT
         aFlch8efuHjbco1CLglQcrggD+KBy7ZUluhqt3+Ze5A0I4GPHU+W0uyZ3vhEpZcGZHwj
         6k0Hm+cg059LeFGR8lJNWfQ+yPPfHQkqboSFrjV3bAn4vQohro123Ep3NBOse9hH8oJu
         0p70kydvC7RZABY7J7eM0Y68618yfbbmweRvHWOQDBtdUlJRg7F1rqptmZUwHA/72Y8d
         j1oQ==
X-Forwarded-Encrypted: i=1; AFNElJ86QsrbWI+EfqERBHOIDZn7k+Qqb1rz1qUHBFTSqHC4dyydvW2WPSNrPzdIwlpbUDOX/Bp0c+I5oMx+Auje@lists.linux.dev
X-Gm-Message-State: AOJu0YwON8WQZw1KaL+5X2UqZ70pRI/cFm8N6P9bHPs5ubRn3x2rGVs8
	/LFosXH9kH0qeApUBpAFwPgwBGtdeumubuqbMxdaIATLOLuMQGJutRQa
X-Gm-Gg: Acq92OHUz6VvQJwI/JHhSXE4hFVaRN6aa8OfxnOYZTcd0ruzvcd+V2NUmynIUZ6s0YZ
	8GD+TF3/Fcdc8FVN639QWYh8S9Zgh+l9vWjyr4MeMrc5JNs+4pwTPE4SxSBVQNsx7zD/5Aqa4X9
	GGsPXHYtTkcsxx5f0g1a2clMXQzTrM3KKck1Gj799vC3J/hU10W344RAHqzHwdFCXXJJGs7RNAy
	LZNGxl/6ZqTEer3dfqMI3ExrNSPa45MOk2sIHIkOkf3aH8AV8sJ8VAh8uhygpacL5EcKlQFI40V
	3LJwZWn9d1ywaVf9lk9zhwCvwW5d7MPmmQxxZIcLibvwOXazp+Kony4IH5BuqAnilLSudpGbFFD
	E5ICVOUcV+J6/fGCHkf2XqTzv7tnJ/VP7Xtwli2hxbFIiUPp6XOe5gQHBqIujHyLRKVhONj2pU+
	STs4pVUy2BhZZJ3VI24j29F6L76ysFGnLmSA==
X-Received: by 2002:a05:6000:40cf:b0:452:273:5cd6 with SMTP id ffacd0b85a97d-45eb367fe78mr45727417f8f.1.1779953423184;
        Thu, 28 May 2026 00:30:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2ba9sm11402235f8f.31.2026.05.28.00.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:30:21 -0700 (PDT)
Date: Thu, 28 May 2026 10:30:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: gregkh@linuxfoundation.org, omer.e.idrissi@gmail.com, hansg@kernel.org,
	hi@josie.lol, straube.linux@gmail.com, xela@viard.dev,
	ethantidmore06@gmail.com, liangjie@lixiang.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH] staging: rtl8723bs: fix mismatched free of HalData in
 rtw_sdio_if1_init()
Message-ID: <ahfvCpI6YOA9Gpyh@stanley.mountain>
References: <20260525091836.812565-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525091836.812565-1-dawei.feng@seu.edu.cn>

On Mon, May 25, 2026 at 05:18:36PM +0800, Dawei Feng wrote:
> padapter->HalData is allocated via vzalloc(), but incorrectly freed
> using kfree() in the rtw_sdio_if1_init() error path. Using kfree() to
> release this vmalloc-backed buffer can lead to memory corruption.
> 
> Use rtw_hal_data_deinit() to pair the free correctly and free
> HalData with vfree().
> 
> The bug was first flagged by an experimental static analysis tool we
> are developing for kernel memory-management bugs.

The rest of the commit message from HERE

> Manual inspection
> confirms that the issue is still present in current mainline.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have
> suitable RTL8723BS SDIO hardware to test with, no runtime testing was
> able to be performed.

to HERE should be put

> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---
  ^^^
Here under the --- cut off line.  We don't need this kind of meta
commentary about testing in the permanent git log.  Otherwise
the patch is correct.

regards,
dan carpenter

