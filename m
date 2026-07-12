Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC23446CB
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783874768; cv=none; b=kp26PGK7tLz+xQ1/EqAPwI2QFf4KUf2i4o493HHs9nPZfGvxT7WZ8dYd51q3HuqZDI0H/ji3hvEywsC+PiQBrzYHItyZbr9kHtOvkBNWqQIjlE4aH83nx61RoDheTLKtHjuCBhiSRtrtoH7iTbUn4Sl5G6+zGhVvqcbICkt1qhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783874768; c=relaxed/simple;
	bh=WTqbqPq37rKweOHKu54gKVnSmegM0KIJTnWLBGOZpTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U3Or1gqKyz2X2fD6SSWQX67L3c6rYiQTdotIVk5kARpbz6M8qpQs7inb0PufCskml9Dt83LAS8naS5zz8oxAKxFdI4Z7n+VAl1Pq7VYf6Dc5ux7Z9A72vhmOBmg6CTpugG78TV8G2/783geSkpcPJeZ9eyi+hFhtg0VVE3C76Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sl0DDQQn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sl0DDQQn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2367887f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783874765; x=1784479565; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZELJQCDcf/zqo1tBNXHl/JtAY1rcstC6c7cMjydOGy4=;
        b=sl0DDQQnPYhyI+CPL8DjrMWG/0A+EHl6bnVNf4Hwt/vMQES3qRhe0RckGLN8bxxmty
         VgZHG5xDt0NTz/YN8xfdQDJnTRywtq7uDYkkiTyXhAPv1WmYJlQXUsUOyOnnTQSEYWjg
         Vk3Z1ufcZXLnXkZj8JLwP5hDTvxUUOTmklQZPg5UH3zqzMUlGmgnyDq5U7GbM1DM/p2T
         62OFuQhxdkxCqdpC9UHakEqIr+63gvX2EZ9y6o95ULYp7KxPuZ5y6B2hD0SpJoaOxLWG
         AzfKScqifwka98xZWpX3IEMI6cgu39KQ5ZGy6rBhf6cHNJ8xe9Vd4iCSWJ7EIjhW4fq8
         +WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783874765; x=1784479565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZELJQCDcf/zqo1tBNXHl/JtAY1rcstC6c7cMjydOGy4=;
        b=n2zEnMC9kQ94gVClKftXtdfQjf4VasUcXtMWj1IdtrR+J6+8st3TeEICGMvWJj/XWz
         p3P5wVRlR3Z8ecrOAm+eUGN+4FQcAz10CHAKu+yveN//X3b+pakbpd0UpvK8Mp4Fkyhj
         ZWSBAby+uttN8w9pUhqxCaxeAMaoR8h/WBSQ7kwIg+Fpz6gAuy3r9hLxzrGZ+bOTwxr5
         eEgAWJ9jbQ3dnME1PtYROEEnxDEuGZStHrpZxFtBPBhUA3A97w/JYVacHTA4lsb6vaRR
         JsWcla1jZC4cg6tWF5L7WtsUNSQlLGLQ8qNjBc5fJvtfEgJmVRHgKw2MV0Qd9hkGmojL
         kXsw==
X-Forwarded-Encrypted: i=1; AHgh+RrJabvrSqv8hsb9aFXrLjw5b/YJ93ZqvVewfI+XLi0RL6sQ5QF45EUO++mVRvMZggS05V5UHfAipiTW/xWY@lists.linux.dev
X-Gm-Message-State: AOJu0YyY7RPsP0S7ewQ4ZhNltMhyawHvfekCS9PhkeR/cg2Wao/Zouq+
	AadwWrH4g3Pd31w7jAaXkDeufdsRnxQuf4sgOVeh/u90NldiYvhWlDD8
X-Gm-Gg: AfdE7cmbwgZErdBQbJxNJvOlL7Ug+0+DucazDKi8HPpmi9GMsPbJ279JA9dnvOhLSSN
	VARVBGqZjIu8xgrProdReyxHh8eFewMY0H5edaYR2J8Tnv7CqKC/lkJlTQuCWT0Z9xVVfiE76f2
	4c0HiSBB61psNU5SdiEK1Rgzgd54aijSfjb01RD+8GsSZSgHsiUwqyL/cN5a3Qemf6iXMPzK1Xb
	bK4nruTuAYFU8ZOiJRubLJZOCPaPphgfzGTsBTu2LO9s1AJo+8Dy9GMqa9RA0szriJXJ1tFVlYf
	A/tR8XpxHtZiixAve7A3jodu9KxwXSkFkDdTB11YWKUgb96JA2UskGGqkI5oPcpOy2qyhXZLkvb
	mirtKPXDWIT0Fv8mpwO1X5Dq3MmhZpWuyxVnyfXhW0RUFnOUDrO/0xhFW/j3J8scPpSOZ/OrduU
	KMyJsyE3CbnDfgInvyacumpXBFOrkY0tdTxUNMvDg2Q+SYAF3O5AdRIbiq90peARcUFSQZvxd/0
	gdJNLeDUBYFtyCeFRae3gbehTmxhwtifNSVGM5DSvbTwDUg9GLVWSsTfUZeBj/yeuqZ+3o8lBpn
	W0iRfWRP8ZATbtSFB2+Olonn5U2yy2/+dG14IDeJBBHT4EfYk7oXjb9fJU9v
X-Received: by 2002:a05:600c:4e53:b0:493:f9ca:d6 with SMTP id 5b1f17b1804b1-493f9ca0569mr58979475e9.30.1783874765295;
        Sun, 12 Jul 2026 09:46:05 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df417sm317349785e9.8.2026.07.12.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 09:46:05 -0700 (PDT)
Date: Sun, 12 Jul 2026 18:46:02 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: dylanliu050903 <dylanliu050903@protonmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dylan Liu <pxyforeverlove1314@gmail.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: =?UTF-8?B?5Zue5aSN77ya?= Re: =?UTF-8?B?5Zue5aSN77ya?= Re:
 [PATCH] Signed-off-by: Dylan Liu <dylanliu050903@protonmail.com>
Message-ID: <20260712184602.0c07aab0@systembl0wer>
In-Reply-To: <BKV7Mhbq1o3O_ErHy0kJsAxQU0wPO9BA6L-6CKJlZ9DsyAlGxNQzVfSIokpg-0V4bh0dp7KoAsq34iyjPsGOVDfFX3YSI7d0MozL381XqkA=@protonmail.com>
References: <20260712141928.559844-1-dylanliu050903@protonmail.com>
	<2026071227-unspoiled-blatancy-0809@gregkh>
	<QNymfg8xEp8CU0BQxNJDcXKxDRN_xohHqySr8jzeakn2iJwHaezt4D2ks87ODGRh9227yPZ6dVpvcAa5OghRpS0htIaCUhCS7viUtr9aPgw=@protonmail.com>
	<alOtR-zUc71PORuA@ashevche-desk.local>
	<BKV7Mhbq1o3O_ErHy0kJsAxQU0wPO9BA6L-6CKJlZ9DsyAlGxNQzVfSIokpg-0V4bh0dp7KoAsq34iyjPsGOVDfFX3YSI7d0MozL381XqkA=@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Jul 2026 15:41:54 +0000
dylanliu050903 <dylanliu050903@protonmail.com> wrote:
> Hi Andy,
> 
> First, I apologize for the HTML email earlier. I have fixed my email client settings.I was using the ProtonMail web client instead of `git send-email`, which unexpectedly defaulted to HTML.
> 
> Regarding the ABI change: I made a classic beginner mistake. I changed it purely because the `checkpatch.pl` script threw a warning suggesting it should be in snake_case. I blindly followed the script's advice without realizing that I was modifying a user/kernel ABI. 
> 
> I now understand that ABI stability (and aligning with IIO maintainers for any necessary staging transitions) absolutely takes precedence over resolving style warnings.
> 
> Please drop this patch. I will be much more careful with checkpatch warnings involving exposed interfaces in the future.I will also dive deeper into the codebase to ensure my future commits provide real value.
> 
> Thank you for your time and the guidance!
> 
> Best regards,
> Dylan Liu
> 

Hi Dylan,

Please wrap your email body to 72 characters per line, as you would
with a commit message. It's easier to read.

Thanks!

-- 
Kind regards

CJD
