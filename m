Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2F931715F
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163537; cv=pass; b=nRKvvbcKTRy79wQXj7PfeVURYB4D+L6ZwV25Ius44YJVYMwmKSQjnVlD/L/ft45Iu/gQZpVMk38ahASuzMPAB5K7wTPN4+Uj8n9BxxTb6V0hR2lROMqStnhVxakpcaelmKKJdhJO6tgLOnfN7ywDhzh9ipi5VkBQPP2jrBilpuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163537; c=relaxed/simple;
	bh=9c8EfOBKVWCBWGoY4hxNZu+bpMz4uZpM+955z4w3WUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcHZMXRUKqlRV2IDtEZvw58wYizHrMZ75PYeRZFuH2wPJziMXCumkvu6FCu3SiLpa+64TA6xjamJlSRuvMvUGN+Do35Xy33bD2+vXRmMHgoylzieUeiUeOoe9L7ojaYCXTozqixTduoU1bZsgbiMKFEKfKpMZ+IraIhJIYJGE9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMnUMX/e; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMnUMX/e"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48896199cbaso57870045e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 03:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776163533; cv=none;
        d=google.com; s=arc-20240605;
        b=hxRRIoCldmNuMfJ0h1LNfPzLtfE6yxQliYRdMsWJH2vdGbxUSGOEr0Y/qSPOtNPwnE
         UzAoVz+F/kbnUIfM8LwfT1gmOQhON0/aXNnxw7LXz+ru16L0ZYqjofGOB3rYq/oahXV3
         rZ301cKfMv8xdcUhRXu/bkWJYSD1lfveomFbAw0a3LuJDzePC0IlWOCm4VvzWrsR67oo
         2EwRgRKfLnW7hlvtnA16hR9BDd6sTtT2cbvs2v89Rk+yp3lWktoS2mdxb5Xvuv7Tzr5T
         ub4WIsI3hr8LoNNKhx0kcXjWbvCnbbKVi+6XlKBor7JchjOZzjLAnn0fzr4SOCldjkDl
         XVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K7OuK+aVGpNAh53CpkmCGmxWFR6Ssi626NtJfL4RDaI=;
        fh=qnrc0b1znPx78g5lIU9z5AWL/rnDbTQ0joM34XsnW8M=;
        b=HDzO4cQu7fVh/AcIVBCrfqWNrLPCtElf2SVXrlklmO7gi9EqYqku96PPnDVNGCTH6A
         FleUxq26x6a46WzvStrSYhYWct/iEcs5kiu6rVBqSIosKNZXY46vTm+FFpsazVgYOwsq
         Cswmifhcok0bNv56dww1Gngf4lYmcXlfdxMGAWH0yCpJrLdWBlQM25+0+06bkAEWltX5
         teBpQV4k1T/c2K25m7/IO5apuSUTyUa4lbu7E9RlPT73d1Ldl9bhRw7YmieBOnxyiznk
         0MrWNR6tDhrEwgQ/IRZpQlVck221Uo4x715iO5W91utGeFRmr2EHpDIPAi40zdnWBKqr
         8Y9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776163533; x=1776768333; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7OuK+aVGpNAh53CpkmCGmxWFR6Ssi626NtJfL4RDaI=;
        b=fMnUMX/ekUbBKnCmB3ohR/Frcbs/AT2qbJ09K3M0R02ZskSkMg+y4sT8MH28wApScD
         rPleqt6DT7UQHDJE42ycoltQI2JmlCc9Rl8FzxiPrHPLw8jiI9fiYZtvs+xA5cpp9ylm
         icwTjlWODXQTO2A0s0C4t0MKu19HcCCZo8mzgQRshZEtQqmbrSe0SvzO3f195knP/dw8
         Tirfx7WCvISJGcgRfyhgffEbwgTZ5CY18wwP2Jw1XAWLsI4w90lBAsPCcjiIfWp7bO7g
         uEpLCziq75xuAX4nx07lHJm4uiENKnVfnbdAi50t4+LBATQMuVJYtLR6gM0hCRIyZY2V
         b6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163533; x=1776768333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7OuK+aVGpNAh53CpkmCGmxWFR6Ssi626NtJfL4RDaI=;
        b=eH4hnm9TKuViThtLlYyIlkS8YQcSUhu/kYT+daCCUFbhSFP+x9oT70dlx5ye4MLnzX
         YHqvvWEuy8dXaVXSYg/FUs7G73HwS71hWwBBAKW6sp9UKIHymEByAAujKeeuAx/4nTrH
         vWoTI9wYtpah4QVppjnj9t++gtGih2olQJtT8JXllWcfp5tI2lym9eZupJqnmk4pwPct
         pv1H2oYnv1nP4kTo64cqOCDrTwaB1hrtOXoxCv/N5TCHTdDd2bYJEh3pF+VE7JoAskOT
         BFpiZ881h0z38C5ICRQyLqox0w/mMHsCv1aUbM2HOiwkYGHj6eOEuRN4Qv/h1kuDtlwe
         BTIw==
