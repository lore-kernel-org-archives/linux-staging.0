Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76D3624A8
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776420324; cv=pass; b=WkvpJ3LnhOLYZoZe36VNF/fDoIrBl9C+U/o/mN1Q05vMxiv2wD0L+GmwLfkhm/OVpxKKJTanxqncpOFzFLoWN4ql1k0ByOHm885Mphu314tT7E/mtexnMWCkK6q0OF7u6tnHeCgTu9GrztF8H0rxr5y7Qzs3H5p2LzWYQOdIx7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776420324; c=relaxed/simple;
	bh=+7oR4wXUnn8Gaj0KwrKTZhj7xplX1SNhcNEyEcGuKkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A34RWQ/AM1rF7TprDLDCMTg+IRHQdyc0BnB9VqG4D2jCYgKz3daNGFTB1HMSAUjkY13r3hwYLK3nwwjAemW+Ikfki2pe4AmcJdCH6YL79RiwSRSWhrl4wwwnkw7KHDYWZ/jIXilJXmQWeocpMe84HD+E80cxJEElkQOnP7V0Pzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUp5gV2D; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUp5gV2D"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so346446f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776420322; cv=none;
        d=google.com; s=arc-20240605;
        b=O5Dddu49HV0PHCLmEwc1W8sIs/X+Y/p8+T52kVab+XIvPFEctjr90FWIWLy8kvwkop
         02G20GZOAZy7AxQxyiDlDoNXJUcFD/sgKw/AqYRmk1FUsDz9ZXZndzjf9zD5xwKw6+ER
         eATlzeo0/YOBzcNUJSIt31B3bH7N5wGPBsQVpa+NAjH+8sqzKIVVRmyWeo5I9QqVEVeL
         D9UOuNU1aH0PooXXejRhrCvbzH1Cm5+iQhbCzLNSMNuNL1mk7pl9vXJuICAHEy0qjgR7
         yUrRRvx4D31xz955U63btCBtKXXe+7ozOiknljTf8pzFviEvEQHGs7RbNbBKWYcdLiCF
         m1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WHpdlUHvf0JqP8JKy4n96Wp7a43y4nLGj3BUPXsQMgY=;
        fh=aSIVSZNuDU4fGmyRBt+BSFPiL0mfI4Pe2hCGnjKu0jw=;
        b=KkTg16TH0Z4k8fDoaq/VnfYVFdC0VGm6W0IgdAmY5+enfDoZbfXjd+DuhlJnrW/Fp2
         lcDzTAt8ZPrv9I+VMRxSq7hih5/sJS5zOVrAEybYFQJq66HJvVSbVUMXDkL3U9zNksvA
         DKZGBcZD/WETd60SWv5izzg71vNGFn5n0Yp07yZAhtR9rU9rT/tAFbsKXCj4vt/ZdZvw
         7ZFcqZZYQg3W/xUyfLcJ1MbRVTZFvUaO86enzUuZIJOq6sIfwWlHAoSEhYgZV7eqw5Yc
         g6jS+kFdp4GYcMmSewUw58k++6YtanGB5igNCcpZcqVkmQ5onT8EfLFLGn/wq4TTqAmx
         CncQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776420322; x=1777025122; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHpdlUHvf0JqP8JKy4n96Wp7a43y4nLGj3BUPXsQMgY=;
        b=sUp5gV2DCUDxOQ4avFgQ+mO9tJzjLTqnnxdFuPtGzM/wmy1uI3dIqYDMQBO2iXtnIY
         sPqU/S27Daq8WPTzEWeTHgw/0gxnO2wDxyta3ldizK/EuffTU8aL+PipA/X6+A8xlMaY
         cibwRrog7fkbNt09jPvA5r8Q3ntUh+rUnogQ7H9RnLtwphrGzqtzYWCBj3kSHI5oEfZ4
         uoxYq4KNE1cUlb1SCQwVCHlwpaa+Ns9lv8kS9yOY3d8t8KOp7y2IT3/vss6bv3PKD1IL
         GKXqbpvPfaylrZ7qwp6TCp+X2xIjaufps82NDY6xi6f8yumFiwPzVAExGQt/VIhXOT0o
         e8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776420322; x=1777025122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHpdlUHvf0JqP8JKy4n96Wp7a43y4nLGj3BUPXsQMgY=;
        b=k3/905aonKbYAphoOWl6CZtsYmDA+IzQ9Ikrpug7pd7e/U//mRc3TRsBsVxySuPTLk
         uq7Ym2q68tJf4BTYSRUbi79iFd+hywgmHVnUm/NQX+vEKOcem4HSxsAkiHiTLZ5WGkao
         wTozPHH5ntRQrEepqBKS9ZMEJHFQrNAbjDvAcNlJI8FJwRzhcAWZ1JelGLNfOgu5SM3T
         A6b6pbS4YqqWMw6knJNH8VExX3CDGJAek2lEhevTmG3G5LGwnyiLRLqakRfwradqDSAI
         VSortOGoZhiFUVL1DW2BdvtxuFXNhTYRA9l5SX/rcz8f0LnNlJt5WQVWNE1VEJ4LrN48
         UnkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+A1kkZ/q1hR5qrzy9/8tiaatNAj4SzA3YuheUuL1lrf/rqDrFWiUX19ER/7KOoPNVmyDz8ywMTwzYugwNE@lists.linux.dev
