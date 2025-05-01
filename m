Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FC1F3FE2
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746131826; cv=none; b=poZsCA6NcNSXr7UDAguaOpUPc8Bujmr+DdaBwyQjHdVrXwWomPBMsufmKnJIswprI0J9rZvIYhqPInY8iSoJAlP9Cgyw1y2g35u2QTfwcXitVY2Zhdo1Bx9e4HazIsERf6ZKIJNDrGmxovGg0pHumra5lRrOYxQPVzqRiX1ra70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746131826; c=relaxed/simple;
	bh=fTWEiaNOb/F4D5Hd/s2szCTKproSRxpCJIn8b1+jUJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2SbZJaA76xhREWqb4ddpVYJVUCqWlB5SuhxlR3gdq5+Pigd8kRW97PBCzi2UcPZWyUkD07oR4ZW6wxFlzruBYVCj8doYtdJ+s+GteyOpfEJ9BihGeW0w5XZCJVjK/so89W59X30D1IyicT9HrVVDsKFW3IKFZ8CUf5rRgyxnds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQdZuJwa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQdZuJwa"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb48bad09so229843466b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746131823; x=1746736623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTWEiaNOb/F4D5Hd/s2szCTKproSRxpCJIn8b1+jUJw=;
        b=bQdZuJwagqg+qdZ7awvn+kKtpiy4djpgh+2gKVwASqcFiwx6wfRnW3r3yVpnT1rvmg
         6xjEveb84FqY/frrbWxQNE8TTsU0AiSgEinUxIlhFGH/qwnE0lDBl++AyF34TD0Ev0SW
         7cnrn5kr8MAcoy1KA/SVTAWT2oxVxRLirP+Yjy2NKLO6+vAd9j2lE4uOmUlFd+TEHW28
         cMcTdHt207Ab0FSlB0DGtE39mGTeVB8alYCcpAMKJnc5epkTChoBKy5/uF2KNV4sMVqs
         7oeC3uOrzerALDimMZSmivgmz7/oBkMUWbFwdfVOCfJ8GcDoVw9xWu2sNg2w+BKfSlDv
         kyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746131823; x=1746736623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTWEiaNOb/F4D5Hd/s2szCTKproSRxpCJIn8b1+jUJw=;
        b=vUQb55XPPDK8tuLSnYYqi4KdQ3RnNDvXah4uWvlIsRF0XtaKtzSO6blGP4k2+WeFil
         wpveqUWi+wf1tglX2OFLa977KRJaq8QKFT6qBI26RfCOGcLv1Hxo1IMi2Aa/+azKNGe3
         UnyZPdgtx1rxOkib/V1qZbGQreUqKXYiG+ff7N+eTiz6BtmrsFLXVJPAARQQzC3hqtiY
         s6EuFYrw76eUBHdI2DCNFUUJAJANoxyeW5N8oZjCj9pGyGmP6ZcVBA+zmeuZP4xRxrPC
         IVA44I8O0CiyaagBQq8Umpwwv2aJMhUjeWVaQr5bn17xAOxbyGE5D9eDqnhBqdFZCLW4
         qLvA==
X-Forwarded-Encrypted: i=1; AJvYcCW1QpK3WADk6Ed0ry1gaLbNIuLp7xI6AdVXQPAbAMWhLQPcr7D9A1NfRryX6oZUKq2OBb8VJk5PtITY4JlA@lists.linux.dev
X-Gm-Message-State: AOJu0YxmczjqXd1/Y8Es8cl5m2wOFQRzrKU5edNRvRUspgHMxrRUtA/y
	aXdVFmvEAQZ0K690DRF4sjm4FGSlEPHbY176o8zlcZxT5P71Zm6vV/r4f5SWq74wJTooCdICdOk
	Lrcx4ibDkyQE6S3kT4Nts6ApezNTLSW5T
X-Gm-Gg: ASbGncuw87v7w3LC2LyAnBFynmIFFsq1XV9Jz3xQjAtN6RAiPEuwbt20udPOb3pCIWt
	UYbVlV5bF/bZ3xW1+THQ/sy6wgpDPqcF+n1PE1cKi/7IkcgNaFLgRWE+YlNUm3V9qEo9rMQACEx
	6V4uwKP+4gBf6Gi8Wie2UwPA==
X-Google-Smtp-Source: AGHT+IFi3ZJ0cyCsUPOSVg7wV4cmaQoS+bQLM1NAGl/uGTL0DGCU5tAfhJcmc83IwzNNLpXdWE3Eog56b0AqRyd3zyo=
X-Received: by 2002:a17:907:96a5:b0:ac7:81b0:62c8 with SMTP id
 a640c23a62f3a-ad17ad8e23bmr55505866b.31.1746131823099; Thu, 01 May 2025
 13:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501134312.104711-1-hdegoede@redhat.com>
In-Reply-To: <20250501134312.104711-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 May 2025 23:36:27 +0300
X-Gm-Features: ATxdqUGR0Jxud3XSkMswymw59Gt16oxoBwd141Cyu6-0Bw2-gjYv2Ga-_rujrkw
Message-ID: <CAHp75VfnD7Y9Vexyex2iVnHYPzrSfLE_W-hB_-G9A+YCgZ2nvA@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: atomisp: Add support for using mainline
 mt9m114 driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 4:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> This patch series adds support to use the "mainline"
> drivers/media/i2c/mt9m114.c driver, allowing us to drop the atomisp
> specific atomisp-mt9m114 driver.
>
> I've things working nicely on a Asus T100TA and I'll also post a series
> with some small, necessary, mainline mt9m114 driver changes soon.
>
> Despite the mainline mt9m114 driver changes not having landed yet this
> series does already drop the atomisp-mt9m114 driver, in its current state
> it is not really useful anyway and spending time on fixing it up is not
> productive since we want to switch to the mainline driver ASAP.

The last patch I like the most :-)
The patch 3 seems to be done better (by doing some preliminary
refactoring), but looking at the bigger picture I would postpone doing
that as there are more important things to do with the driver.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
