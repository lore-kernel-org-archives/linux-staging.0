Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3B30C63B
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523035; cv=none; b=EkS4gyWN9zf7eF/MfTy37spdHm+9JdqnRwD7nRKg7rw004qtwqmZLJBWogEmPAYch40nmEwiy67NMQX68tPISOnE6+SZIjavNQ1a2Rr0LUk2JMJoru1Xv90NvuygCwCEoHOGrnWDt6ZqQkf0w2PmDJ7GF4kkteAGBs6uKWkMYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523035; c=relaxed/simple;
	bh=w8BX+04mMRGn5qx04C47/UBHm0OIW9fsMeI97Zgsy6Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=n3Ny3BUSjMfeEwg6XP9yDM87k5LCSUPzqs3rD2ci6hf0EvUUcsgNlkF5WIdvQEZNSafEudLhdBDDaWHSLxnOg98teiHitZvxVYw8v72uwgN/pyy4/rlZY04QqSC3G3717HqCNzm8zHxQTlNU1VilfXpanNX1Usb44HU0bqRbcTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqAumFMV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqAumFMV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483abed83b6so43590955e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 23:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772523033; x=1773127833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8BX+04mMRGn5qx04C47/UBHm0OIW9fsMeI97Zgsy6Q=;
        b=LqAumFMVJErWu4Zrft5Js9vyLFIEg8a9brNKLlzC1gsLqhxNgPACxaf2y3R9kK5ozH
         gdAuuY2qGGpSrvS7Vvxdur8mObQAV9EYqyP1H41tAEDWTbDcT6JGBCmLmvs85K3xkKsp
         HCsRbx2+yzTDW841cyZWPi/NVy/4y+cccS8OsG///ONMZZesjbf2h8YnZOvg8GDz3sbM
         LK7IEE7kU90iVWEL6uo0SHfxQblOCZKJGPuLSQwnEJ1HtQsHHtKlBHc2a5gLVDJZfOo/
         /qdBE73ME8eJbS3DF7datKMchCvucGtpxRzWl5i5jWrJNEK0o8cT5Oc/P0UkbAMwdshr
         MIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772523033; x=1773127833;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8BX+04mMRGn5qx04C47/UBHm0OIW9fsMeI97Zgsy6Q=;
        b=j1sa0Y1dTYzQdj8Uzr28sla7Arr7KPnZDyXvFkaywbndfj8Pe1uJ2sbO0/OfYCXxn7
         4RCu1eUp8SCfNBkuEQTON5U0u+oU+3apon55nekIphwhQRLqPChFPbFDGvAAQB5zq1Fc
         bLR6x69Ygb0Csa5FsBh6t+zzJdB5qJIa2ONYsqwfnqZuT3H9RkJqqR41BROeY0C+OLsk
         0kW/4fLk5FwWqx1mBgZbGBb+YQ8N2tO0qEUSzAY1waLuv2TQdKcMwxJ4w1NLdy9XUlnk
         dcL6gqlyjHDOitanaK0KgXT/QcGXHlfZ1ZzbQvO68WmP7s/snUz8FSS/BTXdWXqo6ynU
         PDog==
X-Forwarded-Encrypted: i=1; AJvYcCUn2wHYa+/d1qviNj+CeQiQzOWQHzGzJhS8CfQ6FjmprDoCi8q1tSKSSXTqs2FOwUhrnxoVfcdIPZcl0L5q@lists.linux.dev
X-Gm-Message-State: AOJu0YwsWTo6gOL5nuZwb9VdRPC8fKd1Y7YoMRtwW2zX0o0a3GmmDkky
	mcALbcoRS43mOBbRm9Mz2n3w4Mlc42LWPWQNpgrrp/9KJRQGiI+stiOe
X-Gm-Gg: ATEYQzz9wF9nktGp6xchB7cAFPDiyN3h/mwPRkgGvXRV8S6gEA1uQHXCN0LMasQUXxa
	nO+LJppH/N/RuN8yhxbL4SwtyVlT+1HYgrZ2br8IsQ/uuiUqcxY3CMUBDi6e25zUxadWJ5c7Bko
	t2fEL49HpziCcbRgoqqEbzWokaBEBolAX5w7wTz/bQ9bvvTufdafG9IffIgoqMdsHISHVaTwTbL
	UmkzAp/F8GmxHZ4Z+3vjPcT4RV8gRL8qgkcPniB0yWsLxYZ+VyF5q2oXiPAvvio89ULF0O8W7zL
	99iIO5PwbZlENtkpjQIUIDrnf5WxmVULhKyAxw6e1mtXqd8J6XvSnKFgZJgdZYf7Qc7k4XsvRbH
	nIv9CsGodWgRkFBhh/0ckdIF7/fAzl17yh63kwO4ENzsviiInyUhOq3gxe4gTAPra4sE9XN11Ym
	SD7LE1WKEvionFllSm
X-Received: by 2002:a05:600c:4715:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483c9bfaf59mr226153445e9.34.1772523032622;
        Mon, 02 Mar 2026 23:30:32 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125b7ed0sm22166125e9.0.2026.03.02.23.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 23:30:32 -0800 (PST)
Date: Tue, 3 Mar 2026 07:30:30 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <9fc10794-0ffc-49fc-a220-bd911390bc59@gmail.com>
In-Reply-To: <aaaNZ99qFZ-1nB6I@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org> <20260301214815.2628942-5-objecting@objecting.org> <aaVEsCIacXl-kuxa@stanley.mountain> <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com> <aaZ7QfW7cFAJ4m0R@stanley.mountain> <239a788f-7ed4-4bd2-8ad7-8d0783bcdaf1@gmail.com> <aaaNZ99qFZ-1nB6I@stanley.mountain>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <9fc10794-0ffc-49fc-a220-bd911390bc59@gmail.com>

3 Mar 2026 07:27:39 Dan Carpenter <dan.carpenter@linaro.org>:

> On Tue, Mar 03, 2026 at 07:02:19AM +0000, Josh Law wrote:
>>
>> Lol, are you gonna approve ANY of my patches haha
>>
>
> The life of a kernel developer is full of heart-ache.=C2=A0 I recently ha=
d
> to redo a v5 patchset because there was a O vs 0 typo in the
> documentation.
>
> I believe you resent all your patchse in this set, right?=C2=A0 But the f=
irst
> patch is obviously auto-NAKed for not having a commit message so that
> kills the whole thing.
>
> regards,
> dan carpenter

If you tell me the patch number I can do a commit message

V/R