X-Gm-Message-State: AOJu0YwUoBqqNsK3zi8nusf+jfAbpAoXDSVh3uN/aY6U2XZ2salv6VF6
	C0Uc8PwqNe9ALM1TlhCCcXlWwXLuZiyi7zE9Zh06l+YmYMarMvQmzH5HHFZLUhBHNojLVYGhdR1
	Oc1rDl9WKKEbdnY3jI/Q3fxwp0kzzfQ0=
X-Gm-Gg: AeBDievFRbpYconqQDATkJ2rN2mun56rrLakyYG6jPnmjRqYd+Lpx07vA14OE/+nII3
	VynqGW8fEPJpsvfJFIxOTOZrPdkcrzTUtw9HZ3XkZnq0OH97zcr2SYy2ep6rPoQh9i1ALunZbMW
	W0P9MGlbzyplanh9yDD4nUH3R/POqYI4qNpIQj18cplMu75cChWXkFn2U4p54okx3Rysb8H2xnv
	oKdWdS5eXxrSWq6QR+6T7kutsDIFcXMXckSFRF79vfQFJOwevI4HQHhBR1usQS8Vj+tMXbN9rO5
	uMFxBvAOzlJPG/FzrmRFM2TiO2wpAHEAb9qWsVjGds4tlxJ+1BqiXjA2zJM53ophRhSHAWvzHOQ
	4qtEQKkt8017mG/rhFQL/2B3aHo+amgBtDlIkhn7VfjjpumukpDWMkzXr2UprTKm36iYUoMkmwK
	jqtQnlL4JsExniZztN
X-Received: by 2002:a05:6000:40cb:b0:43e:aa43:243 with SMTP id
 ffacd0b85a97d-43fe3e24eaamr3235593f8f.43.1776420320937; Fri, 17 Apr 2026
 03:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416065118.1299-1-joshua.crofts1@gmail.com>
 <20260416065118.1299-2-joshua.crofts1@gmail.com> <aeCe9Za3aGPiRFC1@ashevche-desk.local>
 <CALoEA-wTk+32wUv3M_wLX-+4Fi=6BjLh6UsRZYqQM1Wcf+-+5Q@mail.gmail.com> <aeIEoJnkzO03Rz01@ashevche-desk.local>
In-Reply-To: <aeIEoJnkzO03Rz01@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 17 Apr 2026 12:05:09 +0200
X-Gm-Features: AQROBzCuv-2guxSm5zgImEeJHUB-bHU1_mWumwCgD8f3XtHrpLE5GMtbr-NeQDc
Message-ID: <CALoEA-zf2sVtH3OgauPSTy9O1xaXrUKNHDBhZ71eqkMn-9XYBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] iio: frequency: ad9832: remove kernel.h proxy header
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 12:00, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> I don't see it's in use. The pointer to it yes, but it's a huge
> difference.  https://en.wikipedia.org/wiki/Opaque_pointer

My bad, that was an oversight on my part. Thanks for the
clarification. I'll send the updated patch soon.

-- 
Kind regards

CJD
