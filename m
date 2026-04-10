Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7F381B18
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817815; cv=pass; b=R1hJfnmJr3JRpybqTI0UigJGjc0Cj5by2atQuZ3mSINGyjN4CHGP2HYefB28hY2zFnZdeximM3pHf/rJZ58iZlM4NkbLHDYm6l7unD/AvwmF6ZPy22fJfhtcDG3OUYOlgveBdMO1Mikr8SaGEMvgQumf9SP4mu1ipurRTnH6Dmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817815; c=relaxed/simple;
	bh=dK6d2FA9a77nfb1jYHoRrb6E5MltM8le7HGTiqOX994=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehnWqoPxUablOvdYcQmmrR9VQN5CoCi6TyFgYT+VH67lLUwF7vGzXMoS2KoyAFOTgbbjR0J3LXp1YmgZTG/ZGrIa9d3y2WV0e5hExnmdRB76JZH/yCWYJPAvu/HZC1PhcDhCD5U1F3eZ3uWdz4ZynaVeaXFl3p6txmwFqJX7Ieo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba6h485q; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba6h485q"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso2749714a12.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 03:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775817812; cv=none;
        d=google.com; s=arc-20240605;
        b=PAHNVc29ls3IJyW2Du77DgCMeFqlgVsNzAsHJcy8ocyHfGXJXMh6kPDJVyUcqetCF2
         tbhOJU+QPpLfOlbMULC5+R4LlUiU58tw17Qd+wWSmtdI1MLPB3+wBgJJedbkB6HCo2O5
         UnW7ASL6+Go+yPCPk45LCM5QZ+qA4YC9L8KWnI8jDJkGpgyQqnFEa/cmN3yEcMZsEKOB
         +nmRM9NGjwCTF3XujCZ4WAZdlyY5+hWlFBOhxwIoRcjTitMdn8sKMx+xnv+S0AYlcmRz
         1FNOQZU7oDEApjJH+mPwbCL6Li1urC2949Hh5VW75/POre0KrrKKF8kdV1aBLC1ysI81
         TnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BdoIj5BlxYESHpYC3v+AXBrtUvLBmx12sFmAxpINGgI=;
        fh=IrrTzNhPWtCUxiyWS7hus1mcqZWwH3qecOt82xZJ10A=;
        b=OGhSDtkAKyNI8wBkk/teqXTnubm/yChGvWBmNva56lgbHZbi6hgDz4qnRmwZMxbx6T
         4w4bGi1/SufmLo7CKK/JAawoa6vt6xz7IKmVWHe2QHD1fusYmxVVcbQUcWW/7OeHvT6d
         VPltDRmtjryHN/wn6WQbvXImpiJ8lVAWOesfStc8oapI+eJEBO5fTKa7o+oGt/Y0TMLl
         McGj6bLICp9BPTsiiYz1yVHEktZ3R5DZpDkJV8brnyhivAnQGEx9QgXMKE1pXdTRZ+Zn
         WiZz+pOterQq0zyVYwb8dTgg+tUh3zN+CV2xslfM2ZM4otK0KVMVRGeODYFL5UiRguBL
         PXAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775817812; x=1776422612; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdoIj5BlxYESHpYC3v+AXBrtUvLBmx12sFmAxpINGgI=;
        b=ba6h485qU+tagCZvVG2vbwHGx6dCB65uOVuBR8YmOvcHiQg6Ls6JpdDDy6qrAERWQk
         WZ/dO8OuWfBlXo+GTgRv4JXV/D0rbf/ioodI1kE6StQvg6DHocMJ3PRvoSwRSeWBiA7j
         ubPmHx+9qkOvMH9TXjgjyPTugMbPwaOu1ASoPe07k7KH8ng//i3Pd9O2Z6ZOLos+7cGe
         i0PxNMm/qTRMGmX8Oj+Pw/kKSKUUr8ioHxxwsj0c398QsNwg2nVV3qRRwltTbcBV4qzY
         334JBuEw1zuEe8ywQAf0e9lJ5l6zaJt4Y6Op/gwDsjazL3evhKbBG8dqJTXcrmFajHhq
         d3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817812; x=1776422612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdoIj5BlxYESHpYC3v+AXBrtUvLBmx12sFmAxpINGgI=;
        b=soomY8jEsUDm1E8GWRWwcvj3vNG2QH3Kv1YB9zYscIVEXeqx11KWXEY+4T8M2KuiJw
         ntNJVfv5Ztr8AhgYw46OywXrUURPjKQ6wK/qeBsIJUSs/Ew5ABzW71BHLHkm+oR+/xDI
         yo6T+O4CvLpdTg8n09jfNEYwOrCtNHxUjsWIplHM9pCHjcptGKzCljZw3F8bUUnGZ8pu
         MoL31x1nxF2605f1/Hzt/85s0Aq2KDwLpvZ+3d3na6AAPHf4ERz/h0Rs7vFT2jubr0Mr
         bUyVRheUXKcXIW5xEoMhqAuoIql7oJUjiSRGr0Xti506inJRepaWei0q/Yci651D6uPR
         F62w==
