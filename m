Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59072366823
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776330336; cv=pass; b=dfb4N4zIyYHwlEUG3VyV8KUxhqA4m1EHmLUaeE/PmsjbRk4FsocWUjnaKgMuWToO8mp/OX/2ItjJxv5LQBO4xx46oMESpYCHmt/HSLWk26kLOBocShzYNi/PbPuVAC3dNeTM4LopVX3ci9mkc5/QRCNeI8E/Ng1CDyialiT9NCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776330336; c=relaxed/simple;
	bh=WbU1UspY2qHBDo4XKXSrqD5VY1+388leVHWxtsN8UvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdqEJqH02RFSod95xVYIa+/mtSee/ysj7U8Qo2uh3pYldvVU+a/Dmf/tnonO1BcbQGCGrpSwmh/p6mRuD3MJHoYstguhJmrCKrSbHCu8f6HGb41qPNu3aHXEknNypYa2LspMGYDcVGRW3DcfjCQ0zJ40uTnOsvyLVP0hJiKpbp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZLN6LnY; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZLN6LnY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso93368565e9.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 02:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776330332; cv=none;
        d=google.com; s=arc-20240605;
        b=hXjPYkL2+r4TJ5CRt2Ja80PNJJWFjyce1U1nZxZkHTaPMwNZGN8orpYZqbPeDnsOaf
         BpZ+/siMvBeyM4vAdm3cB3akiaxlQFI9KrROqD9le8DMug3DaWPfLd4pHOfD6cMU2dYI
         DrygI0yKFznkNAR9JIE+2AeXRzWKaet4sp9R8MvG/UnmaQhq8kJTgJLcbamb5fDzJMIr
         32a14OD/okjBdUCAVkN4RAhBEzR7jWUwHU4HtT/F+ijuiJhfZLfNfKTu+Qy6n5hCmcOB
         kblc76QtYzsvhydrl6epLKOizwXgIn4m/XF6E01aCTBBPoHcXB3ZKIiDDv84P4BGthek
         KI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3xMM5cCIqeLaFYivVgDzMsFxL5LiXfHO6V/AM5SAkU4=;
        fh=kMfZsTpHntq1dxjdo25rAJOB1Bu1+ii0UuhU6Guli7M=;
        b=XHq1wz2aZv/Imfs6zaCN1G+iu/Nm2OPYPKU0qQQndtybN8s65BmMoav7m5YT96KwzM
         z5ZmIbD7Sm2wY3VLEDMTkeGh23FEvKZDT9+7DOxoGgLqgpHNrhLGAag5ZDGxvFooH30E
         yBWln8aRIcOTovE4SevZED32MphT7R9pTgtCuBbivrdaQ7oS0nEzNiRnmA0Vmm7tBBPy
         2kJzzl53vThaWD49wdPTF5DEyOLUf+3ZdJXT/reu5fXh1BuLpO5IbuqLj5IgbseXj7Z7
         8jVWivenmrZlVCVhyvjjq0iCCei4UlD+dNEk7yM6o1H70ZEtGr5MkC8MHOlOUC4pJvbM
         x4oA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776330332; x=1776935132; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3xMM5cCIqeLaFYivVgDzMsFxL5LiXfHO6V/AM5SAkU4=;
        b=GZLN6LnYHEf569HJbLpn6EZKmFxjLlSLYcdAcMQHgD36crykNZ9LBTgHDTVdM9QjzY
         hmiWu3FDeFzlouB5XtjSpw6auiDut8TET0qCxnGVf6BU2XktImBmUbM3PuSbmO9bBGV0
         L8Zl+sKB9d269cOBW7YjZd+rdc8umAN/PMXVnOK1D3WzUmUHDkoZ2+67kq28U0tYuHKV
         B2aHuQ6VFeqmhcmVCXh4QnSizdZA5KMXb0QeR+6OG1aVFPkd4TuGJL+7d8+JTYrD1FBI
         wMCgF7lpc7XXl2pRZ8TL85MF+ijDPejjeEuM5Tyn1mboCtIzHAlj9sP5L7bFuFjrXIlz
         o55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776330332; x=1776935132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xMM5cCIqeLaFYivVgDzMsFxL5LiXfHO6V/AM5SAkU4=;
        b=gEeNeriWUx9L04UGC7Dm/F5lR5xybv7XexG4Jfy467W3rX2bfA3d4sfy2YtQMYR7Wa
         Cgw35HzAihQLJzPmTEgaeNxPipy9BS08zO3M2ENn6NkCUofZ5K3uGOZnIKmDCIKuog/T
         iMbN7qvZRyzHcBDslSTDvjUBAgrSSTAwrd50gLfROIZbrXLwapS6IuAGrr2aCf6hn6OA
         evL2awK4u1ce/nk+jqxcW6jFHiJmmUnxMGleq3OhdnID5/XOwhijU6IWcsY56ZZI8V2i
         9LCSy/iWWGvZzPYAtjMuGXFBSk9F8PUDXrbWk2lJaGLzOsLXYDXQo2WRByzX31EIxjsu
         tBsg==
