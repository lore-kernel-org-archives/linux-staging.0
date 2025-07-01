Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236327510C
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379373; cv=none; b=BW/tWQg1SoJaBodpNdq9Bd/xQmNmeGJXSTGoZdkVuzSIpY6U910qWofPd9WHgDQFEoZocfkM6I5LMh4CQhmqCh1YZL4WvQ6wQcfIS4SZHnb4ErWB86UsYT/7UtVyQIKdznANuYTjPe3brc1s2nDQ+ak2p2vfBH4XcyY1H7y2PFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379373; c=relaxed/simple;
	bh=USZWYVOjVhKmkj3wsqZFv1I8CsaZxslz+Kis6L9+6TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCweGIDJWMioItj9sPtHbfQVod8wOSeabSHZOYdrf6aC+KvEDJkVPiEj8eU6zTStpn4BkiDcQTxCGN28HdzwZxLlMBaxJjWnw6EivbLijRaOK2f51Q4tCB0sVeu/P7bXEagC7XrkufR/mVLW5HWjENXbVnUQahqDsTkUh7Fpy80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jv8o2zfC; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jv8o2zfC"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-40a4bf1ebb7so1827906b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379370; x=1751984170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utdJ6ug4uyT7Q8sLa8Hgrk9nBo0BM3sC5TV3oXvqsBA=;
        b=jv8o2zfC9DYjCc7e5JU1mPrWKhSrsaXapNcaoai0R7sRVLqvqMLr3U+FjA+Tg6SPYC
         APdxYFojILPfA0ny6Z3E8rAd0XFSkNHKeob5EsoGdpGBqrcWWXSUDFuB5WlarASUGDmw
         E2UhVw48e7kgLxrMvtugJpY5QXD+tkfjFjZU82OQlWTWObNWaU0I7gINXfLwizY2cm3t
         sfvtWeCMx4sPDxklwyprWgkfYZ0Fvf/pbCinNKY4YvwGD54cR3IphG5rIPKdOXsFgi4v
         bPHe22rYKQv0dQdgvLz+RTaYXBaC+e3Ec1Q3dK860uit8pXfQRETbZzrdwGTABUGjFqE
         Yt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379370; x=1751984170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utdJ6ug4uyT7Q8sLa8Hgrk9nBo0BM3sC5TV3oXvqsBA=;
        b=Gz62vf8jUGM5uZlWpjZi3MUgc72IvI0He20Gbdc+q9wOs1/1cWk1y/HPWEnFEWpCKi
         s3cyipDpyf/nTHN3u+9ACSf4DJthNsMMiwAbPpzRXGsOCkieTTjjIRjB+p6Z604MjsH4
         n6R9bxJrbuk/I0sS719Ce4J9Iaqhd/cKPQa9qmi0e0ntZMCmqFSt7+SMjOtWdhjZ9oFK
         WxpQXPU8VaICOwBfYcY6IpIag2uAppkgGA5AtCE18FJnBDb1mz8W4ZHlh2Vth4mtcRKo
         RLlXlD1LIFTlhSu+kpOvQATcawTcMVaDCXey2UP2gZcD2pWLHa3JY6SAxsirEVSi87nF
         TlIA==
X-Forwarded-Encrypted: i=1; AJvYcCUU1GX/t2X5XnIFqxzNI0FzMSEu2PUZiTt0kN/MZWi55wf1PwQImg6BEbPXeMr7GHx1zoRhS1sHz3SHrVsF@lists.linux.dev
X-Gm-Message-State: AOJu0YzE8Qmw/epUG/UEwU5DwMWDjBzXAuRC/ryRXXTrZ7ujC7wKsYzI
	9t4Kmbo+MP3zLfSOi2HJVroxUv2dEQt3ZheGFKH0HB76MUm8Qwb+n2VHqwOdIkxUZp0=
X-Gm-Gg: ASbGncvkDqnt1lO1viXBWlvNcc1lL7LqYpxkfGyBwdHEaOphLDzKL/kpTl0OddOQcHV
	tq343ZVacXCD0wFYmzMsi89ObIVKZW7nZ7Uh+XGY5NruhKH0AsPKDEqyCqEaTSX8nXVx7nqOWnW
	8OguMg09GFj0+hLOJU4pMsJiOib5URbrZ07X2zVa4fboS9jUqZuvZZBtDEv6B8ZcivoaineGvBy
	BLQiMBxVIgFfZN+mzqJgEDhI6wo35bChuv1Fd14r5MQCSCOfAjx90EVVDBCT9lgRR9IgUhyLbzq
	ogkDkxt4+WQJqXDDDxFWOE3E+6H2aL4F6mLTE96C3kz6RvnSilQpvSTqpofnhCxHEvYJkw==
X-Google-Smtp-Source: AGHT+IGZVEVMxiOt6jeqMEAztsF59eLZGnR7BdDjB+ynvv+0phivPuMF2SeTSIpGH0oLVnNt/k+dsQ==
X-Received: by 2002:a05:6808:17a4:b0:406:7186:5100 with SMTP id 5614622812f47-40b33e18292mr15859525b6e.22.1751379369809;
        Tue, 01 Jul 2025 07:16:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420c62sm2182425b6e.39.2025.07.01.07.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:16:09 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:16:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <4c1aa07f-082a-4ba0-ad3e-14eba02423f2@suswa.mountain>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
 <aGPnPVjB6bGKMkwV@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGPnPVjB6bGKMkwV@smile.fi.intel.com>

On Tue, Jul 01, 2025 at 04:48:45PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> > This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> > leak in fbtft_framebuffer_alloc()").
> > 
> > An updated patch has been added as commit 505bffe21233 ("staging:
> > fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> > and so reverting the old patch.
> 
> Revert has its automatic line, please do not remove it.

Why?

I hate the revert format.  It is from when git was invented in 2005.
It sets you up for failure.  These days we have so many other things
that we want in patches.

1) The subsystem prefix in the subject
2) The 12 character hashes
3) A proper commit message
4) A Fixes tag

The automated revert commit messages don't have any of that.  It's
always better to hand write them.

regards,
dan carpenter
