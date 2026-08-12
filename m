Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934EB353A69
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555334; cv=none; b=QBtf4VaSUPbA5uiMPjbX6CBn5yIeaRjGQsXL3D95bQtyUF1jGf7Cvo10g+Wl2JoEKRBsNrqJPgx6x4Tb9tEhzTdKpR4njF6VpsoGpUp82ruD3ObyGXTmJP1dxgoJhlE6XvuHPB7jU8pxOXU7yuoFXWhdt4Sc1uUFwaYyXgcJfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555334; c=relaxed/simple;
	bh=iAjiUruRuAVx8qNLoqOKBWWu8fPaEQjGNcE0vQje1Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZHb9+F1MOMyP5ltRuQJ5IUIB8rcXnZ06Pw54mcHL0rkeLZui6vbjsN6HIlECMSb196YD+zzOI+EbMEifKXHE4+JmsqzFnA5TDRvfoa5p/qpyov1VZRCieEKA015pIlxKCaU3KYOe1Dmn5r5C/YGphnRrtaZJfz4eI9tl0xo9E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCUECA7d; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCUECA7d"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1327361e87.2
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 10:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786555332; x=1787160132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCUqo5JqauaiHNYpzgNgbeOUol/3jZeeaOvrFXvZ3W4=;
        b=aCUECA7dmuY1Nrk/60wu9uFKtGv7zLuTdFtNyZEO6bbHBN8oz2MTQRFE3DT7VXBlDY
         TbJZsABtyEfwPaT7PfrOWduY8d7wKicVWJVLN0T5ceDb/gYVHKs9z8WGpxdpI/ikwoGT
         7vDiKwFnCgKcdYCP9yaITs2VdwDzVVhJt7KRYSebjMzx6J1j4h//4EW+aqk3H1u10Pfn
         J5q/SadqTpEACqVHALAgBTLkHAcF6iRZaq2rwa4xWD9goAlWRq9XYX2ZZfud5TluKYyh
         Z6k9M8WKB0eMC2xXdnwqPYx7fIC+RVZTgu/nEarULZINVxFuLzaDOZrxz0AZZwb0+aBv
         +M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555332; x=1787160132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCUqo5JqauaiHNYpzgNgbeOUol/3jZeeaOvrFXvZ3W4=;
        b=CRy9EOCGADGvQcvN1ivDxt6EV2ikyNOUj415jmg11cAzNyc+l6Tn2EQ8BojwJuiscI
         nP0JiMt7vrx2igajpj153FXmjoDUF8N6WI5hQqHP2Y99i7004mPKsnYqSYipqmkXnUHB
         1rTuO9I0H+CgJUnxuEdUFUqOmVps0J+mUFXgQTKi+Mp9ugFXT7LUgdu9MeeLtVWZASaF
         rx/zpjQjiyncs0LuyVCwtU7KZALNBV0hzhVJH3LGjv2n55VpPBRR+pBc6ET2v0Hrveku
         lT+U/EnpEgGcVhph9wSIag9lwpXAopaCiPlZWhx02Ig0kldI2F4Nic1WRvS5RNyzCFzo
         MaXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrCFgqkJZtygt/GD1n+yCgJLldit5bRo3SqfPPLBQhK/ApY3QSEAT7KweYaU02iGnUgu7BKDpEL8mLZS4N@lists.linux.dev
X-Gm-Message-State: AOJu0YzefQrNI8YTarbYLTOQ1YdnGvWDcp3Ea1F2iPaSB0M9YZw9sfD8
	Akn4+Hteb+9005Gg9AMiZFylPa0F6ljHaIMG16s8KjD2H8fPkVfJPdPJ
X-Gm-Gg: AR+sD11U7EN9AGfekxg7tmQI4L9LCvzI9g2JGLpCXf+y60rop0Om3ffo8GlatfKFzrB
	E4PDcTa3J+2hK5xf4PWHHO1r7GZzNqxOG1Gyj9yOdoXgEbBX7Dx1K94SU+iq7aJzBLBOL0woO9Q
	6vw6XNqhK+4/jORUwCDSe0ormqz6xngbmQ9mkhUaLXBacOHNt9Yx7XtDqhVPmNzDIqJrEyE/gcg
	0XZpXeK+ybr7OjfXdZHVNjwgiYyB0bjwyNZan1oAuiAS21XzT4BJ52uX9meImGEemQqfGkQ3uz3
	UJJ46SHWJszkp4hM6WBId+tp/V9aB1Gs1+Chedi/UHcFnV60tPfbXjCpeFjhX9+Z2Oujp9KPE+Y
	0bWu1nGsQTbHi5Kta0U9oQdKf2kirpmY3iKPGCy7EG0Jyd5pyXz1NAVMQZH0jh63oYVdqmoUB17
	dHIJaRVsyC8Zd7M7XB1Z/GF3q3Iy+r8FMncLSNACsMqPCGlVVu0MsYDKlCyV0=
X-Received: by 2002:a05:6512:3b8a:b0:5b2:9238:5c36 with SMTP id 2adb3069b0e04-5b44e31ed71mr1053748e87.27.1786555331412;
        Wed, 12 Aug 2026 10:22:11 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfb244esm643620e87.13.2026.08.12.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:11 -0700 (PDT)
Date: Wed, 12 Aug 2026 20:22:07 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] staging: media: atomisp: remove
 include/hmm/hmm_common.h file
Message-ID: <anyrvyBMNMcF6Y8F@archlinux>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-5-nikolayof23@gmail.com>
 <anwnHooR7vBvrNIc@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anwnHooR7vBvrNIc@ashevche-desk.local>

On Wed, Aug 12, 2026 at 10:56:14AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 23, 2026 at 09:51:21PM +0300, Nikolay Kulikov wrote:
> > Replace the last used macro with a conditional expression and remove
> > this header file, as it no longer contains any code that is being used.
> 
> Split this to two patches: replace (in the similar way how previous patches
> are done) & remove leftovers (file and no more needed includes).
> 
> The code wise LGTM, I will give a tag to these patches when they appear in v3
> of the series.

Hi Andy, thanks for the detailed review of this and the other patchs.
I'll fix them and send v3.


Thanks,
Nikolay
