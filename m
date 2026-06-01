Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D9B3DA7FF
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328448; cv=pass; b=nQwj5atW/E9s3pw5NgM8RN6zIaPDNtY2b4i18eH8lT9gmmMPjrrc+cozIechLMXXB3PkGkRjMzGY6cwpR6VCTVYktP4ibpp/ewQCYZb3zLwd+79s97f0rN7LFqPkJod48xuLMdHJiscMb/8watKqyQWEe1fFrDFMJF3sh+BfcN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328448; c=relaxed/simple;
	bh=a6jPokye9xhIexmS8Tn4JCF6YcGGmi3QWeug6TSTt+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmA5ur6jUo/UL1EUaGtVmwpbuzM9s/vb+uf8m+m9MvznmQGwwhksPQZdxcyJ8j3hXkz4INAXjFivCuqwW+P3hxNPDKyWE8OSvph/z6kaE9GhiE0KyZ6WfZMyvr4kgf3q/wuaf3WuTc/QYSx/wT0rrYgbowfvTpLtPbm/wwc1fFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYomn8Bt; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYomn8Bt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-687d13309bdso2403174a12.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 08:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780328444; cv=none;
        d=google.com; s=arc-20240605;
        b=IlHLsT55dYP/cZSZBiOoaDen6kdczkSSdna0sb4sFfujwAPcPFwkhjDWExM8vjdxRR
         654BzT1whwilELpbjL/pvgwN/RlnlB5i1BM7R8wjMZBDAuGLYIyl5EphHB8g4kinJ2Lv
         n9ygdEiHr4HJTctrd1jvnpy1h4BjXqRmJ2VIWZI9czLdldKgMBr/A4FFw5JRTAMObRzg
         tulI97rnvz7ktAWeKRtlAIrIdoN04sBqVxlGTA/f0ekxfCFX/Jm4EZ99rIwM7tHrpiSC
         CGJExMuSRq1Gl+u3Ocl2pnXlHQWoYukLR/u7xAkHIaW3bGW3XRVIWtQAZVGFUyYKD9/O
         itGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNsmtknaI8lnn5B+o4e9UU/fZlCkeKNAZZHydElBsGE=;
        fh=qYYy4P/mwFoQeejU6qABjG9/1WWs1c1SapMl/JBj8YY=;
        b=Kb8qqdli7T0+m6rAvMd8C+jVLBbNuyj/IJsJ5eVQ89Cvc6SkC1PD6pmXbhdAWpmQwz
         uhiqpedlKSrMjcg6zCWRul268r2NgSDZYcUuBMgclu2LkDCouf7EmRH9UdzAUgFQ7oD5
         RjA85L6qaLGnoWr6iax47JaNm7WoABmyedlvHdBhBFFWNIEOCTXSLaOw+Ckw56kwpgZZ
         eOAMtHIDzrQLxHKjgMN6ZTP2fuZKvuCjNZDJTM91XyLLodOCEBsX04xbjyccv6nI+b1W
         IpeBVMAnx117B2UGqgIzRy7EX/nWVq3ZA1PsagnSv52ra9yj7yrPNFUdpo81CSFSqMQQ
         Wwzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328444; x=1780933244; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNsmtknaI8lnn5B+o4e9UU/fZlCkeKNAZZHydElBsGE=;
        b=GYomn8Bt0t9VLhGftWDKoy5lqpnNcMQm2AgSKI+T4CjqiQBr3WlrRu4x3lOUVPVGwJ
         5WMNwX45DuMoDKgimaDOm/m9o/XNeBC6IPO45DLw4ALJ/GFqBz5piG4upzc4/nLNF6yO
         56GwQ5HNe4ehfmNb28OTU9HObgXezRbBya+AQmg9maPDxjZtR9lngzkBNcxfRUMhYVx9
         zJrL0StWHaI8xQr5gn8W/AwAgVyr3tX8n/GKuO8c+OJsFnotS5L3Hmcw29YBAHd5PKr1
         eJvtBt18eh97Uh74SDYWn7CmMs51qC7noeJudfqV9lxTWfpwThZJmve7eBs0v7aUzE73
         am4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328444; x=1780933244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNsmtknaI8lnn5B+o4e9UU/fZlCkeKNAZZHydElBsGE=;
        b=g6WB4eMcV8Uh8KeGlSqgaV/mMLaTm06kgzr9nFib0G/HuY92KTmKOWlL1pyHQ7VmFf
         XMkIoOa4jjYGn3DaRfJYxXcmB9Y3/vGHBNKTf8+Sxj+zqFMKnSrVandJE0OTnzeLbTwC
         rKrKkksmCSvXAacJoTehM9GdfHubvKDI+aVUBDQdyhqccFMoBeBnRzo8Zt8qP1zvRAQ8
         LQCHuhcl3jRQXoi9b82eXX6RkjYwrRdLBNK2jgb7QdNHgyiey9b+7J9VmVHRz+08HYoM
         ZuniO5sT0K1T8DMFP7dNwKA+pRB4JAmDdZhu9zMdwb1EFeBTujTYtlpNQCqGzfVouvVU
         9rkw==