X-Forwarded-Encrypted: i=1; AJvYcCUAaIzyBuUysB/3wbgkZueqdnHa9EcgCAwpL+RplGbe6UnuKBxiAhiGA80UFFD+VYuQtUdTJU5p8DjjfXvz@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn8GK+ZxWbLGuoNyEAgEGYRs/PpKncskePXWAIlCS4Ghv9S/xV
	but1T3aL1lQkldCM6HOTRCi1GxZlC2byajaAX75XFJdwPBrehDY8jQVhIurzVCBkFSbUh5NsdF3
	LQ+l3YDi4O9uDaKcbqGDZi7bqerj2Pjw=
X-Gm-Gg: AeBDietT0KAD+RrWH010PtQGhOhOEoDjLMHB9bKRCp1930DsSm6bQU8RHpELSqIMeqe
	7IfQhDAVEwcwN1tDZQ17U/9e1cgn03eHkBiz8wC1r4xZTJ/E4PjN7EVKWUttn93AzApc3ggqMO4
	uKMb3l0WMitr67U+N/9u1Kj95WbuQmyCufSQxucBDA+mq2poUeACs9ACiIcCdbG++EpUsKWNsNn
	LaofHM2IuacsQKfKR1q6rsvAzHPReCVQZS/RMlIWi17CIffm68Qbhb2VjmtFa2zHIap80MrJIE5
	OXzeA+V9G7+12WeNIRILvTnnBBXo6kkRoJSjsmTVW9i9qYPy4quS15c3rd66KXerZp25dRoFogX
	P/80H784=
X-Received: by 2002:a17:907:e107:b0:b8e:796a:fd5d with SMTP id
 a640c23a62f3a-b9d7277c0d1mr84942166b.39.1775817811836; Fri, 10 Apr 2026
 03:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410100832.1388-1-joshua.crofts1@gmail.com> <20260410100832.1388-2-joshua.crofts1@gmail.com>
In-Reply-To: <20260410100832.1388-2-joshua.crofts1@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Apr 2026 13:42:55 +0300
X-Gm-Features: AQROBzA5dWSSOv5xrYv2iUH2sXBet1J7jbnIYb0CT0Ni_O_MSKkvwnOAMkLfXQ8
Message-ID: <CAHp75VdPhg_5gOZtfsZyMkFf5iZ8-wtZ_2Ta2UaWYKbVzgAB4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 1:08=E2=80=AFPM Joshua Crofts <joshua.crofts1@gmail=
.com> wrote:
>
> Remove kernel.h proxy header and add bitops.h for
> better dependency control and code clarity.

...

>  #include <asm/div64.h>
>
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/bits.h>

bitops.h also implies bits.h.

>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>


--=20
With Best Regards,
Andy Shevchenko
