Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1A13DDAE
	for <linux-staging@lists.linux.dev>; Wed, 25 Sep 2024 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268910; cv=none; b=roRoO7gAg8OunqMv4huo4JZ2BJxZiDV4oyK8FB+ji6RF6CVaWXs0WTEGfJh2Jl6MtuF4QXxkCxpZ+Zp+L9rNozWl+SdY+nniqiYUZ1jjOg9QC66C59gTqFo62eDPeKP03hzRyk7XxVAeWXkp7fJer4Iep+FkwoszUODd/xefFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268910; c=relaxed/simple;
	bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s//S9oEOyKyew7DQJrbX0kFeZhVmZ98TC5Duvlk7VlJB5zyvJJqJf6DeFxx8sTkxDagtQmLhkhFhqGJvEaO6Bo10bfGZmdpMS+DwZAb0WXFg+A1gYw38won4HqTJE3PT52CjyLPwW/YhQb869v5guaDuoZcdx/VZfBE4Qa9rOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GP6mPqOY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GP6mPqOY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c180d123so3987188f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Sep 2024 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268907; x=1727873707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
        b=GP6mPqOYfOITGMk1VFcBF+W+MqNM0sFOSAAwgbcGE52UiVsr4kEMMouwbMMc+Eta8J
         LjkJeuUfDRPWJSYHxndeLxJNdBP/fyFf6Xu1Hn4oywAw23uTa9iaJJbOUzPyOyqO0dlW
         GIzmnfjaWWBGPi055EFEYh03R7kBMTpVkxnbSS+7Vl8DDnM/yjelIix5UY6CjHf6tf2S
         Zx8fWq4Zw3hBbLO/z0gxN95ul8zgUFSLWkZb7YZ34MLVQdXRl5HutXyyWtiSqTB48/4l
         u3PSBPRAgTuTatVcHwTIabGw7XzwkTHxwXTzEfDxgce/NmV6NnC+AntJEiN94pWsDa7l
         vLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268907; x=1727873707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
        b=VrzhmlWIg66JSHd3a3dcXQYQZFOfksw+RaQdKhVTRpxPvuZzvO8LIRUI9W9SPeePXZ
         pGxc9yH2ZMcJYLgs6cSy1wIyBsPNrHEqa0kO8uSpdikYXMiPx0STfjkxMrTmQ4VzKXws
         iYrFuUpiV3265Ib2wVqq5CLF84a4IL3YtQoo0IcxNEzj/ZVsXFxWvFMLbnKaSp59h7ih
         hx8CNZ7EGq2kaLaJCub1MIjMfbq3OybnuI6Y2mOTNkbe8QXWQ3OUyMDOgMhq929PCfEl
         Y8D4fx13btksV3pPnvzz0yx9c1ZuNp2meW0hxGES6MKRBAbOk1/0UB9v3KyARYlIvVFB
         LBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjqfmvKwX8jkPghgn1slAFuq5MNEUfX0+FO4ZDt4ELk2B0mmtN/qgc/ZBknhhriIa0mctbfIjR4t+2Uyhw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/s+mnPhYi5t12e31BYgyg5B5ZkI3wnfCXQ2WFwMHDkZKwrZxj
	J+vlB7bVKyCBeR70qRpozc3dz14pgfy/8zH4LGBewZYm9m/HvtjXqWAF/kTk1FU=
X-Google-Smtp-Source: AGHT+IEM7lvuJYo2POgpko0eNfYw3ydlD44EH8OZRmciXwckV0VJOwVx+RrAiTfSKQE2gsGVX2bLVQ==
X-Received: by 2002:a5d:5508:0:b0:374:baeb:2fb with SMTP id ffacd0b85a97d-37cc248542cmr1519632f8f.35.1727268907458;
        Wed, 25 Sep 2024 05:55:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f77esm3972482f8f.108.2024.09.25.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:55:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:55:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [rft, PATCH v1 1/1] media: atomisp: Replace macros from
 math_support.h
Message-ID: <67964712-81ec-4ce8-b5c1-1f050c7502fc@stanley.mountain>
References: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter
