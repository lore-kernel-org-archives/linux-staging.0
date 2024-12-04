Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B9320B816
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328353; cv=none; b=VBQKz/NgMGbqrVGkBW1hUot09DlnVc+OVAfj2d3ZEg4XC17FpnyEhfJefIm4IBHkxHwliM7xfCrF18SsiT5vt4DVzJzSk09RmzOGCWb62WA/qu0XxaTm4zVh/Kcut55WMaPGW8S77JquHvNiWaN/4nyAyhmKsL7Y0JSVzTiU3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328353; c=relaxed/simple;
	bh=wd/eY6phlvlnKp9dl486zt0nJnh+efyg1sis2+V6M3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRRCLZWVqPzJb+CFGm2mOoBqTGzFdOw2870yyuJXu36jh5pY3fG1rnrsvptiLBnuVwI3+cIbAeXtFJ/CHB6GVZxcsBrdxuO6Qfrr+dTx6zFzQwbtt8Kutt4r/ZDbWwqjuAH1Jrjcp86HkOWgLAXIzp4o66uV7qxI8O9Pr09tMhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zytTfSJr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zytTfSJr"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so76642041fa.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733328350; x=1733933150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+tRejvXUxMNCLgTlAPgfWHyqlQiv1kzmjvxRvEB55ZU=;
        b=zytTfSJrqcMGN6kuv71c7a8QEG6AKVM5mN6HNIruwf9K9aQCVp15K3B9BAC5J5PIma
         TyUcjepWkaYG573S3UFMpYI0bteuoDMrx4F6M3o8qlRjfSS6Nt0MeTtQ/5KqWWCazuJy
         MfaRngZEI9CdqdfnCr1FExefD2TCpp5IUKxMul/vQVIRDDT+NTIzuqWTdXseK47OzCr1
         C7i6AZ3t4vUEYPRI7rwT/ayU3c8esM4yueVFHHcy8lm0y31QMnLvjLLzE8AP2ittEOei
         lli2aozZwGSyM/lFixti/GNxqryUZsrSeZ+KeSU4OM4s54bSxqvkl4+KbZHKUR03nod1
         NXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733328350; x=1733933150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tRejvXUxMNCLgTlAPgfWHyqlQiv1kzmjvxRvEB55ZU=;
        b=kc+8mZYTWiOJTFFTaXgIQgpMTJ9YQSB+aTiv+Vnvy5E4IO3WKEvIt4lBBzfAHhiFuO
         7ymU8gTw/6RitLESWHhBlqgEAaQrdGSc7IGpNkjNPJ2o4nZE+1nWYD6knBoy+Y/fiOEP
         tPNy6hEKXqSzsby1zX6W/ktnaVWVjns/uvLobTI44FRFIakw084efg0G5G5/3ocaw9x1
         pchDBpNx5O2bWCBl9UExVNyLdGO4FDQhlR7uHqSiPy6rgxAGxat1Ftmb5dLz2TPPvK/W
         JlFoVnCMVyNmYAdHvn3UGjNK09xKNeY1xxzgmUTvvFv8qYQoHRz6jgr0ZlhMiQbZu/Yj
         ZwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeWEl42xPbL2vjyWvP73hB6o7B3KdIJtRlqMTMkUXVOvQVLCl8K1cMm1F0+eihPoHKvcf5DzPrbHu/bNgj@lists.linux.dev
X-Gm-Message-State: AOJu0YxQa7W/TpBa3jbCegwFx2ZDzCD0krFEVC1iPwEgiECd+1Sdp2o4
	kIUgTdK4jR++n4VgIy61OSw8ThNvwqAhIxW6hSjKyYwJ/+qk0AVn1j0eTHF3WXQ=
X-Gm-Gg: ASbGncuYrp4K9YdW3b/pcZ2lj5+BLk7ozpoYzlYGnMhSkv6A57kJ6wm8pibDrLpvIDp
	ncg9NaZPddivY7QoSfYdZarzevkmpN6Rp7H1rfQz65qi7pNXq9c/cUJvLwYTB/b4c+s1IKGwTx9
	ef5vqROkMvoaiooB2Pr0EyB0WOVy5MpyXiWNBvAmTXp06DHc7ylqMyIDmxETMh5LfMiTHIIa9Xc
	al6I8CLOKcRNczunQqnpcaL37fJVF+U2wAKQu4wB6N5gsLdJMoNTySMJGamNqWT09FxmcgyIQ==
X-Google-Smtp-Source: AGHT+IGVMkIZj30kVvAf36Q6fe+cEPTr02QBVfzgeQHxUvaYCIvIXkRxggrpjHDjlMn9DSOZZc5/CA==
X-Received: by 2002:a05:6512:3052:b0:53d:f09e:99b0 with SMTP id 2adb3069b0e04-53e12961f1fmr4259889e87.0.1733328348299;
        Wed, 04 Dec 2024 08:05:48 -0800 (PST)
Received: from localhost (hdeb.n1.ips.mtn.co.ug. [41.210.141.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599957594sm742833166b.197.2024.12.04.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:05:47 -0800 (PST)
Date: Wed, 4 Dec 2024 19:05:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcello Carla' <marcello.carla@gmx.com>
Subject: Re: [PATCH 3/4] staging: gpib: Fix erroneous removal of blank before
 newline
Message-ID: <83d08acd-3195-41a0-9708-ad17aaa15b5d@stanley.mountain>
References: <20241204145713.11889-1-dpenkler@gmail.com>
 <20241204145713.11889-4-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204145713.11889-4-dpenkler@gmail.com>

You're going to need to resend this.  Run checkpatch.pl etc.

On Wed, Dec 04, 2024 at 03:57:12PM +0100, Dave Penkler wrote:
> Replace original blanks with "."
> 

Take a look at how this look like on lore:
https://lore.kernel.org/all/20241204145713.11889-4-dpenkler@gmail.com/
The subject is hard to see.  It's better to think of it as the title
instead of the first sentence.

To be honest, I don't really understand this commit.  Presumably this
gets printed out or something?  Can you cut a paste a few lines of
before and after text to show us how it looks like?

regards,
dan carpenter

