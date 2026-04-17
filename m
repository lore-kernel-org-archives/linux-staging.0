Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3488376479
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411292; cv=pass; b=JXf/W8IRaSXuBIYEACf2vrN7lxaC1r9h+IInjbZoGhR6rZk4/zSCBA+BCsCnf3+yW3NGHwlNggA6qI0XTkhQD4Pd5oPCgSGfB84D+T7/2jDTzN0w1Y1hXfAnUiRVpVgX6UV2hwisymJyTWWNz1uQ774fWBoTOuB8baRofpV8aiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411292; c=relaxed/simple;
	bh=c7f4ivgvUKZHgMVu0TQuosjS+MtcsdeUVE7bDMVHgIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZeTNmZAujoWVuJEf+tAmCXUfRevGjXRV2lk4dHlGKYA/06gE5rQzO9rHvS/2kSDDjC5uu3nmN0E356qH0+yhxp0vCwrBUHXM4E39u1vZ9rIv4QUuqbMOCBdgvh6e/TRM7GviM1tLvUUcKnechwQDpHriQ9rnxVFdMsG1OqGmbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCdCqzw8; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCdCqzw8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so5578975e9.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 00:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776411290; cv=none;
        d=google.com; s=arc-20240605;
        b=P7aYIVuuI/5bO5hmMhL/MASPirWk6z/5SWiPDF8Taoudikc4G6Ciz9Kj1Mks5keE2K
         XmrByVaySV8B2ARW5gLAHCvJI4C4nT6AZ+MctbpU5oJ66446n8Ctr0ulYO5qjb9J38wV
         gNPGIxsrIuLzTH7BiFV+OA9pmONimQAtLZpVT9zIlouPQa9kapZtlUSw3WCMF0rxP4Km
         7IagiiZCFWnDK5iDxjZvQKwt+SfuoEbHYxlXz/H3YdcmZTPzFb4SZOZlL5mEoD7gDt8j
         EzF0vpCdIiu2qT/ay8AiGvAc1WCbjh2/MZIhx001AB0g9WpKiK1zvWObH2Il9qq3RLu2
         /CaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x3l4XNvjOw4u0UDeeZ1RDlU1MbBbtQ9ctu1Rse+ApZA=;
        fh=UYehl8r0RsFTMTISZRcNCQL8wpOtvYB5oXEqdVb2gZc=;
        b=T4yw6id2ETbat/A1tjvsaxd59R/285OqaYvgSgMmPYpCclzJNyPB3Fs372Ny8LcDad
         wDiFQfYUgCW1LQ9oz0OA+KSDiw7wiQP6DlVfWseyMw2kR4cn3DqwV/o9fEcLlZ8AE7Ou
         5w7hR2r5YinOYvhefxmjHB80JzZ4My+ybvQnD1oSD9U8nks1IVqDlyvDOUHqYP28R5Hr
         TOq86Ausx+ISzUF1ISddz5ticszFqAQutd6LGiowlNI3gMKq97inXj5S2bTiD9u+Q1WN
         fjxzD0yVK3umdSF3ppjj0RApxdgA8PYzm8uQ3YzxqhaMilOkPrNjcR6ANmXFSaVAesB2
         ZghA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411290; x=1777016090; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x3l4XNvjOw4u0UDeeZ1RDlU1MbBbtQ9ctu1Rse+ApZA=;
        b=UCdCqzw85wLNnu5hIVDPi3w1ArKM9hTZIaIgp0webjMlCPZOwqV/PnU21O6Hc0KFZz
         GbE2M/eDS6qqIcqU6d731n/hLmr7sR+zHc8ndVG08WFGlNMtz+CVNXp9dM7EZxL8PbLC
         wpkppU8tmJnYhZQzN7+55iMrrbWijR1SaK5oUciqszXPtl2p0u7wLHxC+v1gH+blqbrz
         9ydnqlQp4fauCr3YNc9OW/1yAYo74UkXJzukwlTmvHpqdy34M1IiocBz2gQiaE2dZL1L
         YH843Ex7mvsusCIp2coXo2xM6934G5qDHRgdY6NOoFDOxdAUBdgvS+yQfkAd+WCY0lRh
         j0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411290; x=1777016090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3l4XNvjOw4u0UDeeZ1RDlU1MbBbtQ9ctu1Rse+ApZA=;
        b=KK1iCNTX0JWQZ58uYOUHH0iiqXJ+aS1AJZ62KKlwaTjsoBnzifPjQ6dL6l5/xga2xZ
         RIeii/0Fsa+7yo3Hs1lxftIzpO1tpk0s+HhgEqEouYdUseh8uQ2h5uuAYeVVxEjGABmC
         uYybWT6usraE5tzkhMMpUrsaSNL463oKHNt9wMT6vnr4MTaHL5V6ut3p6OXII2Hui809
         mIej5Gy4dkBizS3lu+pffJb5V1OR4OnGP6lWvCruiEfsq+8juaJLio35loFLJAm8quEB
         QZtZy8nXsTSr1peu2V6cHy64A0939NFs2R3VmawYb0dvAtbZ7GGXVhwDsomX1xVc8L65
         kCdw==