X-Forwarded-Encrypted: i=1; AFNElJ/X2ojUQ2r+C4rnUbPLBGj4icNyS6+TaeVYMFFKrj/S2GymZR8/rRWsUj+2agHYp3FN7/hTyPLcheFKP7Rx@lists.linux.dev
X-Gm-Message-State: AOJu0YwrYbJawsPzJAu+/X3HjlPJ+UT/HbtqTTKs3cfc5HS2v8B/asTV
	ktxY91/9jtavxZ21okaBHGkvE6BHcimP14RvBPvIBl/6Ku6ajaTbE8Z1AoK7rn/Pwll8gFrLerc
	6ctZ20Yti3+EPkyOMf8O1IcXx8f+grsY=
X-Gm-Gg: AeBDies+FEN6YpJM35O64HTibbU0ZFeorYpilxq4Gw9eDL3Im49+DVCY+z9KRPQdMw9
	wI+3lePiICVsmfYZjmNiELNrEubsH9aoEe7YeAo0dJJTsGNJl6rlPV1vH6zujKGFBeDPqoXbuGU
	iy9ABvkIZkrrGrREYH4UsJIYMSi+5IuiKOsN6M8a4S8jhDEIb/+s7/hka+dgbnbugGdtjam9NTw
	OrI5Sz/XJI+hN2K1HGmDEX8SGsV/7QwpnjBNF1ThZ/2Poi0Mf1sEzDKTEzMuJOBqgcd2z70E/gb
	MgWB8QF45pYdfpu46cJGkk6emKit9ElyZ7J3YWiFxhUKqSbalrsZQoM3cq0jflkCyzgDk/ygDFK
	sDPdmNZMHojTZfPbN+BZd5wWZ32A8aRLVPb2V9QvQ6c7C0GvfMjycgsDDPcj8tp347OuCuu6fBq
	3J2aaWQDN5jVF1hXKM
X-Received: by 2002:a05:600c:3b24:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-488d687adb3mr361516645e9.24.1776330331981; Thu, 16 Apr 2026
 02:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415112030.1324-1-joshua.crofts1@gmail.com> <ad-iqJxCoZ18nESz@ashevche-desk.local>
In-Reply-To: <ad-iqJxCoZ18nESz@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 16 Apr 2026 11:05:21 +0200
X-Gm-Features: AQROBzCT-7Exk85T9eopi54doEw_iY9TL0LQF2j7MT8rKpu6-vLdOhY9qC0rKo0
Message-ID: <CALoEA-yHcXhM=zNtZa_x=VuAzGCbLD8QCHPGXA1GFYHG+0ZtOQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: frequency: ad9834: clean up includes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 16:37, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Still missing types.h, math.h, and probably more...

I don't get why I should include a math header (I presume you meant
something like linux/math64.h), since we're only using do_div(),
which is a macro from asm/div64.h (which linux/math64.h includes).
Last time I came up with this, you recommended working on this in
another patch.

-- 
Kind regards

CJD