X-Forwarded-Encrypted: i=1; AFNElJ9D3CjS/+ENahdbS+4JI2VSO/xxKKvMY+LijMjntYc+5eMlt4QSKZWyQkYBa/wYDjHx/m+r9nZYyeDb0Xo6@lists.linux.dev
X-Gm-Message-State: AOJu0YxyT4IQ/E0KNma6ztXTtiCHbd1oU6tjy43LfhOtA1PwTazZbIzG
	5Qbt7OW5xHLuy1qTwael6s9nfwG0JldjwTFahX3DP4DcvkA8Hm61o6bH7cEQRqE6xQDmr3zX6ye
	QHOfkcrC3pUU/KjtXuieDPOap+gHcES4=
X-Gm-Gg: Acq92OHEQhmfsUjcRWEGbOoWyW6W/rdybj0U5YPXxFfSZQYuCF9Kbh/RateFm0otXds
	5vp2/OZmpuo2bDvME6/ot+oL9+2njwj3riF7OFGsV/1Zn12BY8cf+VLO4Iji9zzTmzZGk9pya92
	/hDNFcI2AOExxYpTZNmwFDnKOYMBpHdMkfdpwFH8udBj74GsH1ykHJ76hybvj05H8CvW/Dy87fJ
	YSIHli3QAI2y/hB5AqJSjtOAedmTcGqMn/ZGCOvHQlYRdFocYzEMwJn56oyQC4511H2L5yo3z/r
	TE91ahwVkjCBlqmqLA==
X-Received: by 2002:aa7:c61a:0:b0:66e:4395:e920 with SMTP id
 4fb4d7f45d1cf-68c8cd241d0mr1749690a12.7.1780328443771; Mon, 01 Jun 2026
 08:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530173514.56640-1-tahanarimani3443@gmail.com> <ah1u6r2NemqKd2k7@stanley.mountain>
In-Reply-To: <ah1u6r2NemqKd2k7@stanley.mountain>
From: Taha Narimani <tahanarimani3443@gmail.com>
Date: Mon, 1 Jun 2026 19:10:31 +0330
X-Gm-Features: AVHnY4KolE2yhOx0-Ro3MWDZW28K-XYZipNKjcVxcCIa0M-ullZRHUCewl_IrV8
Message-ID: <CAEsNvj8KrXjNez8s-2hBarMJOen-veS0S3w8of3iPOrT5hoUkw@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: adc: ad7816: drop busy pin requirement for ad7816
To: Dan Carpenter <error27@gmail.com>
Cc: Nishad Kamdar <nishadkamdar@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - INDUSTRIAL IO" <linux-iio@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you very much for the review and the excellent suggestion.

Using devm_gpiod_get_optional() and checking for NULL is indeed a much
cleaner and more elegant approach than hardcoding the chip IDs. I
completely agree and will implement this logic in v2.

I also apologize for the corrupted patch format. I will ensure my git
send-email configuration is properly fixed for the next submission.

I will wait a few days to allow time for any further comments from
Nishad or others before sending out the updated v2 patch.

Thank you again for your time and guidance!

Best regards,
Taha Narimani

On Mon, Jun 1, 2026 at 3:07=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Sat, May 30, 2026 at 05:35:12PM +0000, Taha Narimani wrote:
> > According to the AD7816/7/8 datasheet, the AD7816 is an 8-pin device
> > and does not possess a BUSY pin. The BUSY pin is exclusive to the
> > 16-pin AD7817.
> >
> > The driver previously requested a 'busy' GPIO unconditionally for both
> > the AD7816 and AD7817. If a device tree correctly modeled the hardware
> > by omitting the busy-gpios property for the AD7816, devm_gpiod_get()
> > would return -ENOENT and cause the probe to fail.
> >
> > Fix this by restricting the busy GPIO request strictly to the AD7817.
> >
> > Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
>
> The patch is corrupted.
>
> Otherwise this seems reasonable enough.  (I haven't read the datasheet
> but I trust that you have).  Let's add Nishad to the CC list since he
> is the one who first limitted it to not check ID_AD7818.
>
> The other way to solve this would be to use devm_gpiod_get_optional()
> in the probe() function and test for NULL in ad7816_spi_read().  I
> think this would be a cleaner solution because then it works based
> on the device trees instead of having to hardcode which devices
> have it in the driver itself.
>
> regards,
> dan carpenter
>