X-Forwarded-Encrypted: i=1; AFNElJ9MIXovJNseImX3soIf55Sqihnvdy/WEjKw16//PswEhScvdbZ09yC80uygXfuBntoPBy0qcE1blrRbTE32@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+weKZmx/6ckLgzM6YpK90TfKpkN2UFPq8li0vF6AGpzZL+PBH
	DndPqNMFmazU+ZVvPLCTRJZn6vChejtZys48JWihg3xaKbK8ATps0lxDEXSpeXJVwGWvfJNmN04
	FEhfg8iSVTtk0nTZOBEf3500Tx5CwzBhbLXRHLNE=
X-Gm-Gg: AeBDieskRGcv3UkQzdtAMTRysZNTd9lWtLclHd5SyXHEc9ap2/iaxAdQ2O3yqD+V72H
	Cg0+oFX8elG59FxVziDLu+rFMyAsxM2TRtcE+n6c+NoPA3cYgRWRorB1+wgqfE4jOtuqtOlnuUu
	RLP53gQ9+v65O2+A53UQeWOo/9bWIul3T2SQ2nPpHRMCJGa3sbrWip3LxbvA7QvMB3tcAecWb+g
	LTxQcQegJ4KIVd5TLHtpoWdf4acQgDLXUrWWriQJP3h0ghrwcxE4VCeKUAmih7mfAAMh/C3yncw
	LOiy2VdHY822BnLRCyBt4HCY1UW4JxMkL2uTVBKwmxJOYLVGFCm4Y0wO12xkm5CxihYtz0i8TEd
	cY9bPpdCg2aa9ZAgQdYjp409ko8mZLLQr7QWuEn2s9wd8gtClzAlHtdofgeESwRKs+5QWXOyU0R
	YC0AfGF6ctqm5ExCGi
X-Received: by 2002:a05:600d:13:b0:488:869c:edaf with SMTP id
 5b1f17b1804b1-488fb7419c4mr17613455e9.8.1776411289757; Fri, 17 Apr 2026
 00:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416093240.1294-1-joshua.crofts1@gmail.com>
 <aeHXi8-zYZu-9NPr@ashevche-desk.local> <CALoEA-yhUTYzHUkOqAQ+nunUrH=DqzCzMS=hW5ZxO5M46ETa8Q@mail.gmail.com>
 <aeHgqpuSOxgqP6hK@ashevche-desk.local>
In-Reply-To: <aeHgqpuSOxgqP6hK@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 17 Apr 2026 09:34:38 +0200
X-Gm-Features: AQROBzAZEowh8tkjWrzaYKJaPx5c-nm3OzhOrCpN_fpFRpku-iFB9z5uZv5Jfko
Message-ID: <CALoEA-yWpZa88nTRsTCVnaNFL9w8+pq53xKY7Nh+jLgEWZYTdQ@mail.gmail.com>
Subject: Re: [PATCH v3] iio: frequency: ad9834: clean up includes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 09:26, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Yes, that's why one still needs to understand more about headers in the Linux
> kernel to do such a "simple" change.

Yup, it's definitely a task that seems easy on the surface level (but
isn't). Also the concept of
kernel.h is truly a fun one.

> Oh, surprise surprise :-), thanks for pointing this out!

No problem, surprisingly one of the things that IWYU got right.

-- 
Kind regards

CJD