X-Forwarded-Encrypted: i=1; AFNElJ8HXF7OBohu+gWxFkOxNypkuwcTSDQsFsfnm7r20jm8JkgJdms/N+7eG8AAjBOTx8q+k3YkQpRGX9UKI4Je@lists.linux.dev
X-Gm-Message-State: AOJu0YyCOMhdcr22SKQwrmjdH4MO3rj128FkVN0FDHVv8VuuwsZ5LwiE
	thOw9t36lbmOi+be4e5pBhP0oKlSr0CH2w1/61kKhG6ApIFoGg4v+NfdbW+kb8uGYReboJ+GvaX
	oVehmUnBuhY/7fbdImY+/u1u07VozN6I=
X-Gm-Gg: AeBDievf91oFpyrApQbDkAtEAVycQ8zqtfUBvX+iIBS6q3VsTuerEr5SyRDxIUm8L0V
	Z8ljf4tBllf+AHmjnjtcxq5CsRZNXqC3WueBFmZqi1+I7NhD4jY7plI2BFKPFX+AM2qfGTktNuQ
	F7AxSZJvDhKLg6Sohf+bOjrGdnZlQrXaVfcEP35DBJtgWkIa3fsxX7OiJki+Zm3byqnJo5kG/W1
	9vW4aOnU48TycEZx0CwEz+dVOYd4DNBvs114oR/btkedfBQpOpd2tg9ij2MbqRlIsmuH38vn0rE
	v6Bmo2gAlXZczt2YlOaIENXaf+ZpWRw+4hGcEv+ReNVlA8NP06d7xjbN95OHYh5rQGmQaSc+wvT
	Eg+QLhHFog2x7fMC8zyUd0fnE2YjQM8qHH4AknfrbTA+FQu0UaHWuR+kRF296fx4ZiQDm1XGRPf
	nnkth3BMcOITbRkzlT
X-Received: by 2002:a05:6000:2888:b0:43d:7403:4b59 with SMTP id
 ffacd0b85a97d-43d74034c07mr13626973f8f.5.1776163532850; Tue, 14 Apr 2026
 03:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
 <20260411123512.84739-3-joshua.crofts1@gmail.com> <ad4MbnpAfBEXKDzm@ashevche-desk.local>
 <CALoEA-ye9aKD4DyciFNZBW2TSd=pw162DD28rdvRw8O2OJvcqw@mail.gmail.com> <ad4PbCcHUMgjGMlP@ashevche-desk.local>
In-Reply-To: <ad4PbCcHUMgjGMlP@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 14 Apr 2026 12:45:31 +0200
X-Gm-Features: AQROBzBCYnUPKmznzAlZXKh20fQkIPkFpMi24LxnRlanejQbHOJKPxi9ADg3qrk
Message-ID: <CALoEA-wfx3=eVq=omiNmDeSaZpNP85KZd32A=GBiU-DVZ6btAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: frequency: ad9832: simplify bitwise math
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 11:57, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> It's up to you. (u64) casting here is not bad per se. And it's more robust
> against changes in the second operand the type of which is hidden currently.
> (Reading again what I just wrote, it seems I objecting my own suggestion!)

If I'm not mistaken, the compiler would always do a type promotion of the
"smaller" operand (in this case fout). By casting at this point we're just doing
the work for it, so I guess it doesn't matter.

-- 
Kind regards

CJD
