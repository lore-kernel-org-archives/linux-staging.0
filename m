Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279AE3E51DB
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139404; cv=pass; b=SKoZKwIB/nqjQfyl8WQT0kVicER9/P/mGhLqj7e4xCEbckfWqUAnGY0bEs7lWBWanvtSIfaHxm/67yq9NWss1He57yaebudUFrgmIZ9HOhgIUjm+E7iQyLvD3/qwqzPN7IUUuXl/O2aFEuGnm3Yo3aBng0ALiTGLO8p8JQwmOl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139404; c=relaxed/simple;
	bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRsW++vG6mvJQqXtGM9wUOGccwI/EPD2RJoHh83hfr6EzX0ZXfIkEyQXUjL0z0lo9yBfJjLaXWB8ZiUREBKSyF/0NJC0cZiPx8BueT6Xj6NqPc+U+FG1sOKqMfP/vqZhXQ3DBwWlSwpMz4aoXrjcT2iNcJLMhkxOIQ9tdLPQHyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8Do6EvO; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8Do6EvO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so7281965e9.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 07:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775139401; cv=none;
        d=google.com; s=arc-20240605;
        b=Z1yeyicJRZXLakZjE3nU/vdboruhQdeb5CMwXc/hSgn5zKOmoCWLAFizN9YWULabOU
         NOwXoh5zCMWkP0Yp3kLrhIGX+3HYHFMNQTJU/lB/SoyfohWX+EuDWSZDxXt3809pBUpo
         z+e/IzdhHkaro/w5DGVWGbuNDCs8I10cpBfd5cT5+RF6Do8nCD4rbXSPeyeyUkFYScPl
         Sf4fvMHJJaZZ/QkY1HDDsI9c+bAqi6cOzkHQEOvy+8bwSsh57uxWg5s/+Ub6bEhsMvDL
         7ZiHpf6A/IrXs9Cr9inlbumAXdHaqYuAfouqEXGH9pSAB2kULPOPhkAANYOWL5+Pp2eA
         HeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
        fh=s5a3IeT52Hp7k1iScyFpKabpuDMZXSv1lFga8WlOtz4=;
        b=CPU55UolMWQar0N8gdnWFX6CSszbo40lAbwwtdqg/m7p89UnjkQq8fWd7yZFbmICvG
         ZlLlgUzG/zfqQe6QH77QNdkvbi1d9AxM3zDqp53CUKYlzTQSmrUMbTots/fPO1RxH8Kr
         tCvar6Dzi0PXzyGS6bszuCCwkPenN/mK2GnBshXRdhPfIpzgC1MJznS/r1+BNWn+aRuj
         d23Pc8vUZHubRmH93inHOpYZv3ov/2VNFi9aaKVX1UpzRAuJOB3zvKHDUX0b4Rkkwix3
         /RQZWM1F0Xt7uuBWdr0q58Sg8tvjNMQvX89orstwVFiIsdt/rpQnWb7jyiq2n9plv2wz
         ZHFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775139401; x=1775744201; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
        b=O8Do6EvOOEMg/DXt8L5RryLuu1GeMHWOiNicS4Q5z5HzSZ1qjNJDNwvW1CC/ISLeRK
         68rZxD9Oi7LlxZnIv/pZ4Q1Cb/UuJn+NyzR+3djJ9wA+zKEE6LAhjz7KdeULassDAt6Y
         C+BuBs2rlcZ5j6M1Z/rzd9FcXpKtttn3V5ecgEFJuFp7/FnXJ67b2MS7+BOahdFlrJjk
         acHI+vaecdV9UUjhrbJe8qhmo7iPxL1aXQC17vg6i28ALl3YFr9OpIfX6w9yyox9rEii
         lnmlGaTnuctkHCLptLnx4phok1b2A3cLRY7kUbYVyBa0leq3qOE2XMhhgIPFN14KQuMx
         M8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139401; x=1775744201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
        b=EWvDFvSSRvzjujeuDyBIHi6Y8arRsRi8VsdpCg09b8v8DgLP0/97Gtnf5kyT2xLcrZ
         6AjHhy3Zjiq3TE5gl3e6iwl+CeophzrNSCHWEH8mODvA9AtNRX1mjV6lLDXVlYGy82Pt
         TmnNXI8NXjndAqosyVz0LUl1TE0yiJqSOqHDZjlKkwCRiyc+v05fF+U+Sjz9JHCtN2hS
         6jTk07DRkbNojEYRkQqSrkxn3CHUM+2c29p/s7hHlhuwnfuFO5/Rk3kuwyuyoTbtT6L3
         jSRdOqGQpC10s9hGuiHFhWoECgVVhQk4rSYiIkAZeR++Yx2hVhIXfIV0tJTuogyJOUKN
         smMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY51BvLU+XFuSR3K3l7xdLgF2fTZNN+8Qx5T0/B2VwJW+lt7sDp/schromXNXxJoUvyN5RgRaC/YILW53I@lists.linux.dev
X-Gm-Message-State: AOJu0YyqCpqvPdAHxpho79ggjSeujJb9Z8uSkva9Ue8zrSH8/xU9jBTO
	wwcyURU24IiGaiHqGFn/CjmNTHVrllrrmrlcgL/LaTzUaRj1OveO55BTdvU8i2MbQHRy6beXUt2
	7Ivk/zE5NW6LFD4ZK8EUHsr00T5PG2gQ=
X-Gm-Gg: ATEYQzzTnuDJqDcp43bDFj+4pTMPCUGXDO3Wchlwc2j2s7wFp2HYj0s0V57jP99TH9C
	14CO7c1un8AvjbyQbbjqMyQUgJJVBt6VaZsXYurLLlMnXR2JK5ULyc7Xs1xntR3kg2rk2xLA5HB
	4pGq8I/T9Ly4iN9KldbbNN7ppEC9+Y9hI1ai6tMVwS/x4UZCMpFKGRrFIFWDUE+0bn18nHiuxEj
	vmUtaAnZsACPh5Yo0sp1Dpbs3c0/JL5Js9UiXmdKEB6i9JMKaNmLZh47lQGw7d53LIwxgg2qYYm
	WFYCRIXWvKBbFTrq4ExJ7XYMNa8vc/va1V63e3NCIPVagXgliZT8cNFnaVOKKLmUcBH+HitpgZp
	tHxPc5BKSTTFfXsNdQm4zU+pmRA==
X-Received: by 2002:a05:600c:890c:b0:488:7f49:eae5 with SMTP id
 5b1f17b1804b1-488835903c7mr98934615e9.16.1775139401258; Thu, 02 Apr 2026
 07:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260402091827.2163-1-joshua.crofts1@gmail.com>
 <ac5mFkf5RIEg410Q@ashevche-desk.local> <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
 <ac5pOwTLZHFtgyfG@ashevche-desk.local>
In-Reply-To: <ac5pOwTLZHFtgyfG@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 2 Apr 2026 16:16:33 +0200
X-Gm-Features: AQROBzAFAYmtv49AxooTnKZel774V-TSWwqS9W4HG8GhHORkhFsMz5ngPiQqKY4
Message-ID: <CALoEA-z0aGoir4_C8cMyZGguJ-Bp1UUADKxntDgjcseUkzNuag@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 15:04, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> It is okay and good to group the fixes for the same driver of the same kind.
> I don't believe it's the only single problem of this kind in this driver.
> But you may double check and fix them all.
>
Okay, I'll do a v2 and send it tomorrow (as per the guidelines you mentioned).
Thanks for the feedback, I appreciate it.

Kind regards

CJD
