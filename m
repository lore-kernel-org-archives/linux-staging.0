Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228DC3BD241
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195260; cv=none; b=JlLTPMJ2JBelYcT8QM3n7reCCPQ+Q9VdKjWJ9LDhesSJfJZvD/fiHxGmcDGx7XvpqrEpeyDQ5N/RM7XSsksptcVcMH3jKmXA5cwSZlcS5ss5jLgBIy5fJ2tz15p/Qa5cE3KPzPYktOydu1hL42eq40kfWkERmu/LOdO/D62aYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195260; c=relaxed/simple;
	bh=YHL5UBqkfPqBDoGZ+jKSLy/TdRXx0baXPGVVs2nEMS0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBm/+K6B4/y6hTqZzdeUqtbRm+UOgKmXogeknzr6CzNVpgPe/hTtdKzG0S1gQVxKWXRp4l8/z4DMPsjS7UZ1q3QUMnPanxbHX3x6uiLpZJR21XXmTgo2npi8g5ikayywxAUTOKmmlhJZI5GwhJ+wSz9hV/STkJksFpjggUJgnGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeZPpZVC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeZPpZVC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ba701891so25292695e9.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 02:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195254; x=1784800054; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EATbcA/UeCqQGueYQZR73FysbRfQo6WKFQyeV9kM5h8=;
        b=TeZPpZVCQcFfQWtEcC3WR/ELVFDl3FzipSpoQYeyQrEXF9tCWe5Q24IGQ+weS35JdO
         4jjK6EnTpLzltsgHBK8aab9AsbjRd+juPslHEi/HwTbs3IeFhek87ZTTBH+5B/8gjz9U
         8Ml1ATEOgGi3dH4SXUi5sHLLJhEaeVmr2esQgHsdKC8QQEkTLx0B93Pj/7Rs4CQcdvXw
         YDYq7UreDs6C03kGfMrgcHNbFinVNpXWh/s/eeShEmMXB8LZ3xeEyUXgFeth5su/wbTN
         5zM+KxuQGz7LOEV1CCMFnaHob7xoUV3Dqz+PxPglhc8VyEWeX/E4pJL5JbBdDEJOpA8E
         ifYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195254; x=1784800054;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EATbcA/UeCqQGueYQZR73FysbRfQo6WKFQyeV9kM5h8=;
        b=bVkv6YqmsxEUQupiK4M9GPP00K8UKm45EPxnGmu0Ev/BzGW82xlS2WXSXfp2v8SE6s
         HUTViFRcSk+ga7VGC3iBRjAPqkr6gOKIh2vOsqVDD5y4tEnCu6FMgTDvyj0wikW4LeOJ
         qFuIibDE7m39XBWkxsnuy1ZQvUjBNepeDi/w8LlvBxLtANs+nGrK45imqcx/k3tOwZEe
         plsqA1txWcsQfELJcbIcOCpTgWFlXCBDq09qS7/gPIgYB5mg7OyNELWilDKwsUpTbtfl
         UXVDQPjcMrrWCgHgoQl5Zj195iRm5OxFHA/BOFOrOfLi8KIPH9SNkXsEQzORH2S4DXnx
         vB2g==
X-Forwarded-Encrypted: i=1; AHgh+RrUKh2KJqGnOiskmm3rsZpFo0uR4cvAiX2PmPSoOs20y+h6TKeyjfcrdix+2o7bqn9lz0ChQUo6CyKHHw6i@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3OubshX6IDBKhrbpRnCb+Vjkli1LI8CH5fQCXV3yHR3IiDib3
	4pVE9uvsDE1HSJ8wC6NY8rgItxON0HCaUSNnvlVV4zDTacb6zN7ZZHya
X-Gm-Gg: AfdE7ckHlIbHkcLF+2Q7Hpzh6a0jmqQQi3BEessZ/TtFYWAiiVjlgp+pU0hl74xAAh6
	3RmJ6rY+phH+blnU508vdCsg6Zrh5vY3EhyzH0d3L5tdZO6Xr3jDzyNLSJEclRI0fAax70PXcUe
	2QRgkOHQMTzXYDQDGVo5Ga56ue24ozY/aEQj4tGiJHnZg6xn8C+4MDJjnJ+lvr1n5I6AcgLJOYv
	JfCGhIELQZoWsbzMktT14HR/SeOP+CpNyqwHRYeSaRErORGMhv1oVQLlP8VcaZdpYXDld90TVxy
	qwwtyOZD+5Mt7XwMFGd++5IE0LPfMqZGSmZuAT7kVssA4EYydFfaTwJKDudzEyKsmh3ht41dPo7
	Op5IBAjpK8b3G9aRv5ohhMM1t7tpCP5l/O1lm+YTTce7lap377cPHdrg+aRopWRt1hsdIPc1ySo
	0mi7cW5udWNRqoQhxgw0+fvmC96EjDOXCZIq7/fF0=
X-Received: by 2002:a05:600c:1d0e:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493f88333c0mr222870085e9.32.1784195253691;
        Thu, 16 Jul 2026 02:47:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541ebe625sm42927525e9.15.2026.07.16.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:47:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:47:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Mohammad Davoudi <mdavoudi2011@gmail.com>, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, rmfrfs@gmail.com,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace sprintf with sysfs_emit
Message-ID: <20260716104732.7123b1cd@pumpkin>
In-Reply-To: <alf8N5msXi95aQfB@stanley.mountain>
References: <20260715172858.17658-1-MDavoudi2011@gmail.com>
	<alf8N5msXi95aQfB@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Jul 2026 00:31:35 +0300
Dan Carpenter <error27@gmail.com> wrote:

> On Wed, Jul 15, 2026 at 05:28:58PM +0000, Mohammad Davoudi wrote:
> > Replace sprintf() with sysfs_emit() in sysfs show functions.
> > The sprintf() function is unaware of the PAGE_SIZE limit of the sysfs
> > buffer, which can potentially lead to buffer overruns. sysfs_emit()
> > is strictly designed for sysfs attributes and inherently protects
> > against buffer boundaries.
> > 
> > Signed-off-by: Mohammad Davoudi <MDavoudi2011@gmail.com>  
> 
> We're not applying this kind of patch in cases where sprintf is fine.
> 
> Really, I never like commit messages which talk about "potential
> buffer overruns".  Is it a buffer overrun or not?  If it's really
> hard to figure out then say that "This code is really hard to figure
> out and I suspect its fine but let's be safe."
> 
> In this case the code is really simple and we can all see the original
> code is fine just from reading the diff...

And you also have to double-check that it is valid to call sysfs_emit()
in that context.
The call sequences aren't all that obvious and are difficult to verify.

	David

> 
> regards,
> dan carpenter
> 
> 

